package com.example.ionex_homework.remote

import com.example.ionex_homework.remote.model.GetParkListResponse
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Streaming

interface ParkApiService {
    @GET("blobtcmsv/TCMSV_alldesc.json")
    @Streaming
    suspend fun getParkList(): GetParkListResponse

    companion object {
        private fun create(baseUrl: String): ParkApiService {
            val okHttpClient = OkHttpClient.Builder()
                .addInterceptor(HttpLoggingInterceptor().apply {
                    level = HttpLoggingInterceptor.Level.HEADERS
                })
                .addInterceptor(RetryInterceptor())
                .build()

            return Retrofit.Builder()
                .client(okHttpClient)
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
                .create(ParkApiService::class.java)
        }

        val instance = create("https://tcgbusfs.blob.core.windows.net")
    }
}