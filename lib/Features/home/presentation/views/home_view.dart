import 'package:flutter/material.dart';
import 'package:tourister/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:tourister/core/widgets/custom_bottom_navbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    HomeViewBody(),
    const Center(
      child: Text('Bookings'),
    ),
    const Center(
      child: Text('Explore'),
    ),
    const Center(
      child: Text('Favorites'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
