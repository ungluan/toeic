import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/apis/models/Choice.dart';

import '../../../apis/models/Exams.dart';
import '../../colors.dart';

typedef QuizItemCallBack(int index);

class QuizDialog extends StatefulWidget {
  final List<Choice> data;
  final PageController pageController;
  final List<Exams> exams;
  final bool? readOnly ;
  const QuizDialog({Key? key, required this.data, required this.pageController, required this.exams, this.readOnly = false})
      : super(key: key);

  @override
  QuizDialogState createState() => QuizDialogState();
}

class QuizDialogState extends State<QuizDialog> {
  late List<Choice> _data;

  _buildItemCircle({
    required String title,
    Color? backgroundColor = Colors.white,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        _onTap(index);
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(color: lightPurpleColor, width: 1)
            // borderRadius: BorderRadius.circular(radius)
            ),
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600, color: Colors.black54),
        ),
      ),
    );
  }

  _buildItemAnswerSheet({
    required Choice choice,
    required int index,
    required String answer,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${index + 1}. ',
          style: GoogleFonts.openSans(
              fontSize: 16, fontWeight: FontWeight.bold, color: darkBlueColor),
        ),
        _buildItemCircle(
            title: 'A',
            backgroundColor:
                getBackgroundColor('a', choice.selected, answer),
            index: index),
        _buildItemCircle(
            title: 'B',
            backgroundColor:
            getBackgroundColor('b', choice.selected, answer),
            index: index),
        _buildItemCircle(
            title: 'C',
            backgroundColor:
            getBackgroundColor('c', choice.selected, answer),
            index: index),
        _buildItemCircle(
            title: 'D',
            backgroundColor:
            getBackgroundColor('d', choice.selected, answer),
            index: index),
      ],
    );
  }

  Color? getBackgroundColor(String val, String selected, String answer){
      if(val == answer) return Colors.green.shade500;
      if(widget.readOnly == true && val == selected) return Colors.red;
      return Colors.white;
  }

  @override
  void initState() {
    _data = widget.data;
    super.initState();
  }

  void _onTap(int numberOfQuestion) {
    int number = 0;
    int index = 1;
    for(int i=0; i<widget.exams.length; i++){
      int questions = widget.exams[i].questions?.length ?? 0;
      number += questions;
      if(numberOfQuestion + 1 <= number) {
        index = i;
        break;
      }
    }
    widget.pageController.jumpToPage(index);
  }

  String? getAnswer(int questionId){
    for(int i=0; i<widget.exams.length; i++){
      for(int j=0; j<(widget.exams[i].questions?.length ?? 0); j++){
        if(widget.exams[i].questions?[j].id == questionId){
          return widget.exams[i].questions?[j].answer;
        };
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        height: 240,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) => _buildItemAnswerSheet(
            choice: _data[index],
            index: index,
            answer: getAnswer(_data[index].id) ?? '',
          ),
        ),
      ),
    );
  }
}
