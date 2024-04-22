package com.example.ionex_homework.ui.park

import android.view.Gravity
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.appcompat.widget.LinearLayoutCompat
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.ionex_homework.R
import com.example.ionex_homework.databinding.ItemParkBinding
import com.example.ionex_homework.remote.model.Park
import com.example.ionex_homework.util.dpToPx
import com.google.gson.Gson
import timber.log.Timber

class ParkAdapter : ListAdapter<Park, ParkAdapter.ParkHolder>(ItemDiffCallback) {
    class ParkHolder(val itemview: ItemParkBinding) : RecyclerView.ViewHolder(itemview.root)
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ParkHolder {
        var binding = ItemParkBinding.inflate(LayoutInflater.from(parent.context))
        LayoutInflater.from(parent.context).inflate(R.layout.item_park, parent, false)

        val lp = LinearLayoutCompat.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        )
        val margin = 12
        lp.gravity = Gravity.CENTER
        lp.setMargins(margin.dpToPx(), margin.dpToPx(), margin.dpToPx(), margin.dpToPx())

        binding.root.setLayoutParams(lp)
        val padding = 12
        binding.root.setPadding(padding.dpToPx(), padding.dpToPx(), padding.dpToPx(), padding.dpToPx())
        return ParkHolder(binding)
    }

    // Called by RecyclerView to display the data at the specified position.
    override fun onBindViewHolder(holder: ParkHolder, position: Int) {
        Timber.d("onBindViewHolder $position, ${getItem(position)}")

        val formNextLine = holder.itemView.context.resources.getString(R.string.form_next_line)
        val formId = holder.itemView.context.resources.getString(R.string.form_id)
        val formName = holder.itemView.context.resources.getString(R.string.form_name)
        val formAddress = holder.itemView.context.resources.getString(R.string.form_address)
        val formTotalCar = holder.itemView.context.resources.getString(R.string.form_total_car)
        val formTotalStandby = holder.itemView.context.resources.getString(R.string.form_total_standby)
        val formTotalIncharge = holder.itemView.context.resources.getString(R.string.form_total_incharge)
        holder.itemview.parkDetail.text = "$formId${getItem(position).id}$formNextLine" +
                "$formName${getItem(position).name}$formNextLine" +
                "$formAddress${getItem(position).address}$formNextLine" +
                "$formTotalCar${getItem(position).totalcar}$formNextLine" +
                "$formTotalStandby${getItem(position).ChargingStation}$formNextLine"
    }
}

object ItemDiffCallback: DiffUtil.ItemCallback<Park>() {
    override fun areItemsTheSame(oldItem: Park, newItem: Park): Boolean {
        return oldItem.id == newItem.id
    }

    override fun areContentsTheSame(oldItem: Park, newItem: Park): Boolean {
        var gson = Gson()
        return gson.toJson(oldItem) == gson.toJson(newItem)
    }
}