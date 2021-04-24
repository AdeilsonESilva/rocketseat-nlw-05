import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/core.dart';

// TODO desafio de porcentagem de acerto pq zero porcento não é parabéns :)

class ResultePage extends StatelessWidget {
  final String title;
  final int totalQuestions;
  final int correctAnswers;

  const ResultePage({
    Key? key,
    required this.title,
    required this.totalQuestions,
    required this.correctAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 20),
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu\n",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "$title\n",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "com $correctAnswers de $totalQuestions acertos.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.purple(
                            label: "Compartilhar",
                            onTap: () {
                              Share.share(
                                  'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive ${correctAnswers / totalQuestions * 100}% de aproveitamento!');
                            }),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.white(
                            label: "Voltar ao início",
                            onTap: () => Navigator.pop(context)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
