import 'package:flutter/material.dart';
import 'package:medicine_app/screens/filters_screen.dart';
import 'package:medicine_app/screens/medicines_screen.dart';
import 'package:medicine_app/screens/diseases_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var activeScreenIndex = 0;

  void _selectScreen(int screenNo) {
    setState(() {
      activeScreenIndex = screenNo;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget activeScreen;

    switch (activeScreenIndex) {
      case 0:
        activeScreen = const DiseasesScreen();
        break;
      case 1:
        activeScreen = const MedicinesScreen();
        break;
      case 2:
        activeScreen = const FiltersScreen();
        break;
      default:
        break;
    }
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: activeScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.coronavirus_outlined), label: 'Diseases'),
          BottomNavigationBarItem(
              icon: Icon(Icons.medication), label: 'Medicines'),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt), label: 'Filters'),
        ],
      ),
    );
  }
}
