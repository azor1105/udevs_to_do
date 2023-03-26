import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/presentation/utils/constants/color_const.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();

  final bool isSelected;
  final ValueChanged<bool> onChanged;
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool value;

  @override
  void initState() {
    value = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
          widget.onChanged.call(value);
        });
      },
      child: AnimatedContainer(
        height: 18.h,
        width: 18.w,
        decoration: BoxDecoration(
          color: value ? ColorConst.c91DC5A : ColorConst.white,
          shape: BoxShape.circle,
          border: !value
              ? Border.all(
                  width: 1.5.w,
                  color: ColorConst.cB5B5B5,
                )
              : null,
        ),
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Icon(
            Icons.check,
            color: ColorConst.white,
            size: 15.sp,
          ),
        ),
      ),
    );
  }
}
