package com.example.tacotuesday

import android.os.Bundle
import android.view.View
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    var message: String = ""
    var imageId: Int? = null
    lateinit var messageTextView: TextView
    lateinit var imageTaco: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        messageTextView = findViewById(R.id.messageTextView)
        imageTaco = findViewById(R.id.imageView)
    }

    fun createTaco(view: View) {
        var filling: CharSequence = ""
        val layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)
        val radioGroup = findViewById<RadioGroup>(R.id.radioGroup) //INT

        val checkBox1 = findViewById<CheckBox>(R.id.checkBox1)
        val checkBox2 = findViewById<CheckBox>(R.id.checkBox2)
        val checkBox3 = findViewById<CheckBox>(R.id.checkBox3)
        val checkBox4 = findViewById<CheckBox>(R.id.checkBox4)

        val spinner = findViewById<Spinner>(R.id.spinner)
        val veganSwitch = findViewById<SwitchMaterial>(R.id.switch1)

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
        //image view
        imageId?.let { imageTaco.setImageResource(it) }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("message", message)
        imageId?.let { outState.putInt("image", it) }
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", message)
        imageId = savedInstanceState.getInt("image")
        updateUI()
    }
}