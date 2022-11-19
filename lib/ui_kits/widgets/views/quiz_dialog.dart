import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/apis/models/Choice.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_button.dart';

import '../../colors.dart';

typedef QuizItemCallBack(int index);

class QuizDialog extends StatefulWidget {
  final List<Choice> data;
  final PageController pageController;

  const QuizDialog({Key? key, required this.data, required this.pageController})
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
    bool? isSubmitted = false,
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
                answer == 'a' ? Colors.green.shade500 : Colors.white,
            index: index),
        _buildItemCircle(
            title: 'B',
            backgroundColor:
                answer == 'b' ? Colors.green.shade500 : Colors.white,
            index: index),
        _buildItemCircle(
            title: 'C',
            backgroundColor:
                answer == 'c' ? Colors.green.shade500 : Colors.white,
            index: index),
        _buildItemCircle(
            title: 'D',
            backgroundColor:
                answer == 'd' ? Colors.green.shade500 : Colors.white,
            index: index),
      ],
    );
  }

  @override
  void initState() {
    _data = widget.data;
    super.initState();
  }

  void _onTap(int index) {
    widget.pageController.jumpToPage(index);
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
            answer: _data[index].selected,
          ),
        ),
      ),
    );
  }
}
