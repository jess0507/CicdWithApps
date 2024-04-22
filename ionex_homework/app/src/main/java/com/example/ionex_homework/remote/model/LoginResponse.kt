package com.example.ionex_homework.remote.model

import com.google.gson.annotations.SerializedName
data class LoginResponse (

    @SerializedName("objectId"     ) var objectId     : String = "",
    @SerializedName("name"         ) var name         : String = "",
    @SerializedName("timezone"     ) var timezone     : String = "",
    @SerializedName("phone"        ) var phone        : String = "",
    @SerializedName("createdAt"    ) var createdAt    : String = "",
    @SerializedName("updatedAt"    ) var updatedAt    : String = "",
    @SerializedName("sessionToken" ) var sessionToken : String = ""

)