import 'package:dream_book/features/app/routes/routes_path.dart';
import 'package:dream_book/features/home/logic/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../alarm_clock/view/alarm_clock.dart';
import '../../diary/views/diary.dart';
import '../../dreams/view/dreams.dart';
import '../../music/views/music.dart';
import '../../profile/views/profile.dart';

class Home extends StatelessWidget {
  final vm = Get.put(HomeVM());
  Color yellow = const Color.fromRGBO(242, 224, 151, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: PersistentTabView(
          context,
          controller: vm.pageController.value,
          screens: _buildScreens(),
          navBarStyle: NavBarStyle.style9,
          items: _navBarsItems(context),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 300),
          ),
          decoration: NavBarDecoration(
              border: const Border(top: BorderSide(color: Colors.blue)),
              colorBehindNavBar: Theme.of(context).primaryColor,
              boxShadow: [
                const BoxShadow(
                    blurRadius: 12.0,
                    color: Colors.lightBlue,
                    offset: Offset(0, 11),
                    spreadRadius: 10.0),
              ]),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [Dreams(), Diary(), AlarmClock(), Music(), Profile()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.nightlight, color: Colors.blue),
        title: ("Сны"),
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.create, color: Colors.blue),
          title: ("Дневник"),
          activeColorSecondary: Colors.white,
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            initialRoute: RoutesPath.DIARY,
          )),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_active, color: Colors.blue),
        activeColorSecondary: Colors.white,
        title: ("Будильник"),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.headphones, color: Colors.blue),
        title: ("Музыка"),
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, color: Colors.blue),
        title: ("Профиль"),
        activeColorSecondary: Colors.white,
      ),
    ];
  }
}

class CustomFadeCurve extends Curve {
  @override
  double transform(double t) {
    // Use easeInOut curve for smooth fade in and out effect
    return Curves.easeInOut.transform(t);
  }
}
