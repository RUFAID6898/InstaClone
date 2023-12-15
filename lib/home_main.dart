// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:instaclone/account/Screen_account.dart';
import 'package:instaclone/home/screen_home.dart';
import 'package:instaclone/post/screen_post.dart';
import 'package:instaclone/reel/screen_reel.dart';
import 'package:instaclone/search/screen_search.dart';
// import 'package:instagram/account/Screen_account.dart';
// import 'package:instagram/home/screen_home.dart';
// import 'package:instagram/post/screen_post.dart';
// import 'package:instagram/reel/screen_reel.dart';
// import 'package:instagram/search/screen_search.dart';

class HomeMain extends StatelessWidget {
  HomeMain({super.key});
  final ValueNotifier _bottemNotifire = ValueNotifier(0);
  final List _screens = [
    ScreenHome(),
    ScreenSearch(),
    ScreenPost(),
    ScreenReels(),
    ScreenAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _bottemNotifire,
        builder: (context, value, child) {
          return Scaffold(
            body: _screens[value],
            bottomNavigationBar: BottomNavigationBar(
                unselectedIconTheme: IconThemeData(color: Colors.black),
                selectedIconTheme: IconThemeData(color: Colors.black),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: _bottemNotifire.value,
                onTap: (value) {
                  _bottemNotifire.value = value;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_box_outlined), label: 'post'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.emoji_emotions_outlined), label: 'Reel'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined),
                      label: 'Account'),
                ]),
          );
        });
  }
}
