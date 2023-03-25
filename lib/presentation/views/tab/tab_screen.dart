import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/presentation/utils/assets.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/home/home_screen.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/task/task_screen.dart';
import 'package:udevs_todo/presentation/views/tab/tabs/add_bottom/add_bottom_view.dart';
import 'package:udevs_todo/presentation/views/widgets/appbars/custom_app_bar.dart';
import 'package:udevs_todo/presentation/views/widgets/buttons/circle_pink_button.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const TaskScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CirclePinkButton(
        onTap: () {
          showModalBottomSheet(
            elevation: 0.0,
            backgroundColor: ColorConst.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => const AddBottomView(),
          );
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: SizedBox(
        height: 76.h,
        child: BottomNavigationBar(
          selectedItemColor: ColorConst.primaryColor,
          unselectedItemColor: ColorConst.c9F9F9F,
          backgroundColor: ColorConst.white,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            bottomNavItem(
              isSelected: _currentIndex == 0,
              label: 'Home',
              iconPath: Assets.homeIcon,
            ),
            bottomNavItem(
              isSelected: _currentIndex == 1,
              label: 'Task',
              iconPath: Assets.gridIcon,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        height: 24.h,
        colorFilter: ColorFilter.mode(
          isSelected ? ColorConst.primaryColor : ColorConst.cBEBEBE,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
