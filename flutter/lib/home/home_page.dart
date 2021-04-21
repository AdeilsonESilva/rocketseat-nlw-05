import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != HomeState.success) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(
        user: controller.user!,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LeveButtonWidget(
                  label: "Fácil",
                ),
                LeveButtonWidget(
                  label: "Médio",
                ),
                LeveButtonWidget(
                  label: "Difícil",
                ),
                LeveButtonWidget(
                  label: "Perito",
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              children: controller.quizzes!
                  .map(
                    (e) => QuizCardWidget(
                      title: e.title,
                      completed:
                          "${e.questionAnswered} de ${e.questions.length}",
                      percent: e.questionAnswered / e.questions.length,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
