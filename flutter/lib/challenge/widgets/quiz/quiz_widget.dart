import 'package:dev_quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: true,
                  isSelected: true,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
                AwnserWidget(
                  title:
                      "Possibilita a criação de aplicativos compilados nativamente",
                  isRight: false,
                  isSelected: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
