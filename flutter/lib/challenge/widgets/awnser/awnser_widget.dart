import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  const AwnserWidget({
    Key? key,
    required this.title,
    this.isRight = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _color => isSelected
      ? isRight
          ? AppColors.darkGreen
          : AppColors.darkRed
      : AppColors.border;

  Color get _border => isSelected
      ? isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.border;

  Color get _colorCard => isSelected
      ? isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _borderCard => isSelected
      ? isRight
          ? AppColors.green
          : AppColors.red
      : AppColors.border;

  TextStyle get _textStyle => isSelected
      ? isRight
          ? AppTextStyles.bodyDarkGreen
          : AppTextStyles.bodyDarkRed
      : AppTextStyles.body;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _colorCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: _borderCard)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: _textStyle,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(16),
                border: Border.fromBorderSide(BorderSide(color: _border)),
              ),
              child: isSelected
                  ? Icon(
                      _selectedIconRight,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
