package com.example.finalproject_android_taylortidwell

import android.app.Activity
import android.content.Intent
import android.graphics.drawable.Drawable
import android.media.Image
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.ImageView
import android.widget.TextView
import androidx.annotation.RequiresApi
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.navigateUp
import androidx.navigation.ui.setupActionBarWithNavController
import com.example.finalproject_android_taylortidwell.databinding.ActivityParkAxonDisplayBinding
import java.util.stream.Stream
import kotlin.random.Random
import kotlin.random.asJavaRandom

class ParkAxonDisplayActivity : AppCompatActivity() {

    private lateinit var binding: ActivityParkAxonDisplayBinding
    lateinit var parkTitleTextView : TextView
    lateinit var parkSfTextView : TextView
    lateinit var parkAxonImageView : ImageView

    private var parkTitle : String? = null
    private var parkSf : String? = null
    private var parkAxonImage : Drawable? = null

    private var parkImageArray = arrayOf(R.drawable.park_fountain_garden, R.drawable.park_fountain_pavillion,
        R.drawable.park_skatepark_pavilion_sidewalks, R.drawable.park_skatepark_splashpad, R.drawable.park_skatepark_trees)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityParkAxonDisplayBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setSupportActionBar(binding.toolbar)

        //view
        parkTitleTextView = findViewById(R.id.parkTitleTextView)
        parkSfTextView = findViewById(R.id.parkSFTextView)
//        parkUseTextView = findViewById(R.id.parkUseTextView)
        parkAxonImageView = findViewById(R.id.parkAxonImageView)

        //intent data
        parkTitle = intent.getStringExtra("parkTitle")
        parkSf = intent.getStringExtra("parkSf")
//        parkUse = intent.getStringExtra("parkUse")

        parkTitle?.let {parkTitleTextView.text = "$parkTitle"}
        parkSf?.let {parkSfTextView.text = "$parkSf"}
//        parkUse?.let{parkUseTextView.text = "$parkUse"}

        val randomIndex = Random.nextInt(parkImageArray.size);
        val randomElement = parkImageArray[randomIndex]
//        parkAxonImage = randomElement

        binding.fab.setOnClickListener { view ->
            loadCityWebsite()
        }
    }

    override fun onBackPressed() {
        super.onBackPressed()
        finish()
    }

    private fun loadCityWebsite(){
        // create intent
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = let{ Uri.parse("https://detroitmi.gov/departments/planning-and-development-department/neighborhood-plans")}

        // verify that the intent will resolve to an activity
        if (intent.resolveActivity(packageManager) != null){
            // start activity
            startActivity(intent)
        }
    }
}