import 'package:flutter/material.dart';

import 'package:dev_quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 64),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: widget.question.awnsers.map(
                (awnser) {
                  var index = widget.question.awnsers.indexOf(awnser);
                  return AwnserWidget(
                    awnser: awnser,
                    isSelected: index == indexSelected,
                    disabled: indexSelected != null,
                    onTap: () {
                      setState(() {
                        indexSelected = index;
                      });
                      Future.delayed(Duration(milliseconds: 500))
                          .then((value) => widget.onChange()); // TODO refatorar
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
