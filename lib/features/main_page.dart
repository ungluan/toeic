import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/exam/exam_page.dart';
import 'package:toeic/features/home/home_page.dart';
import 'package:toeic/features/practice/practice_page.dart';
import 'package:toeic/features/settings/settings_page.dart';
import 'package:toeic/ui_kits/colors.dart';

import '../utils/app_color.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  late List<Widget> _widgetOptions;
  late String _title;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _widgetOptions = [
      HomePage(),
      PracticePage(),
      ExamPage(),
      SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _widgetOptions,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Trang chủ'),
            activeColor: blueColor,
            inactiveColor: lightTextColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.menu_book),
            title: const Text('Luyện tập'),
            activeColor: blueColor,
            inactiveColor: lightTextColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.edit),
            title: const Text('Thi thử'),
            activeColor: blueColor,
            inactiveColor: lightTextColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings_suggest_sharp),
            title: const Text('Cài đặt'),
            activeColor: blueColor,
            inactiveColor: lightTextColor,
          ),
        ],
      ),
    );
  }
}
