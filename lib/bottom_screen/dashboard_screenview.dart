import 'package:boots_buy/bottom_screen/about_screen.dart';
import 'package:boots_buy/bottom_screen/cart_screen.dart';
import 'package:boots_buy/bottom_screen/home_screen.dart';
import 'package:boots_buy/bottom_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreenview extends StatefulWidget {
  const DashboardScreenview({super.key});

  @override
  State<DashboardScreenview> createState() => _DashboardScreenviewState();
}

class _DashboardScreenviewState extends State<DashboardScreenview> {

  int _selectedIndex =0;

  List<Widget> lstBottomScreen =[
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home', ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
            label:'Cart',),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:'Profile',),
            BottomNavigationBarItem(
                icon: Icon(Icons.album_outlined),
            label: 'About')



      ],
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
