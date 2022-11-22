import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/apis/models/Exams.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/colors.dart';
import 'package:toeic/ui_kits/widgets/cubits/loading_cubit.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_loading.dart';
import 'package:toeic/utils/utils.dart';

import '../../apis/models/Test.dart';
import '../../ui_kits/styles.dart';
import '../../ui_kits/widgets/views/notification_dialog.dart';
import '../../ui_kits/widgets/views/one_choice.dart';
import '../../ui_kits/widgets/views/quiz_dialog.dart';
import '../exam_comment/ExamComment.dart';
import 'cubit/examination_cubit.dart';

class ExaminationPage extends StatefulWidget {
  const ExaminationPage(
      {Key? key, required this.test, required this.examinationId})
      : super(key: key);
  final Test test;
  final int examinationId;

  static Route route(Test test, {int examinationId = -1}) {
    return MaterialPageRoute(
      builder: (_) => ExaminationPage(test: test, examinationId: examinationId),
    );
  }

  @override
  State<ExaminationPage> createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {
  final player = AudioPlayer();
  var examinationCubit = getIt<ExaminationCubit>();
  bool isCompleted = false;
  ValueNotifier<bool> isPlaying = ValueNotifier(true);
  ValueNotifier<Duration> duration = ValueNotifier(Duration.zero);
  ValueNotifier<Duration> position = ValueNotifier(Duration.zero);
  PageController pageController = PageController(initialPage: 0);
  ValueNotifier<bool> isSubmitted = ValueNotifier(false);
  int preIndex = 0;
  ValueNotifier<int> curIndexNotifier = ValueNotifier(0);
  int pages = 0;
  ValueNotifier<int> totalTime = ValueNotifier(0);

  LoadingCubit loadingCubit = LoadingCubit();
  late CountdownController countdownController;
  late Timer timer ;

  void initPlayer(String audioUrl) async {
    await player.stop();
    await player.play(UrlSource(
        "https://firebasestorage.googleapis.com/v0/b/toeic-bc79c.appspot.com/o/$audioUrl?alt=media"));
    isPlaying.value = true;
    position.value = Duration.zero;
    duration.value = await player.getDuration() ?? Duration.zero;
  }

  String convertTotalTimeToString(int totalTime){
    int hour = totalTime ~/ 3600;
    int minute = (totalTime - hour*3600)~/60;
    int second = totalTime - hour*3600 - minute*60;
    logger(hour);
    logger(minute);
    logger(second);

    return "${convertNumberToString(hour)}:${convertNumberToString(minute)}:${convertNumberToString(second)}";
  }

  String convertNumberToString(int number){
    if(number < 10) return '0$number';
    return '$number';
  }

  @override
  void initState() {
    super.initState();
    if (widget.examinationId != -1) {
      // loadingCubit.showLoading();
      examinationCubit.setupReadExamination(widget.examinationId);

    } else {
      // loadingCubit.showLoading();
      examinationCubit.setupTest(widget.test);
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {

        totalTime.value+=1;
        logger(totalTime.value);
      });
    }

    player.onPositionChanged.listen((newPosition) {
      position.value = newPosition;
    });
    player.onPlayerComplete.listen((state) {
      isPlaying.value = false;
      isCompleted = true;
    });
    examinationCubit.stream.listen((state) {
      if (state is ExaminationStateLoaded) {
        // loadingCubit.hideLoading();
        pages = state.data.exams!.length;
        print(state.data);
      }
      if (state is ExaminationStateSubmitted) {
        // Chuyển tới trang nhận xét
        Navigator.of(context).pushReplacement(ExamComment.route());
      }
    });

    countdownController = CountdownController(
      duration: const Duration(seconds: 7200),
      onEnd: () {
        // Nộp bài
      },
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await player.dispose();
    pageController.dispose();
    timer.cancel();
  }

  Widget _buildPart1(Exams exam) {
    if (exam.audio != null || exam.audio!.isNotEmpty) {
      initPlayer(exam.audio!);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 3, color: lightTextColor),
            ),
            child: ListView.builder(
              itemCount: exam.images!.length,
              itemBuilder: (context, index) => CachedNetworkImage(
                  imageUrl:
                      "$FIREBASE_URL/${exam.images![index].url}?alt=media"),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
              itemCount: exam.questions!.length,
              itemBuilder: (context, index) {
                var selected = examinationCubit.choices
                    ?.firstWhere(
                        (element) => element.id == exam.questions![index].id)
                    .selected;
                return OneChoice(
                  data: examinationCubit
                      .convertQuestionToMap(exam.questions![index]),
                  onChanged: (nVal) => examinationCubit.chooseAnswer(
                      nVal, exam.questions![index].id!),
                  questionNumber: examinationCubit
                      .getSelectionNumber(exam.questions![index].id!),
                  questionContent: exam.questions![index].content!,
                  kind:
                      exam.part!.id! <= 2 ? KindDisplay.ABCD : KindDisplay.BOTH,
                  selected: selected!,
                  isEnable: widget.examinationId == -1,
                  explain: exam.questions![index].explain ?? '',
                );
              }),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ValueListenableBuilder<Duration>(
                  valueListenable: position,
                  builder: (_, data, __) => Slider(
                    value: data.inSeconds.toDouble(),
                    min: 0,
                    max: duration.value.inSeconds.toDouble(),
                    onChanged: (value) async {
                      position.value = Duration(seconds: value.toInt());
                      await player.seek(position.value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder<Duration>(
                    valueListenable: position,
                    builder: (_, value, __) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(value)),
                        Text(formatTime(duration.value - position.value))
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            var nVal = position.value.inSeconds + 5;
                            if (nVal <= duration.value.inSeconds) {
                              position.value = Duration(
                                  seconds: position.value.inSeconds + 5);
                              await player.seek(position.value);
                            } else {
                              position.value = duration.value;
                              await player.seek(position.value);
                            }
                          },
                          icon: const Icon(Icons.forward_5),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: IconButton(
                            onPressed: () async {
                              if (isPlaying.value) {
                                isPlaying.value = false;
                                await player.pause();
                              } else {
                                if (isCompleted) {
                                  initPlayer(exam.audio!);
                                } else {
                                  isPlaying.value = true;
                                  await player.resume();
                                }
                              }
                            },
                            icon: ValueListenableBuilder<bool>(
                              valueListenable: isPlaying,
                              builder: (_, value, __) => Icon(
                                value
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            var nVal = position.value.inSeconds - 5;
                            if (nVal >= 0) {
                              position.value = Duration(seconds: nVal);
                              await player.seek(position.value);
                            } else {
                              position.value = Duration.zero;
                              await player.seek(position.value);
                            }
                          },
                          icon: const Icon(Icons.replay_5),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPart2(Exams exam) {
    if (exam.audio != null || exam.audio!.isNotEmpty) {
      initPlayer(exam.audio!);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 16,
          child: ListView.builder(
              itemCount: exam.questions!.length,
              itemBuilder: (context, index) {
                var selected = examinationCubit.choices
                    ?.firstWhere(
                        (element) => element.id == exam.questions![index].id)
                    .selected;
                return OneChoice(
                  data: examinationCubit.convertQuestionToMap(
                      exam.questions![index],
                      hasD: false),
                  onChanged: (nVal) => examinationCubit.chooseAnswer(
                      nVal, exam.questions![index].id!),
                  questionNumber: examinationCubit
                      .getSelectionNumber(exam.questions![index].id!),
                  questionContent: exam.questions![index].content!,
                  kind:
                      exam.part!.id! <= 2 ? KindDisplay.ABCD : KindDisplay.BOTH,
                  selected: selected!,
                  isEnable: widget.examinationId == -1,
                  explain: exam.questions![index].explain ?? '',
                );
              }),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ValueListenableBuilder<Duration>(
                  valueListenable: position,
                  builder: (_, data, __) => Slider(
                    value: data.inSeconds.toDouble(),
                    min: 0,
                    max: duration.value.inSeconds.toDouble(),
                    onChanged: (value) async {
                      position.value = Duration(seconds: value.toInt());
                      await player.seek(position.value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder<Duration>(
                    valueListenable: position,
                    builder: (_, value, __) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(value)),
                        Text(formatTime(duration.value - position.value))
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            var nVal = position.value.inSeconds + 5;
                            if (nVal <= duration.value.inSeconds) {
                              position.value = Duration(
                                  seconds: position.value.inSeconds + 5);
                              await player.seek(position.value);
                            } else {
                              position.value = duration.value;
                              await player.seek(position.value);
                            }
                          },
                          icon: const Icon(Icons.forward_5),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: IconButton(
                            onPressed: () async {
                              if (isPlaying.value) {
                                isPlaying.value = false;
                                await player.pause();
                              } else {
                                if (isCompleted) {
                                  initPlayer(exam.audio!);
                                } else {
                                  isPlaying.value = true;
                                  await player.resume();
                                }
                              }
                            },
                            icon: ValueListenableBuilder<bool>(
                              valueListenable: isPlaying,
                              builder: (_, value, __) => Icon(
                                value
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            var nVal = position.value.inSeconds - 5;
                            if (nVal >= 0) {
                              position.value = Duration(seconds: nVal);
                              await player.seek(position.value);
                            } else {
                              position.value = Duration.zero;
                              await player.seek(position.value);
                            }
                          },
                          icon: const Icon(Icons.replay_5),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPart3(Exams exam) {
    if (exam.audio != null || exam.audio!.isNotEmpty) {
      initPlayer(exam.audio!);
    }
    var hasImage = exam.images?.isNotEmpty ?? false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hasImage
            ? Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 3, color: lightTextColor),
                  ),
                  child: ListView.builder(
                    itemCount: exam.images!.length,
                    itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            "$FIREBASE_URL/${exam.images![index].url}?alt=media"),
                  ),
                ),
              )
            : const SizedBox(),
        Expanded(
          flex: hasImage ? 10 : 16,
          child: ListView.builder(
              itemCount: exam.questions!.length,
              itemBuilder: (context, index) {
                var selected = examinationCubit.choices
                    ?.firstWhere(
                        (element) => element.id == exam.questions![index].id)
                    .selected;
                return OneChoice(
                  data: examinationCubit
                      .convertQuestionToMap(exam.questions![index]),
                  onChanged: (nVal) => examinationCubit.chooseAnswer(
                      nVal, exam.questions![index].id!),
                  questionNumber: examinationCubit
                      .getSelectionNumber(exam.questions![index].id!),
                  questionContent: exam.questions![index].content!,
                  kind:
                      exam.part!.id! <= 2 ? KindDisplay.ABCD : KindDisplay.BOTH,
                  selected: selected!,
                  isEnable: widget.examinationId == -1,
                  explain: exam.questions![index].explain ?? '',
                );
              }),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ValueListenableBuilder<Duration>(
                  valueListenable: position,
                  builder: (_, data, __) => Slider(
                    value: data.inSeconds.toDouble(),
                    min: 0,
                    max: duration.value.inSeconds.toDouble(),
                    onChanged: (value) async {
                      position.value = Duration(seconds: value.toInt());
                      await player.seek(position.value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder<Duration>(
                    valueListenable: position,
                    builder: (_, value, __) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(value)),
                        Text(formatTime(duration.value - position.value))
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            var nVal = position.value.inSeconds + 5;
                            if (nVal <= duration.value.inSeconds) {
                              position.value = Duration(
                                  seconds: position.value.inSeconds + 5);
                              await player.seek(position.value);
                            } else {
                              position.value = duration.value;
                              await player.seek(position.value);
                            }
                          },
                          icon: const Icon(Icons.forward_5),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: IconButton(
                            onPressed: () async {
                              if (isPlaying.value) {
                                isPlaying.value = false;
                                await player.pause();
                              } else {
                                if (isCompleted) {
                                  initPlayer(exam.audio!);
                                } else {
                                  isPlaying.value = true;
                                  await player.resume();
                                }
                              }
                            },
                            icon: ValueListenableBuilder<bool>(
                              valueListenable: isPlaying,
                              builder: (_, value, __) => Icon(
                                value
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            var nVal = position.value.inSeconds - 5;
                            if (nVal >= 0) {
                              position.value = Duration(seconds: nVal);
                              await player.seek(position.value);
                            } else {
                              position.value = Duration.zero;
                              await player.seek(position.value);
                            }
                          },
                          icon: const Icon(Icons.replay_5),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPart5(Exams exam) {
    var hasImage = exam.images?.isNotEmpty ?? false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hasImage
            ? Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 3, color: lightTextColor),
                  ),
                  child: ListView.builder(
                    itemCount: exam.images!.length,
                    itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            "$FIREBASE_URL/${exam.images![index].url}?alt=media"),
                  ),
                ),
              )
            : const SizedBox(),
        Text(
          exam.paragraph ?? '',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
            itemCount: exam.questions!.length,
            itemBuilder: (context, index) {
              var selected = examinationCubit.choices
                  ?.firstWhere(
                      (element) => element.id == exam.questions![index].id)
                  .selected;
              return OneChoice(
                data: examinationCubit
                    .convertQuestionToMap(exam.questions![index]),
                onChanged: (nVal) => examinationCubit.chooseAnswer(
                    nVal, exam.questions![index].id!),
                questionNumber: examinationCubit
                    .getSelectionNumber(exam.questions![index].id!),
                questionContent: exam.questions![index].content!,
                kind: exam.part!.id! <= 2 ? KindDisplay.ABCD : KindDisplay.BOTH,
                selected: selected!,
                isEnable: widget.examinationId == -1,
                explain: exam.questions![index].explain ?? '',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPart6(Exams exam) {
    var hasImage = exam.images?.isNotEmpty ?? false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hasImage
            ? Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 3, color: lightTextColor),
                  ),
                  child: ListView.builder(
                    itemCount: exam.images!.length,
                    itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            "$FIREBASE_URL/${exam.images![index].url}?alt=media"),
                  ),
                ),
              )
            : const SizedBox(),
        Text(
          exam.paragraph ?? '',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
            itemCount: exam.questions!.length,
            itemBuilder: (context, index) {
              var selected = examinationCubit.choices
                  ?.firstWhere(
                      (element) => element.id == exam.questions![index].id)
                  .selected;
              return OneChoice(
                data: examinationCubit
                    .convertQuestionToMap(exam.questions![index]),
                onChanged: (nVal) => examinationCubit.chooseAnswer(
                    nVal, exam.questions![index].id!),
                questionNumber: examinationCubit
                    .getSelectionNumber(exam.questions![index].id!),
                questionContent: exam.questions![index].content!,
                kind: exam.part!.id! <= 2 ? KindDisplay.ABCD : KindDisplay.BOTH,
                selected: selected!,
                isEnable: widget.examinationId == -1,
                explain: exam.questions![index].explain ?? '',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPart(Exams exam) {
    if (exam.part!.id == 1) {
      return _buildPart1(exam);
    } else if (exam.part!.id == 2) {
      return _buildPart2(exam);
    } else if (exam.part!.id == 3 || exam.part!.id == 4) {
      return _buildPart3(exam);
    } else if (exam.part!.id == 5) {
      return _buildPart5(exam);
    } else {
      return _buildPart6(exam);
    }
  }

  _buildDescription() {
    return Center(
      child: Text("Desctiption"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Test ${examinationCubit.examination?.testId ?? 1}",
                  style: textTitleStyle.copyWith(
                    color: darkBlueColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ValueListenableBuilder<int>(
                  valueListenable: curIndexNotifier,
                  builder: (_, curIndex, __) => Text(
                    "Câu hỏi: ${curIndex + 1}/${examinationCubit.choices?.length ?? 'N/A'}",
                    style: textTitleStyle.copyWith(
                      color: lightTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => QuizDialog(
                  data: examinationCubit.choices ?? [],
                  pageController: pageController,
                ),
              ),
              child: Image.asset(
                'assets/images/quiz.png',
                width: 24,
                height: 24,
              ),
            ),
            widget.examinationId == -1
                ? GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => NotificationDialog(
                        title: 'Thông báo',
                        content: 'Bạn có chắc chắn muốn nộp bài.',
                        onPositiveTap: () {
                          // Call API nộp bài -> Xong
                          Navigator.pop(context);
                          loadingCubit.showLoading();
                          examinationCubit.submitExamination(totalTime.value);
                        },
                        onNegativeTap: () => Navigator.pop(context),
                        positive: 'Nộp bài',
                        negative: 'Hủy',
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/submit.png',
                      width: 32,
                      height: 32,
                    ),
                  )
                : const SizedBox(),
            ValueListenableBuilder<int>(
              valueListenable: totalTime,
              builder: (context, value, _){
                var time = convertTotalTimeToString(value);
                return Text(
                  widget.examinationId == -1 ? time : "",
                  style: textTitleStyle.copyWith(
                    color: lightTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),);
              },
            ),
          ],
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              color: orangeColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              reverse: false,
              physics: const ClampingScrollPhysics(),
              itemCount: examinationCubit.examination?.test?.exams?.length ?? 0,
              controller: pageController,
              itemBuilder: (context, index) {
                return _buildPart(widget.test.exams![index]);
              },
              onPageChanged: (index) {
                curIndexNotifier.value = index;
              },
            ),
            Loading(loadingCubit: loadingCubit)
          ],
        ),
      ),
    );
  }
}
