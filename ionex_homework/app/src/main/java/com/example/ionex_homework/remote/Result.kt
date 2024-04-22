package com.example.ionex_homework.remote

sealed class Result<out R> {
    data class Success<out T>(val data: T): Result<T>()
    data class Error(val exception: Exception) : Result<Nothing>()
}