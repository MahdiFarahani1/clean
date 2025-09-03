import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/bloc/navbar_cubit/navbar_cubit.dart';
import 'package:flutter_application_1/core/widgets/appbar.dart';
import 'package:flutter_application_1/core/widgets/nav_bar.dart';
import 'package:flutter_application_1/features/bookmark/presentation/screens/bookmark_view.dart';
import 'package:flutter_application_1/features/content_books/presentation/screens/content_book_view.dart';
import 'package:flutter_application_1/features/home/presentation/screens/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});
  final _pageViewController = PageController(initialPage: 0);

  final List<Widget> pages = List.unmodifiable([
    HomeView(),
    BookmarkVeiw(),
    ContentBookVeiw(),
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon.show(),
      body: PageView(
        controller: _pageViewController,
        children: pages,
        onPageChanged: (value) {
          context.read<NavbarCubit>().setNavBarIndex(value);
        },
      ),
      bottomNavigationBar: NavBarCommon(pageController: _pageViewController),
    );
  }
}
