import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cherry/SplashPage.dart';
import 'package:flutter_cherry/article/HomeScene.dart';

void main() {
  _setTargetPlatformForDesktop();
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置状态栏为透明状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

//设置编译环境
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashPage(), // 闪屏页
      routes: <String, WidgetBuilder>{
        // 路由
        '/artucke/HomeScene': (BuildContext context) => new HomeScene()
      },
    );
  }
}
