package com.example.coffers_app

import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.location.LocationManager
import android.net.Uri
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {


    private val channelName = "com.example.coffers_app/coffees-location"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        .setMethodCallHandler {
            call, result ->
            if (call.method == "coffees-location"){
                statusCheck()
                result.success("Teste5")

            } else result.notImplemented()

        }
    }

    private fun openMap(){
        val gmmIntentUri =
            Uri.parse("geo:0,0?z=10&q=coffees")
        val mapIntent = Intent(Intent.ACTION_VIEW, gmmIntentUri)
        mapIntent.setPackage("com.google.android.apps.maps")
        startActivity(mapIntent)
    }


    private fun statusCheck() {
        val manager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        if (!manager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
            buildAlertMessageNoGps()
        } else openMap()
    }

    private fun buildAlertMessageNoGps() {
        val builder = AlertDialog.Builder(this)
        builder.setMessage("Ative sua localização para localizarmos as melhores cafeterias perto de você!")
            .setCancelable(false)
            .setPositiveButton(
                "Sim"
            ) { dialog, id -> startActivity(Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS)) }
            .setNegativeButton(
                "Não"
            ) { dialog, id -> dialog.cancel() }
        val alert = builder.create()
        alert.show()
    }

}