package com.example.ionex_homework.remote

import com.google.gson.Gson
import okhttp3.Interceptor
import okhttp3.Response
import timber.log.Timber

class RetryInterceptor(private val maxRetries: Int = 3) : Interceptor {

    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        var response = chain.proceed(request)

        var attempt: Int = response.request.headers[RETRY_ATTEMP]?.toInt() ?: 0
        while (!response.isSuccessful && attempt < maxRetries) {
            val log = mapOf("class" to this.javaClass.name, "name" to "Retry http request").plus(response.headers)
            Timber.d(Gson().toJson(log))
            attempt++
            val newRequest = chain.request().newBuilder().addHeader(RETRY_ATTEMP, "$attempt").build()
            response.close()
            response = chain.proceed(newRequest)
        }
        return response
    }

    companion object {
        private const val RETRY_ATTEMP = "retryAttempt"
    }
}
