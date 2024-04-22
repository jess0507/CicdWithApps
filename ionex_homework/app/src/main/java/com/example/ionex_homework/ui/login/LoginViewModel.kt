package com.example.ionex_homework.ui.login

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.ionex_homework.remote.DataRepository
import kotlinx.coroutines.launch
import timber.log.Timber
import com.example.ionex_homework.remote.Result
import com.example.ionex_homework.remote.model.LoginResponse

class LoginViewModel: ViewModel() {
    private val _email = MutableLiveData<String>()
    val email: LiveData<String> = _email

    private val _password = MutableLiveData<String>()
    val password: LiveData<String> = _password

    fun setEmail(newUsername: String) {
        _email.value = newUsername
    }

    fun setPassword(newPassword: String) {
        _password.value = newPassword
    }
    var loginResponse: MutableLiveData<LoginResponse?> =    MutableLiveData(null)
    var isLogin: MutableLiveData<Boolean> = MutableLiveData(false)
    var showProgressBar = MutableLiveData(false)
    var errorMsg = MutableLiveData("")


    fun login() {
        viewModelScope.launch {
            showProgressBar.value = true
            val emailValue = email.value ?: ""
            val pwdValue = password.value ?: ""
            DataRepository.login(email = emailValue, password = pwdValue).let {
                when(it) {
                    is Result.Success -> {
                        loginResponse.value = it.data
                        if (!it.data.sessionToken.isNullOrEmpty()) {
                            isLogin.value = true
                        }
                        showProgressBar.value = false
                    }
                    is Result.Error -> {
                        errorMsg.value = it.toString()
                        showProgressBar.value = false
                    }
                }
            }
        }
    }
}