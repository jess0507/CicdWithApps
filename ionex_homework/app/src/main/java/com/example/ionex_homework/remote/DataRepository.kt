package com.example.ionex_homework.remote

import com.example.ionex_homework.remote.Result.Error
import com.example.ionex_homework.remote.Result.Success
import com.example.ionex_homework.remote.model.GetParkListResponse
import com.example.ionex_homework.remote.model.LoginResponse
import com.example.ionex_homework.remote.model.UpdateUserResponse
import com.example.ionex_homework.util.Constants
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

object DataRepository {
    suspend fun getParkList(): Result<GetParkListResponse> {
        return withContext(Dispatchers.IO) {
            return@withContext try {
                Success(ParkApiService.instance.getParkList())
            } catch (e: Exception) {
                Error(e)
            }
        }
    }
    suspend fun login(email: String, password: String): Result<LoginResponse> {
        return withContext(Dispatchers.IO) {
            return@withContext try {
                Success(IonexApiService.instance.login(
                    appId = Constants.appId,
                    username = email,
                    password = password
                ))
            } catch (e: Exception) {
                Error(e)
            }
        }
    }
    suspend fun updateUser(name: String, token: String): Result<UpdateUserResponse> {
        return withContext(Dispatchers.IO) {
            return@withContext try {
                Success(IonexApiService.instance.updateUser(
                    appId = Constants.appId,
                    sessionToken = token,
                    userId = name,
                ))
            } catch (e: Exception) {
                Error(e)
            }
        }
    }
}