package com.ruan.fluttercherry

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        registerCustomPlugin(this)
    }
    /**
     * 插件注册
     */
    private fun registerCustomPlugin(registrar: PluginRegistry) {
        ChiperAesPlugin.registerWith(registrar.registrarFor(ChiperAesPlugin.channel))
    }
}
