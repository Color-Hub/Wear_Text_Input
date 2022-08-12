package online.colorhub.wear_text_input

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class WearTextInputPlugin : FlutterPlugin, MethodCallHandler {
    private val channel = "SELECT_INPUT_TYPE"
    private lateinit var _result: MethodChannel.Result

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel
        ) setMethodCallHandler (this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        f(call.method == "selectInputType") {
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

    override fun onDetachedFromEngine(