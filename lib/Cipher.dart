import 'package:flutter/services.dart';

class Cipher {
  static const MethodChannel _channel = const MethodChannel('com.ruan.fluttercherry');

  static Future<String> encrypt(String inputKey) async =>
      await _channel.invokeMethod("encrypt", {
        "inputKey": inputKey,
      });



}
