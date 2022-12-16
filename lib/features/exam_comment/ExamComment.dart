import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/practice/examination_page.dart';
import 'package:toeic/ui_kits/colors.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_button.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_loading.dart';

import '../../apis/models/Examination.dart';
import '../../apis/models/Exams.dart';
import '../../injection/injection.dart';
import '../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../practice/Introduce_Examination.dart';
import '../practice/cubit/examination_cubit.dart';

class ExamComment extends StatefulWidget {
  const ExamComment({Key? key}) : super(key: key);

  @override
  State<ExamComment> createState() => _ExamCommentState();

  static Route route() {
    return MaterialPageRoute(builder: (_) => const ExamComment());
  }
}

class _ExamCommentState extends State<ExamComment>
    with TickerProviderStateMixin {
  final examinationCubit = getIt<ExaminationCubit>();
  final loadingCubit = getIt<LoadingCubit>();
  double percent = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  // late final AnimationController _controller2 = AnimationController(
  //   duration: const Duration(microseconds: 300000),
  //   vsync: this,
  // )..repeat(reverse: true);
  // late final Animation<double> _animation2 = CurvedAnimation(
  //   parent: _controller2,
  //   curve: Curves.easeIn,
  // );
  /**
   *
   * */

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // _controller2.dispose();
    super.dispose();
  } // Tính điểm:
  // điểm >= target: Bạn đã đạt được mục tiêu của mình.
  // else : Bạn cần cố gắng hơn nữa

  // Tính tổng số câu đúng / tổng câu
  //

  int countTotalQuestion(List<Exams> exams) {
    int count = 0;
    for (var exam in exams) {
      count += exam.questions?.length ?? 0;
    }
    return count;
  }

  int countCorrectQuestion(Examination examination) {
    return (examination.numberCorrectPart1! +
        examination.numberCorrectPart2! +
        examination.numberCorrectPart3! +
        examination.numberCorrectPart4! +
        examination.numberCorrectPart5! +
        examination.numberCorrectPart6! +
        examination.numberCorrectPart7!);
  }

  String getPercent(Examination examination) {
    double percent = countCorrectQuestion(examination) /
        countTotalQuestion(examination.test!.exams!);
    this.percent = double.parse(percent.toStringAsFixed(2));
    return (percent * 100).toStringAsFixed(2);
  }

  int calScore() {
    var examination = examinationCubit.examination;
    if (examination?.test?.typeTest?.id != 8) return 0;
    var totalScore = 0;
    var listening = (examination?.numberCorrectPart1 ?? 0) +
        (examination?.numberCorrectPart2 ?? 0) +
        (examination?.numberCorrectPart3 ?? 0) +
        (examination?.numberCorrectPart4 ?? 0);
    var reading = (examination?.numberCorrectPart5 ?? 0) +
        (examination?.numberCorrectPart6 ?? 0) +
        (examination?.numberCorrectPart7 ?? 0) ;
    if (listening == 0) {
      totalScore += 5;
    } else if (listening == 15) {
      totalScore += 15;
    } else if (listening < 96) {
      totalScore += 20 + (listening - 1) * 5;
    } else {
      totalScore += 495;
    }

    if (reading <= 2) {
      totalScore += 5;
    } else {
      totalScore += 5 + (reading - 2) * 5;
    }

    return totalScore;
  }

  bool success(){
    return (calScore() >= (examinationCubit.authenticationRepository.user?.target ?? 500));
  }

  // int caculateScore(Examination examination){
  //
  // }

  // String getComment(){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          FadeTransition(
                            opacity: _animation,
                            child: Image.asset(
                              'assets/images/firework.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Image.asset(
                            'assets/images/confeti-vector.png',
                            fit: BoxFit.fitWidth,
                          ),
                          SvgPicture.asset(
                            'assets/images/meditate-illustrator.svg',
                            height: 256,
                            width: 256,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              success() ? 'Chúc mừng bạn, bạn đã đạt được mục tiêu đề ra' : 'Bạn cần cố gắng hơn nữa',
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: success() ? darkBlueColor : Colors.black
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              examinationCubit
                                          .examination?.test?.typeTest?.id ==
                                      8
                                  ? 'Kết quả: ${calScore()}'
                                  : 'Kết quả',
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: orangeColor,
                              ),
                            ),
                            // getPercent(examinationCubit.examination)
                            SizedBox(
                              height: 4,
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              borderOnForeground: true,
                              elevation: 4,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text('Tỷ lệ đúng'),
                                        Spacer(),
                                        Text(
                                            '${getPercent(examinationCubit.examination!)}%')
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: LinearProgressIndicator(
                                          backgroundColor: lightPurpleColor,
                                          value: percent,
                                          minHeight: 10.0,
                                          semanticsValue: '300',
                                          semanticsLabel: 'SematicsLabel',
                                          color: orangeColor,
                                        ),
                                      ),
                                    ),
                                    Text('Tiếp tục cố gắng'),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: makeRoundButton(
                                'Hiển thị đáp án',
                                onPressed: () => {
                                  Navigator.of(context).pushReplacement(
                                    ExaminationPage.route(
                                      examinationCubit.examination!.test!,
                                      examinationId:
                                          examinationCubit.examination!.id!,
                                    ),
                                  )
                                },
                                height: 45,
                                // width: 200,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: makeSBoxButton(
                                'Thi lại',
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                    IntroduceExamination.route(
                                      test: examinationCubit.examination!.test!,
                                    ),
                                  )
                                },
                                height: 45,
                                width: 200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Loading(loadingCubit: loadingCubit)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
