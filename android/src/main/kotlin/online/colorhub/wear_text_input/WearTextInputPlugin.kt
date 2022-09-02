package online.colorhub.wear_text_input

import android.app.Activity
import android.app.RemoteInput
import android.content.Intent
import android.os.Build
import android.view.inputmethod.EditorInfo
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat.startActivityForResult

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import androidx.wear.input.RemoteInputIntentHelper.Companion.createActionRemoteInputIntent
import androidx.wear.input.RemoteInputIntentHelper.Companion.putRemoteInputsExtra
import androidx.wear.input.wearableExtender


class WearTextInputPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, ActivityResultListener {
    private val channel = "SELECT_INPUT_TYPE"
    private lateinit var _result: MethodChannel.Result

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        MethodChannel(flutterPluginBinding.binaryMessenger, channel).setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "selectInputType") {
            _result = result
            val remoteInputs: List<RemoteInput> =
                listOf(
                    RemoteInput.Builder("user_input").setLabel("Select type")
                        .wearableExtender { setInputActionType(EditorInfo.IME_ACTION_DONE) }
                        .build()
                )
            val intent: Intent = createActionRemoteInputIntent()
            putRemoteInputsExtra(intent, remoteInputs)
            startActivityForResult(intent, 9689)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        var activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT_WATCH)
    override fun onActivityResult(requestCode: Int, result: Int, intent: Intent?): Boolean {
        if (requestCode != 9689)
            return false;
        if (result == Activity.RESULT_OK) {
            val inputResult = RemoteInput.getResultsFromIntent(intent)
            _result.success(inputResult.getCharSequence("user_input"))
        } else
            _result.error("RESULT_NOT_OK", "", "")

        return false;
    }
}
