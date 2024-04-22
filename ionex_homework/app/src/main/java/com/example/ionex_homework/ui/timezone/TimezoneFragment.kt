package com.example.ionex_homework.ui.timezone

import android.view.View
import android.widget.ArrayAdapter
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.fragment.app.viewModels
import com.example.ionex_homework.R
import com.example.ionex_homework.ui.share.ShareViewModel
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.fragment_timezone.timezone_spinner
import timber.log.Timber
import java.util.TimeZone


class TimezoneFragment: Fragment(R.layout.fragment_timezone) {
    private val viewmodel: TimezoneViewModel by viewModels()
    private val shareViewModel: ShareViewModel by activityViewModels()

    override fun onStart() {
        super.onStart()
        activity?.invalidateOptionsMenu()

        prepareLayout()
        prepareObservers()
    }

    private fun prepareLayout() {
        val timezones = TimeZone.getAvailableIDs()
        val adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_item, timezones)
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        timezone_spinner.adapter = adapter
    }

    private fun prepareObservers() {
        shareViewModel.loginResponse.observe(viewLifecycleOwner) {
            viewmodel.loginResponse.value = it
        }
        viewmodel.errorMsg.observe(viewLifecycleOwner) {
            if (it.isNotEmpty()) {
                Timber.d("errorMsg $it")
                Toast.makeText(requireContext(), it, Toast.LENGTH_SHORT).show()
            }
        }
        viewmodel.showProgressBar.observe(viewLifecycleOwner) {
            if (it) requireActivity().progressBar.visibility = View.VISIBLE
            else requireActivity().progressBar.visibility = View.INVISIBLE
        }
    }
}