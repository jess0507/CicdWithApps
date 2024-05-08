package com.example.ionex_homework

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.NavController
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import androidx.navigation.ui.setupActionBarWithNavController
import com.example.ionex_homework.ui.share.ShareViewModel
import kotlinx.android.synthetic.main.activity_main.customLayout
import kotlinx.android.synthetic.main.activity_main.toolbar

class MainActivity : AppCompatActivity() {
    lateinit var navController: NavController

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val navHostFragment = supportFragmentManager.findFragmentById(R.id.nav_host_fragment_container) as NavHostFragment
        navController = navHostFragment.findNavController()
        setSupportActionBar(toolbar)
        setupActionBarWithNavController(navController)
        navController.addOnDestinationChangedListener { _, destination, _ ->
            if (destination.id == R.id.fragment_login) {
                // 在 fragment_login 中隱藏 Toolbar
                toolbar.visibility = View.GONE
            } else {
                // 在其他片段中顯示 Toolbar
                toolbar.visibility = View.VISIBLE
            }
        }

        var shareViewModel = ViewModelProvider(this)[ShareViewModel::class.java]
        customLayout.setShareViewModel(shareViewModel)
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        when (navController.currentDestination?.id) {
            R.id.fragment_park_list -> {
                // 在 fragment_park_list 中顯示 "Timezone" 按鈕
                menuInflater.inflate(R.menu.menu, menu)
            }
            // 其他情況不顯示任何菜單
            else -> {
                menu?.clear()
            }
        }
        return true
    }

    override fun onSupportNavigateUp(): Boolean {
        return navController.navigateUp() || super.onSupportNavigateUp()
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // Handle item selection
        return when (item.itemId) {
            R.id.action_timezone -> {
                // 點擊時導航到 fragment_timezone
                navController.navigate(R.id.action_fragment_park_list_to_fragment_timezone)
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}