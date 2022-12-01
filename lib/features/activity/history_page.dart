import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:toeic/apis/models/Test.dart';
import 'package:toeic/features/activity/cubit/history_cubit.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/widgets/cubits/loading_cubit.dart';

import '../../apis/models/Examination.dart';
import '../../apis/models/Exams.dart';
import '../../ui_kits/colors.dart';
import '../../ui_kits/widgets/views/sbox_loading.dart';
import '../practice/examination_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => HistoryPage());
  }

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final loadingCubit = getIt<LoadingCubit>();
  final examinationCubit = getIt<ExaminationCubit>();
  final historyCubit = getIt<HistoryCubit>();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        historyCubit.getHistory();
      }
    });
    loadingCubit.showLoading();
    loadingCubit.showLoading();
    historyCubit.getHistory();
    historyCubit.stream.listen((state) {
      if (state is HistoryStateLoaded) {
        loadingCubit.hideLoading();
      } else if (state is HistoryStateFailed) {
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
    void _onTap() async{
      loadingCubit.showLoading();
      if (examination?.finishedAt != null) {
        await examinationCubit
            .setupReadExamination(examination!.id!);
        if (mounted) {
          Navigator.of(context).push(
            ExaminationPage.route(
              test,
              examinationId: examination.id!,
            ),
          );
          loadingCubit.hideLoading();
        }
      }
    }
    return GestureDetector(
      onTap: () => _onTap(),
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
                          examination?.finishedAt != null
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
                            onTap: ()=> _onTap(),
                            child: Chip(
                              elevation: 0,
                              backgroundColor: Colors.green.withOpacity(0.8),
                              padding: const EdgeInsets.all(8),
                              label: Text(
                                examination?.finishedAt != null
                                    ? 'Xem chi tiết'
                                    : '',
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

  int countQuestion(List<Exams> exams) {
    int count = 0;
    for (var exam in exams) {
      count += exam.questions?.length ?? 0;
    }
    return count;
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
            'Lịch sử',
            style: GoogleFonts.openSans(
                fontSize: 18,
                color: darkBlueColor,
                fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/images/arrow-left-icon.svg',
                width: 24,
                height: 24,
                color: orangeColor,
              ),
            ),
          )),
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HistoryCubit, HistoryState>(
              bloc: historyCubit,
              builder: (context, state) {
                if (state is HistoryStateFailed) {
                  return Center(child: Text(state.error));
                }
                return ListView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    if(historyCubit.examinations.isEmpty){
                      return Container();
                    }
                    if (index == historyCubit.examinations.length) {
                      return  historyCubit.isLoadMore ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 170),
                        child: const LoadingIndicator(
                          indicatorType: Indicator.ballSpinFadeLoader,
                          backgroundColor: Colors.transparent,
                          colors: [
                            Colors.blue,
                            Colors.green,
                            Colors.greenAccent,
                            Colors.yellow,
                            Colors.orange,
                            Colors.red,
                            Colors.pink,
                            Colors.purple,
                            Colors.indigo
                          ],
                        ),
                      ): const SizedBox();
                    }
                    return _buildTestItem(
                        historyCubit.examinations[index].test!,
                        historyCubit.examinations[index]);
                  },
                  itemCount: historyCubit.examinations.length + 1,
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
