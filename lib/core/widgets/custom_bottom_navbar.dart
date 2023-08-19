import 'package:flutter/material.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/assets.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    this.onItemTapped,
    required this.selectedIndex,
  });
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_outlined,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsData.explore,
              color: selectedIndex == 2 ? kSecondaryColor : Colors.grey,
            ),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorites',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: kSecondaryColor,
        onTap: onItemTapped,
      ),
    );
  }
}
