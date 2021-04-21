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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 24),
            Container(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  LeveButtonWidget(
                    label: "Fácil",
                  ),
                  SizedBox(width: 5),
                  LeveButtonWidget(
                    label: "Médio",
                  ),
                  SizedBox(width: 5),
                  LeveButtonWidget(
                    label: "Difícil",
                  ),
                  SizedBox(width: 5),
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
                children: controller.quizzes!
                    .map(
                      (e) => QuizCardWidget(
                        title: e.title,
                        completed:
                            "${e.questionAnswered} de ${e.questions.length}",
                        percent: e.questionAnswered / e.questions.length,
                        image: e.image,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
