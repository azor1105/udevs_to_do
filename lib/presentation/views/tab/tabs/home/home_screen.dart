import 'package:flutter/material.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorConst.cF9FCFF,
      body: Center(
        child: Text("Homes"),
      ),
    );
  }
}