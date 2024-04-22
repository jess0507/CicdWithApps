package com.example.ionex_homework.remote.model

import com.example.ionex_homework.remote.model.FareInfo
import com.google.gson.annotations.SerializedName


data class Park (

  @SerializedName("id"                     ) var id                    : String        = "",
  @SerializedName("area"                   ) var area                  : String        = "",
  @SerializedName("name"                   ) var name                  : String        = "",
  @SerializedName("type"                   ) var type                  : String        = "",
  @SerializedName("type2"                  ) var type2                 : String        = "",
  @SerializedName("summary"                ) var summary               : String        = "",
  @SerializedName("address"                ) var address               : String        = "",
  @SerializedName("tel"                    ) var tel                   : String        = "",
  @SerializedName("payex"                  ) var payex                 : String        = "",
  @SerializedName("serviceTime"            ) var serviceTime           : String        = "",
  @SerializedName("tw97x"                  ) var tw97x                 : String        = "",
  @SerializedName("tw97y"                  ) var tw97y                 : String        = "",
  @SerializedName("totalcar"               ) var totalcar              : Int           = 0,
  @SerializedName("totalmotor"             ) var totalmotor            : Int           = 0,
  @SerializedName("totalbike"              ) var totalbike             : Int           = 0,
  @SerializedName("totalbus"               ) var totalbus              : Int           = 0,
  @SerializedName("Pregnancy_First"        ) var PregnancyFirst        : String        = "",
  @SerializedName("Handicap_First"         ) var HandicapFirst         : String        = "",
  @SerializedName("totallargemotor"        ) var totallargemotor       : String        = "",
  @SerializedName("ChargingStation"        ) var ChargingStation       : String        = "",
  @SerializedName("Taxi_OneHR_Free"        ) var TaxiOneHRFree         : String        = "",
  @SerializedName("AED_Equipment"          ) var AEDEquipment          : String        = "",
  @SerializedName("CellSignal_Enhancement" ) var CellSignalEnhancement : String        = "",
  @SerializedName("Accessibility_Elevator" ) var AccessibilityElevator : String        = "",
  @SerializedName("Phone_Charge"           ) var PhoneCharge           : String        = "",
  @SerializedName("Child_Pickup_Area"      ) var ChildPickupArea       : String        = "",
  @SerializedName("FareInfo"               ) var FareInfo              : FareInfo?      = FareInfo(),
  @SerializedName("EntranceCoord"          ) var EntranceCoord         : EntranceCoord? = EntranceCoord()

)