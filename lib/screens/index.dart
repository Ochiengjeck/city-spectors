import 'package:city_spectors/screens/pages/appeals.dart';
import 'package:city_spectors/screens/pages/homepage.dart';
import 'package:city_spectors/screens/pages/info.dart';
import 'package:city_spectors/screens/pages/profile.dart';
import 'package:city_spectors/screens/pages/stations.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final List<Widget> pages = [
    const Homepage(),
    const Stations(),
    const Appeals(),
    const Info(),
    const Profile(),
  ];

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.blueGrey,
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        ),
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Police Call",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Stations",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Appeal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
