import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Opção 1
                      // Text(
                      //   "Olá, ",
                      //   style: AppTextStyles.title,
                      // ),
                      // Text(
                      //   "Adeilson",
                      //   style: AppTextStyles.titleBold,
                      // ),

                      // Opção 2
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: "Adeilson",
                                style: AppTextStyles.titleBold),
                          ],
                        ),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/19808865?v=4"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: ScoreCard(),
                ),
              ],
            ),
          ),
        );
}
