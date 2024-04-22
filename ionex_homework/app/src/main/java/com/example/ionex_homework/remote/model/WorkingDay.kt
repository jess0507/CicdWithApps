package com.example.ionex_homework.remote.model

import com.google.gson.annotations.SerializedName


data class WorkingDay (

  @SerializedName("Period" ) var Period : String = "",
  @SerializedName("Fare"   ) var Fare   : String = ""

)