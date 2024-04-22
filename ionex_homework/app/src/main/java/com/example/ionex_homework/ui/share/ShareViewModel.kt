package com.example.ionex_homework.ui.share

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.ionex_homework.remote.model.LoginResponse
import com.example.ionex_homework.ui.login.LoginViewModel

class ShareViewModel: ViewModel() {
    var loginResponse: MutableLiveData<LoginResponse?> =    MutableLiveData(null)
    var navigationDirection = MutableLiveData("")
}