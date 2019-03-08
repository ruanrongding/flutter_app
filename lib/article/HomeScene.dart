import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cherry/article/IndexScene.dart';

class HomeScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSceneState();
  }
}

class HomeSceneState extends State<HomeScene> {
  int _tabIndex =0;
  List<Image> _tabImages = [
    Image.asset('img/a83.png'),
    Image.asset('img/a8a.png'),
    Image.asset('img/blo.png'),
    Image.asset('img/a85.png')
  ];
  List<Image> _tabSelectImages = [
    Image.asset('img/a84.png'),
    Image.asset('img/a8b.png'),
    Image.asset('img/blp.png'),
    Image.asset('img/a86.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          children: <Widget>[
            IndexScene(),
            IndexScene(),
            IndexScene(),
            IndexScene(),
          ],
          index: _tabIndex,
        ),
        //CupertinoTabBar 是IOS风格
        //BottomNavigationBar 是Android 的风格
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: Color(0xFFF85959),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0), title: Text('首页')),
            BottomNavigationBarItem(icon: getTabIcon(1), title: Text('视频')),
            BottomNavigationBarItem(icon: getTabIcon(2), title: Text('排行')),
            BottomNavigationBarItem(icon: getTabIcon(3), title: Text('我的'))
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
