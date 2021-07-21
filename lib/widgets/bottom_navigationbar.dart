
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int index;
  final double iconSize;
  final Function navigation;
  final Color backgroundColor;
  final Color selectedColor;

  CustomBottomBar(
      {
        this.index = 1,
        required this.navigation,
        required this.iconSize,
        required this.backgroundColor,
        required this.selectedColor
      });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      currentIndex: index,
      selectedItemColor: selectedColor,
      type: BottomNavigationBarType.fixed,
     iconSize: iconSize,
     selectedFontSize: 13,
     unselectedFontSize: 13,
     items: [
       BottomNavigationBarItem(icon: Icon(Icons.home,size: 27,),label: "Home",backgroundColor: Colors.red),
       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,size: 27,),label: "Nearby",backgroundColor: Colors.red),
       BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,size: 27,),label: "Products",backgroundColor: Colors.red),
       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,size: 27,),label: "cart",backgroundColor: Colors.red),
       BottomNavigationBarItem(icon: Icon(Icons.account_circle,size: 27,),label: "Profile",backgroundColor: Colors.red),
     ],
    );
  }

}
