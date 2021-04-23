import 'package:flutter/material.dart';

import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final String image;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                child:
                    Image.asset(AppImages.source[image] ?? AppImages.notFound),
              ),
              SizedBox(height: 24),
              Text(
                title,
                style: AppTextStyles.heading15,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    completed,
                    style: AppTextStyles.body11,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ProgressIndicatorWidget(value: percent),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
