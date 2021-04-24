import 'package:flutter/material.dart';

import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AwnserWidget({
    Key? key,
    required this.awnser,
    this.isSelected = false,
    required this.disabled,
    required this.onTap,
  }) : super(key: key);

  Color get _color => isSelected
      ? awnser.isRight
          ? AppColors.darkGreen
          : AppColors.darkRed
      : AppColors.border;

  Color get _border => isSelected
      ? awnser.isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.border;

  Color get _colorCard => isSelected
      ? awnser.isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _borderCard => isSelected
      ? awnser.isRight
          ? AppColors.green
          : AppColors.red
      : AppColors.border;

  TextStyle get _textStyle => isSelected
      ? awnser.isRight
          ? AppTextStyles.bodyDarkGreen
          : AppTextStyles.bodyDarkRed
      : AppTextStyles.body;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: () => onTap(awnser.isRight),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
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
                    awnser.title,
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
        ),
      ),
    );
  }
}
