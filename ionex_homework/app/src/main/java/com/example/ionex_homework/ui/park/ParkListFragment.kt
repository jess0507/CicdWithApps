package com.example.ionex_homework.ui.park

import android.view.View
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.fragment.app.viewModels
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout.OnRefreshListener
import com.example.ionex_homework.R
import com.example.ionex_homework.ui.share.ShareViewModel
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.park_list.recycle_view
import kotlinx.android.synthetic.main.park_list.swipe_refresh_layout
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import timber.log.Timber


class ParkListFragment: Fragment(R.layout.park_list) {
    private val viewmodel: ParkListViewModel by viewModels()
    private var parkAdapter: ParkAdapter = ParkAdapter()

    override fun onStart() {
        super.onStart()
        activity?.invalidateOptionsMenu()

        prepareLayout()
        prepareObservers()

        viewmodel.getParkList()
    }

    private fun prepareLayout() {
        recycle_view.adapter = parkAdapter

        swipe_refresh_layout.setOnRefreshListener {
            viewmodel.getParkList()

            CoroutineScope(Dispatchers.IO).launch {
                try {
                    delay(2000)
                    withContext(Dispatchers.Main) {
                        swipe_refresh_layout.isRefreshing = false
                    }
                } catch (e: Exception) {
                    withContext(Dispatchers.Main) {
                        swipe_refresh_layout.isRefreshing = false
                    }
                }
            }
        }
    }

    private fun prepareObservers() {
        viewmodel.parkList.observe(viewLifecycleOwner) {
            Timber.d("users size: ${it.size}")
            if (it.isNotEmpty()) {
                parkAdapter.submitList(it)
            } else {
                parkAdapter.submitList(emptyList())
            }
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