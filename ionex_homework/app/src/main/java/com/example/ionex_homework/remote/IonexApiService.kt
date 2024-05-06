package com.example.ionex_homework.remote

import com.example.ionex_homework.remote.model.LoginResponse
import com.example.ionex_homework.remote.model.UpdateUserResponse
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.Header
import retrofit2.http.POST
import retrofit2.http.PUT
import retrofit2.http.Path

interface IonexApiService {
    @POST("api/login")
    @FormUrlEncoded
    suspend fun login(
        @Header("X-Parse-Application-Id") appId: String,
        @Field("username") username: String,
        @Field("password") password: String
    ): LoginResponse

    @PUT("api/users/{userId}")
    suspend fun updateUser(
        @Header("X-Parse-Application-Id") appId: String,
        @Header("X-Parse-Session-Token") sessionToken: String,
        @Path("userId") userId: String,
    ): UpdateUserResponse

    companion object {
        private fun create(baseUrl: String): IonexApiService {
            val okHttpClient = OkHttpClient.Builder()
                .addInterceptor(HttpLoggingInterceptor())
                .addInterceptor(RetryInterceptor())
                .addInterceptor { chain ->
                    var request = chain.request()
                    var response = chain.proceed(request)
                    var tryCount = 0
                    while (!response.isSuccessful && tryCount < 3) {
                        tryCount++
                        response.close()
                        request = request.newBuilder().build()
                        response = chain.proceed(request)
                    }
                    response
                }
                .build()

            return Retrofit.Builder()
                .client(okHttpClient)
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
                .create(IonexApiService::class.java)
        }

        val instance = create("https://noodoe-app-development.web.app")
    }
}