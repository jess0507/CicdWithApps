package com.example.ionex_homework.remote.model

import com.google.gson.annotations.SerializedName


data class EntrancecoordInfo (

  @SerializedName("Xcod"    ) var Xcod    : String = "",
  @SerializedName("Ycod"    ) var Ycod    : String = "",
  @SerializedName("Address" ) var Address : String = ""

)