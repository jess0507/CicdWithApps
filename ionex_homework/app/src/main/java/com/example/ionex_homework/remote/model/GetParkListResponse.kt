package com.example.ionex_homework.remote.model

import com.example.ionex_homework.remote.model.Park
import com.google.gson.annotations.SerializedName


data class GetParkListResponse(
  @SerializedName("data") val data: ParkData
)

data class ParkData (
  @SerializedName("UPDATETIME" ) var UPDATETIME : String = "",
  @SerializedName("park"       ) var park       : ArrayList<Park> = arrayListOf()
)