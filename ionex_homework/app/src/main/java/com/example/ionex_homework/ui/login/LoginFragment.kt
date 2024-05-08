package com.example.ionex_homework.ui.login

import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.findNavController
import com.example.ionex_homework.BuildConfig
import com.example.ionex_homework.R
import com.example.ionex_homework.ui.share.ShareViewModel
import com.example.ionex_homework.util.setOnSafeClickListener
import kotlinx.android.synthetic.main.activity_main.progressBar
import kotlinx.android.synthetic.main.fragment_login.email_edit_text
import kotlinx.android.synthetic.main.fragment_login.login_button
import kotlinx.android.synthetic.main.fragment_login.password_edit_text
import kotlinx.android.synthetic.main.fragment_login.skip_button
import timber.log.Timber

class LoginFragment : Fragment(R.layout.fragment_login) {
    private val viewmodel: LoginViewModel by viewModels()
    private val shareViewModel: ShareViewModel by activityViewModels()

    override fun onStart() {
        Timber.d("onStart")
        super.onStart()
        prepareLayout()
        prepareObservers()
    }

    private fun prepareLayout() {
        login_button.setOnSafeClickListener {
            viewmodel.login()
        }
        if (BuildConfig.DEBUG) {
            skip_button.visibility = View.VISIBLE
            skip_button.setOnSafeClickListener {
                viewmodel.trySkip()
            }
        } else {
            skip_button.visibility = View.INVISIBLE
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
        viewmodel.isLoginOrSkip.observe(viewLifecycleOwner) {
            Timber.d("isLoginOrSkip: $it")
            if (!it) return@observe
            viewmodel.afterLogin()
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

    override fun onDestroy() {
        Timber.d("onDestroy")
        super.onDestroy()
    }
}