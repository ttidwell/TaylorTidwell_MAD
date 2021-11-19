package com.example.finalproject_android_taylortidwell

import android.widget.ImageView
import com.google.android.gms.maps.model.LatLng
import kotlin.random.Random

data class ParkAxon(/*var parkAxonImage: ImageView? = null,*/ var parkTitle: String = "", var parkSf: String = "", var parkUse: String = "") {

    var mainPark = MapsActivity()

    fun displayParkAxon(){
//        setParkAxon()
        setParkTitle()
        setParkSf()
    }

//    private fun setParkAxon(){
//        val randomIndex = Random.nextInt(parkImageArray.size);
//        val randomElement = parkImageArray[randomIndex]
//        parkAxonImage = parkImageArray[randomElement]
//    }

    private fun setParkTitle() {
//        parkTitle = title.markerTitle.text as String
        parkTitle = mainPark.markerTitle.toString()
//        when () {
//            0 -> parkSf = "10,800 SF"
//            1 -> parkSf = "16,200 SF"
//            2 -> parkSf = "13,400 SF"
//            3 -> parkSf = "15,900 SF"
//            4 -> parkSf = "21,500 SF"
//            else -> parkSf = "18,000 SF"
    }

    private fun setParkSf() {
        parkSf = mainPark.markerSf
//        when (position) {
//            0 -> parkSf = "10,800 SF"
//            1 -> parkSf = "16,200 SF"
//            2 -> parkSf = "13,400 SF"
//            3 -> parkSf = "15,900 SF"
//            4 -> parkSf = "21,500 SF"
//            else -> parkSf = "18,000 SF"
//        }
    }
//
//    private fun setParkUse(position: Int){
//        when(position){
//            0 -> parkUse="Abandoned Warehouse"
//            1 -> parkUse="Vacant Lot"
//            2 -> parkUse="Open Space"
//            3 -> parkUse="Vacant Lot"
//            4 -> parkUse="Unoccupied City Block"
//            else -> parkUse="Vacant Middle School"
//        }
//    }
}