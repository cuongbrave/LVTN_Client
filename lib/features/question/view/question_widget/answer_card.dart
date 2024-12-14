import 'package:b2004772/features/question/view/question_widget/UI_parameters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard({super.key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(

        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: isSelected
              ?Colors.blue[100]:Colors.grey,
          border: Border.all(
            color: isSelected?Color.fromARGB(255, 20, 46, 158):Color.fromARGB(255, 221, 211, 211)
          )
        ),

        child: Text(
            answer,
          style: TextStyle(
            color: isSelected?Colors.red[800]:Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w800,

          ),
        ),

      ),

    );
  }
}
