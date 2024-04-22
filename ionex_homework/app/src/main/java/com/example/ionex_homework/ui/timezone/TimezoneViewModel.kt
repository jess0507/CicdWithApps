package com.example.ionex_homework.ui.timezone

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.ionex_homework.remote.DataRepository
import com.example.ionex_homework.remote.Result
import com.example.ionex_homework.remote.model.LoginResponse
import com.example.ionex_homework.remote.model.UpdateUserResponse
import kotlinx.coroutines.launch
import timber.log.Timber

class TimezoneViewModel: ViewModel() {
    var loginResponse: MutableLiveData<LoginResponse?> =    MutableLiveData(null)
    var updateUserResponse: MutableLiveData<UpdateUserResponse?> =    MutableLiveData(null)
    var showProgressBar = MutableLiveData(false)
    var errorMsg = MutableLiveData("")

    fun updateTimezone(name: String, token: String) {
        viewModelScope.launch {
            showProgressBar.value = true
            DataRepository.updateUser(name, token).let {
                showProgressBar.value = false
                if (it is Result.Success) {
                    Timber.d("updateUserResponse: ${it.data}")
                    updateUserResponse.value = it.data
                } else {
                    errorMsg.value = it.toString()
                }
            }
        }
    }
}