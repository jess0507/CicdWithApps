package com.example.ionex_homework.util
import android.content.res.Resources
import android.util.TypedValue
import android.view.View

fun Float.dpToPx(): Int {
    return TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP, this,
        Resources.getSystem().displayMetrics
    ).toInt()
}

fun Int.dpToPx(): Int {
    return TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP, this.toFloat(),
        Resources.getSystem().displayMetrics
    ).toInt()
}

fun View.setOnSafeClickListener(onSafeClick: (View) -> Unit) {
    this.setOnClickListener(SafeClickListener(onSafeClick = onSafeClick))
}