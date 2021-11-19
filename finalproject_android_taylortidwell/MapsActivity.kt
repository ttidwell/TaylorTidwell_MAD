package com.example.finalproject_android_taylortidwell

import android.content.Intent
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.example.finalproject_android_taylortidwell.databinding.ActivityMapsBinding
import com.google.android.gms.maps.*

import android.graphics.Typeface

import android.view.Gravity
import android.view.View
import android.widget.*

import com.google.android.gms.maps.model.Marker

import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.GoogleMap.InfoWindowAdapter
import com.google.android.gms.maps.model.BitmapDescriptorFactory

class MapsActivity : AppCompatActivity(), OnMapReadyCallback {

    lateinit var treeCheckBox : CheckBox
    lateinit var cafeCheckBox : CheckBox
    lateinit var pavillionCheckBox : CheckBox
    lateinit var skateParkCheckBox : CheckBox
    lateinit var lightsCheckBox : CheckBox
    lateinit var sportCheckBox : CheckBox
    lateinit var splashCheckBox : CheckBox
    lateinit var gardenCheckBox : CheckBox
    lateinit var pathsCheckBox : CheckBox
    lateinit var picnicCheckBox : CheckBox
    lateinit var furnitureCheckBox : CheckBox
    lateinit var benchesCheckBox : CheckBox
    lateinit var createParkButton : Button

    lateinit var markerTitle : TextView
    var markerSf = ""

    private lateinit var mMap: GoogleMap
    private lateinit var binding: ActivityMapsBinding
    private  var myPark = ParkAxon()
    private var ammenitiesChoise = arrayListOf<CheckBox>()

    val parkTitlesArray = arrayListOf("Russell Woods","Littlefield","Barton-McFarland","Dexter-Fenkell","Nardin Park","Wildemere Park")
    val parkSfArray = arrayListOf("10,800 SF","16,200 SF","13,400 SF","15,900 SF","21,500 SF","18,000 SF")
    val parkUseArray = arrayListOf("Abandoned Warehouse","Vacant Lot","Open Space","Vacant Lot","Unoccupied City Block","Vacant Middle School")
    val parkNum = arrayListOf<LatLng>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMapsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        markerTitle = findViewById(R.id.markerTextView)

        val options = GoogleMapOptions()
            .liteMode(true)

        treeCheckBox = findViewById(R.id.trees)
        cafeCheckBox = findViewById(R.id.cafeCheckbox)
        pavillionCheckBox = findViewById(R.id.pavillionCheckbox)
        skateParkCheckBox = findViewById(R.id.skateParkCheckbox)
        lightsCheckBox = findViewById(R.id.lightingCheckbox)
        sportCheckBox = findViewById(R.id.sportCheckbox)
        splashCheckBox = findViewById(R.id.splashCheckbox)
        gardenCheckBox = findViewById(R.id.gardenCheckbox)
        pathsCheckBox = findViewById(R.id.pathCheckbox)
        picnicCheckBox = findViewById(R.id.picnicCheckbox)
        furnitureCheckBox = findViewById(R.id.furnitureCheckbox)
        benchesCheckBox = findViewById(R.id.benchCheckbox)
        createParkButton = findViewById(R.id.createNewParkButton)

        ammenitiesChoise.add(treeCheckBox)
        ammenitiesChoise.add(cafeCheckBox)
        ammenitiesChoise.add(pavillionCheckBox)
        ammenitiesChoise.add(skateParkCheckBox)
        ammenitiesChoise.add(lightsCheckBox)
        ammenitiesChoise.add(splashCheckBox)
        ammenitiesChoise.add(sportCheckBox)
        ammenitiesChoise.add(gardenCheckBox)
        ammenitiesChoise.add(pathsCheckBox)
        ammenitiesChoise.add(picnicCheckBox)
        ammenitiesChoise.add(furnitureCheckBox)
        ammenitiesChoise.add(benchesCheckBox)

        // event listener
        createParkButton.setOnClickListener {
            myPark.displayParkAxon()

            // create intent
            val intent = Intent(this, ParkAxon::class.java)
//            intent.putExtra("parkAxonImage", myPark.parkAxonImage)
            intent.putExtra("parkTitle", markerTitle.text)
            intent.putExtra("parkSf", markerSf)
//            intent.putExtra("parkUse", myPark.parkUse)

            startActivity(intent)
        }

            //      TODO create snack bar asking user to select checkbox

            // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        val mapFragment = supportFragmentManager
            .findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)
    }

    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap

        val park_1 = LatLng(42.3830, -83.1366)
        val park_2 = LatLng(42.38677570285364, -83.15776648322722)
        val park_3 = LatLng(42.36494794475046, -83.15890968251524)
        val park_4 = LatLng(42.39473498740162, -83.12159271824379)
        val park_5 = LatLng(42.372308439344984, -83.14212940377479)
        val park_6 = LatLng(42.36490460184187, -83.12125278548179)

        parkNum.add(park_1)
        parkNum.add(park_2)
        parkNum.add(park_3)
        parkNum.add(park_4)
        parkNum.add(park_5)
        parkNum.add(park_6)

        /* code for multiline marker text modified from
        https://stackoverflow.com/questions/13904651/android-google-maps-v2-how-to-add-marker-with-multiline-snippet
         */
        for (i in parkTitlesArray.indices){
            with(mMap) {
                addMarker(MarkerOptions().position(parkNum[i]).title(parkTitlesArray[i]).snippet(
                        """
                    ${parkSfArray[i]}
                    ${parkUseArray[i]}
                    """.trimIndent()).icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_RED))
                    )
            }
        }

        mMap?.let{
            it.setOnMarkerClickListener{
                markerTitle.text = it.title
                markerSf = it.snippet.toString()
                false
            }
        }

        mMap.moveCamera(CameraUpdateFactory.newLatLng(park_1))

        mMap.setInfoWindowAdapter(object : InfoWindowAdapter {
            override fun getInfoWindow(arg0: Marker): View? {
                return null
            }

            override fun getInfoContents(marker: Marker): View {
                val info = LinearLayout(this@MapsActivity)
                info.orientation = LinearLayout.VERTICAL
                val title = TextView(this@MapsActivity)
                title.setTextColor(Color.BLACK)
                title.gravity = Gravity.CENTER
                title.setTypeface(null, Typeface.BOLD)
                title.text = marker.title
                val snippet = TextView(this@MapsActivity)
                snippet.setTextColor(Color.GRAY)
                snippet.text = marker.snippet
                info.addView(title)
                info.addView(snippet)
                return info
            }
        })
    }
}

