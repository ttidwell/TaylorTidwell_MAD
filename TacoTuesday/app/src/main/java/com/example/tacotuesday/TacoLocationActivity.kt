package com.example.tacotuesday

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.tacotuesday.databinding.ActivityTacoLocationBinding

class TacoLocationActivity : AppCompatActivity() {

    private lateinit var binding: ActivityTacoLocationBinding

    lateinit var tacoShopTextView : TextView
    lateinit var feedbackEditText : TextView

    private var tacoShopName : String? = null
    private var tacoShopUrl : String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityTacoLocationBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        // view
        tacoShopTextView = findViewById(R.id.tacoShopTextView)
        feedbackEditText = findViewById(R.id.feedbackEditText)

        // intent data
        tacoShopName = intent.getStringExtra("tacoShopName")
        tacoShopUrl = intent.getStringExtra("tacoShopUrl")

        tacoShopName?.let {tacoShopTextView.text = "You should get tacos at $tacoShopName"}

        binding.fab.setOnClickListener { view ->
            loadWebsite()
        }
    }

    override fun onBackPressed() {
        val data = Intent()
        data.putExtra("feedback", feedbackEditText.text.toString())
        setResult(Activity.RESULT_OK, data) // must be set before super.onBackPressed()
        super.onBackPressed()
        finish()
    }

    private fun loadWebsite(){
        // create intent
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = tacoShopUrl?.let{ Uri.parse(tacoShopUrl)}

        // verify that the intent will resolve to an activity
        if (intent.resolveActivity(packageManager) != null){
            // start activity
            startActivity(intent)
        } else {
            // TODO create a snack bar to inform user of error
        }
    }
}