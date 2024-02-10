import 'package:dream_book/modules/alarm_clock/alarm_clock_screen.dart';
import 'package:dream_book/modules/diary/diary_screen.dart';
import 'package:dream_book/modules/dreams/dreams_screen.dart';
import 'package:dream_book/modules/home/home_controller.dart';
import 'package:dream_book/modules/home/tabs.dart';
import 'package:dream_book/modules/music/music_screen.dart';
import 'package:dream_book/modules/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  Color yellow = const Color.fromRGBO(242, 224, 151, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: controller.changeTab,
        items: [
          BottomNavigationBarItem(
            icon: Transform.rotate(
              angle: -15 * (3.141592653589793 / 180),
              child: Icon(Icons.nightlight, color: yellow),
            ),
            label: "Сны",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create, color: yellow),
            label: "Дневник",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active, color: yellow),
            label: "Будильник",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones, color: yellow),
            label: "Музыка",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: yellow),
            label: "Профиль",
          ),
        ],
      ),
      body: Obx(() => SafeArea(child: _buildContent(controller.activeTab.value))),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.dreams:
        return DreamsScreen();
      case MainTabs.diary:
        return DiaryScreen();
      case MainTabs.alarm_clock:
        return AlarmClockScreen();
      case MainTabs.music:
        return MusicScreen();
      case MainTabs.profile:
        return ProfileScreen();

      default:
        return AlarmClockScreen();
    }
  }
}
