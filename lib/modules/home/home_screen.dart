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
      bottomNavigationBar: Obx(() => _bottomNavigationBar()),
      body:
          Obx(() => SafeArea(child: _buildContent(controller.activeTab.value))),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedFontSize: 13,
      type: BottomNavigationBarType.fixed,
      currentIndex: controller.currentTabIndex.value,
      onTap: controller.changeTab,
      // selectedItemColor: yellow,
      // selectedLabelStyle: TextStyle(color: yellow, backgroundColor: yellow),
      unselectedItemColor: Colors.white,
      selectedItemColor: Color(0xFF3CDAF7),
      items: [
        BottomNavigationBarItem(
          icon: Transform.rotate(
            angle: -15 * (3.141592653589793 / 180),
            child: Icon(Icons.nightlight, color: Color(0xFF3CDAF7)),
          ),
          label: "Сны",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create, color: Color(0xFF3CDAF7)),
          label: "Дневник",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active, color: Color(0xFF3CDAF7)),
          label: "Будильник",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.headphones, color: Color(0xFF3CDAF7)),
          label: "Музыка",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color(0xFF3CDAF7)),
          label: "Профиль",
        ),
      ],
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
