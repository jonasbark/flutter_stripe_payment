package de.jonasbark.stripepayment

import android.app.Activity
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import io.flutter.plugin.common.PluginRegistry.Registrar

interface ActivityRegistry {
    fun addListener(handler: ActivityResultListener)
    fun removeListener(handler: ActivityResultListener)
}

class StripePaymentPlugin() : FlutterPlugin, ActivityAware {
    private var flutterPluginBinding: FlutterPluginBinding? = null
    private var methodCallHandler: MethodCallHandlerImpl? = null

    companion object {
        /** Plugin registration.  */
        fun registerWith(registrar: Registrar) {
            val instance = StripePaymentPlugin()
            instance.startListening(
                    registrar.context(),
                    registrar.activity(),
                    registrar.messenger(),
                    object : ActivityRegistry {
                        override fun addListener(handler: ActivityResultListener) {
                            registrar.addActivityResultListener(handler)
                        }

                        override fun removeListener(handler: ActivityResultListener) {
                            // Not supported in V1 embedding.
                        }
                    }
            )
        }
    }

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        this.flutterPluginBinding = binding
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        this.flutterPluginBinding = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        if (flutterPluginBinding == null) {
            return
        }

        startListening(
                flutterPluginBinding!!.applicationContext,
                binding.activity,
                flutterPluginBinding!!.binaryMessenger,
                object : ActivityRegistry {
                    override fun addListener(handler: ActivityResultListener) {
                        binding.addActivityResultListener(handler)
                    }

                    override fun removeListener(handler: ActivityResultListener) {
                        binding.removeActivityResultListener(handler)
                    }
                }
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        methodCallHandler?.stopListening()
        methodCallHandler = null
    }

    private fun startListening(applicationContext: Context, activity: Activity?, messenger: BinaryMessenger?, kFunction1: ActivityRegistry) {
        methodCallHandler = MethodCallHandlerImpl(
                applicationContext,
                activity,
                messenger,
                kFunction1
        )
    }
}
