package com.example.ionex_homework.remote.model

import com.example.ionex_homework.remote.model.EntrancecoordInfo
import com.google.gson.annotations.SerializedName


data class EntranceCoord (

  @SerializedName("EntrancecoordInfo" ) var EntrancecoordInfo : ArrayList<EntrancecoordInfo> = arrayListOf()

)