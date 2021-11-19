package com.example.tacotuesday

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    var message: String = ""
    var review: String = ""
    var imageId: Int? = null
    lateinit var messageTextView : TextView
    lateinit var imageTaco : ImageView
    lateinit var filling : CharSequence
    lateinit var layoutRoot : ConstraintLayout
    lateinit var radioGroup : RadioGroup
    lateinit var checkBox1 : CheckBox
    lateinit var checkBox2 : CheckBox
    lateinit var checkBox3 : CheckBox
    lateinit var checkBox4 : CheckBox
    lateinit var spinner : Spinner
    lateinit var veganSwitch : SwitchMaterial
    lateinit var locationButton : Button
    lateinit var reviewTextView : TextView

    private var myTacoShop = TacoShop()
    private var selectedLocationPosition = 0
    private val REQUEST_CODE = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        messageTextView = findViewById(R.id.messageTextView)
        imageTaco = findViewById(R.id.imageView)
        filling = ""
        layoutRoot = findViewById(R.id.root_layout)
        radioGroup = findViewById(R.id.radioGroup) //INT
        checkBox1 = findViewById(R.id.checkBox1)
        checkBox2 = findViewById(R.id.checkBox2)
        checkBox3 = findViewById(R.id.checkBox3)
        checkBox4 = findViewById(R.id.checkBox4)
        spinner = findViewById(R.id.spinner)
        veganSwitch = findViewById(R.id.switch1)
        locationButton = findViewById(R.id.locationButton)
        reviewTextView = findViewById(R.id.reviewtextView)

        // event listener
        locationButton.setOnClickListener{
            selectedLocationPosition = spinner.selectedItemPosition
            myTacoShop.suggestTacoShop(selectedLocationPosition)
            Log.i("shop suggested", myTacoShop.name)
            Log.i("url suggested", myTacoShop.url)

            // create intent
            val intent = Intent(this, TacoLocationActivity::class.java)
            intent.putExtra("tacoShopName", myTacoShop.name)
            intent.putExtra("tacoShopUrl", myTacoShop.url)

//            startActivity(intent)
            startActivityForResult(intent, REQUEST_CODE)
        }
    }

    fun createTaco(view: View) {

        var toppingList = ""
        val fillingId = radioGroup.checkedRadioButtonId

        if (fillingId == -1){
            //snackbar
            val fillingSnackBar = Snackbar.make(layoutRoot, "Please Select Filling", Snackbar.LENGTH_SHORT)
            fillingSnackBar.show()
        } else {
            filling = findViewById<RadioButton>(fillingId).text //text is a char sequence
            if (checkBox1.isChecked){
                toppingList += " " + checkBox1.text
            }
            if (checkBox2.isChecked){
                toppingList += " " + checkBox2.text
            }
            if (checkBox3.isChecked){
                toppingList += " " + checkBox3.text
            }
            if (checkBox4.isChecked){
                toppingList += " " + checkBox4.text
            }
            if (toppingList.isNotEmpty()){
                toppingList = "with" + toppingList
            }

            val location  = "at " +spinner.selectedItem

            if (veganSwitch.isChecked){
                filling = veganSwitch.text.toString() + " $filling"
            }
            //imageview
            imageId = R.drawable.taco
            //textview
            message = "You'd like a $filling taco $toppingList $location"
        }
        updateUI()
    }

    fun updateUI(){
        //text view
        messageTextView.text = message
        reviewTextView.text = review
        //image view
        imageId?.let { imageTaco.setImageResource(it) }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("message", message)
        outState.putString("review", review)
        imageId?.let { outState.putInt("image", it) }
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", message)
        review = savedInstanceState.getString("review", review)
        imageId = savedInstanceState.getInt("image")
        updateUI()
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if((requestCode == REQUEST_CODE) && (resultCode == Activity.RESULT_OK)){
            reviewTextView.setText(data?.let{data.getStringExtra("feedback")})
            review = reviewTextView.text.toString()
        }
    }
}