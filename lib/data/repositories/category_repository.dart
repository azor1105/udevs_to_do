import 'dart:ui';

import 'package:udevs_todo/data/models/category_model.dart';

class CategoryRepository {
  List<CategoryModel> categories = [
    // Personal
    CategoryModel(
      color: const Color(0xFFFFD506),
      gridColor: const Color(0xFFFFEE9B).withOpacity(0.36),
      iconPath: 'assets/icons/categories/user.svg',
      id: 0,
      title: 'Personal',
    ),

    // Work
    CategoryModel(
      color: const Color(0xFF5DE61A),
      gridColor: const Color(0xFFB5FF9B).withOpacity(0.36),
      iconPath: 'assets/icons/categories/briefcase.svg',
      id: 1,
      title: 'Work',
    ),

    // Meeting
    CategoryModel(
      color: const Color(0xFFD10263),
      gridColor: const Color(0xFFFF9BCD).withOpacity(0.36),
      iconPath: 'assets/icons/categories/presentation.svg',
      id: 2,
      title: 'Meeting',
    ),

    // Meeting
    CategoryModel(
      color: const Color(0xFFF29130),
      gridColor: const Color(0xFFFFD09B).withOpacity(0.36),
      iconPath: 'assets/icons/categories/shopping_basket.svg',
      id: 3,
      title: 'Shopping',
    ),

    // Party
    CategoryModel(
      color: const Color(0xFF3044F2),
      gridColor: const Color(0xFF9BFFF8).withOpacity(0.36),
      iconPath: 'assets/icons/categories/confetti.svg',
      id: 4,
      title: 'Party',
    ),

    // Study
    CategoryModel(
      color: const Color(0xFFBF0080),
      gridColor: const Color(0xFFF59BFF).withOpacity(0.36),
      iconPath: 'assets/icons/categories/molecule.svg',
      id: 5,
      title: 'Study',
    ),
  ];

  Color getColorById(int id) {
    return categories.where((element) => element.id == id).toList()[0].color;
  }
}
