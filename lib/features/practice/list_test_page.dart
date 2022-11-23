import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/apis/models/Test.dart';
import 'package:toeic/features/practice/Introduce_Examination.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/features/practice/cubit/test_cubit.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/widgets/cubits/loading_cubit.dart';
import 'package:toeic/utils/utils.dart';

import '../../apis/models/Examination.dart';
import '../../apis/models/Exams.dart';
import '../../ui_kits/colors.dart';
import '../../ui_kits/widgets/views/sbox_loading.dart';
import 'examination_page.dart';

class ListTestPage extends StatefulWidget {
  final int typeTestId;

  const ListTestPage({Key? key, required this.typeTestId}) : super(key: key);

  static Route route(int typeTestId) {
    return MaterialPageRoute(
        builder: (_) => ListTestPage(typeTestId: typeTestId));
  }

  @override
  State<ListTestPage> createState() => _ListTestPageState();
}

class _ListTestPageState extends State<ListTestPage> {
  final testCubit = getIt<TestCubit>();
  final loadingCubit = getIt<LoadingCubit>();
  final examinationCubit = getIt<ExaminationCubit>();

  @override
  void initState() {
    super.initState();
    loadingCubit.showLoading();
    testCubit.getListTestByTypeTest(widget.typeTestId);
    testCubit.stream.listen((event) {
      if (event is TestStateLoading) {
        logger('Loading');
        loadingCubit.showLoading();
      } else if (event is TestStateFailed) {
        logger('Failed');
        loadingCubit.hideLoading();
      } else {
        logger('Success');
        loadingCubit.hideLoading();
      }
    });
  }

  Widget _buildTestItem(Test test, Examination? examination) {
    int numberOfQuestions = countQuestion(test.exams ?? []);
    int numberOfCorrect = 0;
    if (examination != null) {
      numberOfCorrect = (examination.numberCorrectPart1! +
          examination.numberCorrectPart2! +
          examination.numberCorrectPart3! +
          examination.numberCorrectPart4! +
          examination.numberCorrectPart5! +
          examination.numberCorrectPart6! +
          examination.numberCorrectPart7!);
    }
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        IntroduceExamination.route(test: test),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: lightPurpleColor)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Bài thi ${test.id}',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: darkBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 1,
              color: lightPurpleColor,
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'Câu hỏi: $numberOfQuestions',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: lightPurpleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: lightPurpleColor,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 16),
                      child: Row(
                        children: [
                          const Spacer(),
                          examination != null
                              ? InkWell(
                                  onTap: () => {},
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: Chip(
                                      backgroundColor:
                                          primaryColor.withOpacity(0.5),
                                      elevation: 0,
                                      padding: const EdgeInsets.all(8),
                                      label: Text(
                                          '$numberOfCorrect/$numberOfQuestions'),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          InkWell(
                            onTap: () async {
                              if (examination != null) {
                                await examinationCubit
                                    .setupReadExamination(examination.id!);
                              }
                              if (mounted) {
                                Navigator.of(context).push(
                                    ExaminationPage.route(test,
                                        examinationId: examination?.id ?? -1));
                              }
                            },
                            child: Chip(
                              elevation: 0,
                              backgroundColor: Colors.green.withOpacity(0.8),
                              padding: const EdgeInsets.all(8),
                              label: Text(
                                examination != null
                                    ? 'Xem chi tiết'
                                    : 'Làm bài',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // examination != null ? Row(
  // children: [
  // Đoạn này cần kiểm tra xem nó đã có examination_detail chưa? Nếu có rồi thì
  // hiển thị số câu đã làm đúng trên tổng số
  // GestureDetector(
  // onTap: () => {},
  // child: Container(
  // margin: const EdgeInsets.only(right: 8),
  // child: Chip(
  // backgroundColor: primaryColor.withOpacity(0.5),
  // elevation: 2,
  // padding: const EdgeInsets.all(8),
  // label: Text('$numberOfCorrect/$numberOfQuestions'),
  // ),
  // ),
  // ),
  // GestureDetector(
  // onTap: () => {},
  // child: Chip(
  // elevation: 2,
  // backgroundColor: Colors.green.withOpacity(0.8),
  // padding: const EdgeInsets.all(8),
  // label: const Text('Làm lại'),
  // ),
  // )
  // ],
  // ) : const SizedBox()

  int countQuestion(List<Exams> exams) {
    int count = 0;
    for (var exam in exams) {
      count += exam.questions?.length ?? 0;
    }
    return count;
  }

  String getTitle() {
    if (widget.typeTestId == 1) {
      return 'Thực hành 1';
    } else if (widget.typeTestId == 2) {
      return 'Thực hành 2';
    } else if (widget.typeTestId == 3) {
      return 'Thực hành 3';
    } else if (widget.typeTestId == 4) {
      return 'Thực hành 4';
    } else if (widget.typeTestId == 5) {
      return 'Thực hành 5';
    } else if (widget.typeTestId == 6) {
      return 'Thực hành 6';
    } else if (widget.typeTestId == 7) {
      return 'Thực hành 7';
    } else {
      return 'Thi thử';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          getTitle(),
          style: GoogleFonts.openSans(
              fontSize: 18, color: darkBlueColor, fontWeight: FontWeight.bold),
        ),
        leading: widget.typeTestId != 8
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/images/arrow-left-icon.svg',
                  width: 24,
                  height: 24,
                  color: orangeColor,
                ),
              )
            : null,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<TestCubit, TestState>(
              bloc: testCubit,
              builder: (context, state) {
                if (state is TestStateFailed) {
                  return Center(child: Text(state.error));
                }
                return ListView.builder(
                  itemBuilder: (context, index) => _buildTestItem(
                      testCubit.listTest[index], testCubit.examination?[index]),
                  itemCount: testCubit.listTest.length,
                );
              },
            ),
            Loading(
              loadingCubit: loadingCubit,
            )
          ],
        ),
      ),
    );
  }
}
