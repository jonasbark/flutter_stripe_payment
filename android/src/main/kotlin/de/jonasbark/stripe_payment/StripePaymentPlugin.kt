package de.jonasbark.stripe_payment

import android.app.Activity
import android.content.Context
import android.os.Handler
import androidx.annotation.CheckResult
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import io.flutter.plugin.common.PluginRegistry.Registrar

interface ActivityRegistry {
    fun addListener(handler: ActivityResultListener): Boolean

    @CheckResult
    fun removeListener(handler: ActivityResultListener): Boolean
}

class StripePaymentPlugin : FlutterPlugin, ActivityAware {
    private var flutterPluginBinding: FlutterPluginBinding? = null

    private var methodChannel: MethodChannel? = null


    private val mainHandler = Handler()

    @Suppress("unused")
    companion object {
        /** Plugin registration.  */
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val instance = StripePaymentPlugin()
            instance.startListening(
                    registrar.context(),
                    registrar.activity(),
                    registrar.messenger(),
                    object : ActivityRegistry {
                        override fun addListener(handler: ActivityResultListener): Boolean {
                            registrar.addActivityResultListener(handler)
                            return true
                        }

                        override fun removeListener(handler: ActivityResultListener): Boolean {
                            // Not supported in V1 embedding.
                            return false
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
                    override fun addListener(handler: ActivityResultListener): Boolean {
                        mainHandler.post {
                            binding.addActivityResultListener(handler)
                        }
                        return true
                    }


                    override fun removeListener(handler: ActivityResultListener): Boolean {
                        mainHandler.post {
                            binding.removeActivityResultListener(handler)
                        }
                        return true
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
        stopListening()
    }

    private fun startListening(applicationContext: Context, activity: Activity?, messenger: BinaryMessenger?, activityRegistry: ActivityRegistry) {
        methodChannel = MethodChannel(messenger, "stripe_payment")
        methodChannel?.setMethodCallHandler(MethodCallHandlerImpl(
                applicationContext,
                activity,
                activityRegistry
        ))
    }

    private fun stopListening() {
        methodChannel?.setMethodCallHandler(null)
        methodChannel = null
    }
}
