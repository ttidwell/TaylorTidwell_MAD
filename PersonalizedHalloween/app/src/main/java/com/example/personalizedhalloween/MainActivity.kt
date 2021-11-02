package com.example.personalizedhalloween

import android.os.Bundle
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun sayBoo(view: android.view.View) {
        val booText = findViewById<TextView>(R.id.textMessage)
        val editName = findViewById<EditText>(R.id.editTextName)
        val name = editName.text
        booText.text = "Look behind you " + name + "!"

        val imageGhost = findViewById<ImageView>(R.id.imageView)
        imageGhost.setImageResource(R.drawable.ic_jason)
    }
}