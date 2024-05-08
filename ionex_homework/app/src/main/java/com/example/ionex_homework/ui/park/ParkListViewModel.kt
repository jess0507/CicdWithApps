package com.example.ionex_homework.ui.park

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.ionex_homework.remote.DataRepository
import com.example.ionex_homework.remote.Result
import com.example.ionex_homework.remote.model.Park
import kotlinx.coroutines.launch
import timber.log.Timber

class ParkListViewModel: ViewModel() {
    val parkList: MutableLiveData<List<Park>> = MutableLiveData(listOf())
    val showProgressBar = MutableLiveData(false)
    val errorMsg = MutableLiveData("")

    init {
        getParkList()
    }

    fun getParkList() {
        viewModelScope.launch {
            showProgressBar.value = true
            DataRepository.getParkList().let {
                when(it) {
                    is Result.Success -> {
                        parkList.value = parkList.value?.plus(it.data.data.park)
                        showProgressBar.value = false
                    }
                    is Result.Error -> {
                        Timber.d("errorMsg $it, exception: ${it.exception.message}")
                        errorMsg.value = it.toString()
                        showProgressBar.value = false
                    }
                }
            }
        }
    }
}