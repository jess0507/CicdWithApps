package com.example.ionex_homework.remote.model

import com.google.gson.annotations.SerializedName


data class FareInfo (

  @SerializedName("Holiday"    ) var Holiday    : ArrayList<Holiday>    = arrayListOf(),
  @SerializedName("WorkingDay" ) var WorkingDay : ArrayList<WorkingDay> = arrayListOf()

)