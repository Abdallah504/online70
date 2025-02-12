import 'package:flutter/material.dart';
import 'package:online70/screens/ecommerce/cart-screen.dart';
import 'package:online70/screens/ecommerce/home-scrwwn.dart';
import 'package:online70/screens/ecommerce/profile-screen.dart';
import 'package:online70/screens/ecommerce/serch-screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget>screens = [
HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  void changeScreen(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
          onTap: changeScreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color:selectedIndex==0? Colors.purple:Colors.grey,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search,color: selectedIndex==1? Colors.purple:Colors.grey,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart,color: selectedIndex==2? Colors.purple:Colors.grey,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: selectedIndex==3? Colors.purple:Colors.grey,),label: ''),
          ]),
    );
  }
}
