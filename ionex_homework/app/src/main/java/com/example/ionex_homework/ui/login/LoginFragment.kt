package com.example.ionex_homework.ui.login

import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.navigation.fragment.findNavController
import com.example.ionex_homework.R
import com.example.ionex_homework.remote.DataRepository
import com.example.ionex_homework.ui.share.ShareViewModel
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.fragment_login.email_edit_text
import kotlinx.android.synthetic.main.fragment_login.login_button
import kotlinx.android.synthetic.main.fragment_login.password_edit_text
import timber.log.Timber

class LoginFragment : Fragment(R.layout.fragment_login) {
    // Use the 'by viewModels()' Kotlin property delegate from the fragment-ktx artifact
    private val viewmodel: LoginViewModel by viewModels()
    private val shareViewModel: ShareViewModel by activityViewModels()

    override fun onStart() {
        super.onStart()
        prepareLayout()
        prepareObservers()
    }

    private fun prepareLayout() {
        login_button.setOnClickListener {
            viewmodel.login()
        }

        email_edit_text.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
                viewmodel.setEmail(s.toString())
            }
            override fun afterTextChanged(s: Editable?) {}
        })

        password_edit_text.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
                viewmodel.setPassword(s.toString())
            }
            override fun afterTextChanged(s: Editable?) {}
        })
    }

    private fun prepareObservers() {
        viewmodel.loginResponse.observe(viewLifecycleOwner) {
            Timber.d("loginResponse: $it")
            shareViewModel.loginResponse.value = it
        }
        viewmodel.isLogin.observe(viewLifecycleOwner) {
            Timber.d("isLogin: $it")
            if (!it) return@observe
            findNavController().navigate(R.id.action_fragment_login_to_fragment_park_list)
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