package com.ruan.fluttercherry

import android.text.TextUtils
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import javax.crypto.Cipher
import javax.crypto.spec.SecretKeySpec

class ChiperAesPlugin : MethodChannel.MethodCallHandler {

    companion object {
        public const  val channel = "com.ruan.fluttercherry"
        private const val transformation = "AES/ECB/PKCS5Padding"
        private const val algorithm = "AES"
        private const val aesKey = "2V8uzwuvLTzWcZ6C"

        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), channel)
            channel.setMethodCallHandler(ChiperAesPlugin())
        }
    }



    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "encrypt" -> encrypt(call, result)
        }
    }

    /**
     * AES加密
     */
    fun encrypt(call: MethodCall, result: MethodChannel.Result) {
        val input = call.argument<String>("inputKey")
        if (TextUtils.isEmpty(input)) return
        //创建cipher对象
        val cipher = Cipher.getInstance(transformation)
        //初始化cipher
        //通过秘钥工厂生产秘钥
        val keySpec = SecretKeySpec(aesKey.toByteArray(), algorithm)
        cipher.init(Cipher.ENCRYPT_MODE, keySpec)
        //加密、解密
        val encrypt = cipher.doFinal(input?.toByteArray())
        result.success(HexUtils.bytesToHexString(encrypt))

        return

    }


}