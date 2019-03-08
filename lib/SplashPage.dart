import 'package:flutter/material.dart';

//App的闪屏页面
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new Image.asset("img/splash.png");
  }
  @override
  void initState() {
    super.initState();
    countDown();
  }
  //倒计时
  void countDown() {
    var _duration = new Duration(seconds: 1);
    new Future.delayed(_duration, goToHomePage);
  }

  void goToHomePage() {
    Navigator.of(context).pushReplacementNamed('/artucke/HomeScene');
  }
}
