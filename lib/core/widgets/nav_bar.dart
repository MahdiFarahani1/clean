import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/bloc/navbar_cubit/navbar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarCommon extends StatelessWidget {
  final PageController pageController;

  const NavBarCommon({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavbarCubit>().state;

    return GNav(
      selectedIndex: currentIndex,
      onTabChange: (value) {
        pageController.animateToPage(
          value,
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceIn,
        );
        context.read<NavbarCubit>().setNavBarIndex(value);
      },
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      backgroundColor: Colors.blue,
      rippleColor: Colors.white,
      hoverColor: Colors.grey.shade700,
      tabBorderRadius: 15,
      tabActiveBorder: Border.all(
        color: Colors.white,
        width: 1,
      ), // active tab border
      tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
      tabShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ], // tab button shadow
      curve: Curves.easeOutExpo, // tab animation curve
      duration: const Duration(milliseconds: 900), // animation duration
      gap: 0, // gap between icon and text
      color: Colors.grey.shade800, // unselected icon color
      activeColor: Colors.white, // selected icon and text color
      iconSize: 24, // icon size
      tabBackgroundColor: Colors.white.withOpacity(0.1), // selected tab bg
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      tabs: const [
        GButton(icon: Icons.home, text: 'Home'),
        GButton(icon: Icons.bookmark, text: 'BookMark'),
        GButton(icon: Icons.data_object_sharp, text: 'Database'),
      ],
    );
  }
}
