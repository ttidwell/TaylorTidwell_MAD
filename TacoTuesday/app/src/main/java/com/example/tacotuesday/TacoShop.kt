package com.example.tacotuesday

data class TacoShop (var name: String = "", var url: String = ""){
    fun suggestTacoShop(position: Int){
        setTacoShopName(position)
        setTacoShopUrl(position)
    }

    private fun setTacoShopName(position: Int){
        when (position){
            1 -> name="Illegal Pete's"
            2 -> name="Chipotle"
            3 -> name="Bartaco"
            else -> name="Taco shop of your choice"
        }
    }

    private fun setTacoShopUrl(position: Int){
        when(position){
            1 -> url="https://www.illegalpetes.com"
            2 -> url="https://location.chipotle.com/co/boulder/1650-29th-st"
            3 -> url="https://bartaco.com"
            else -> url="https://www.google.com/search?q=boulder+taco+shop"
        }
    }
}