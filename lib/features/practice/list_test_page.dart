import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
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
  ReceivePort _port = ReceivePort();


  @override
  void initState() {
    super.initState();
    loadingCubit.showLoading();
    testCubit.getListTestByTypeTest(widget.typeTestId);
    testCubit.getIdsFromTestDownloaded();
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
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
    IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  Future<void> download(String nameFile) async {
    var url = "$FIREBASE_URL/$nameFile?alt=media";
    final appDocDir = await getExternalStorageDirectory();
    final filePath = "${appDocDir?.path}";
    await FlutterDownloader.enqueue(
      url: url,
      headers: {},
      // optional: header send with url (auth token etc)
      savedDir: filePath,
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification: true,
      // click on notification to open downloaded file (for Android)
      saveInPublicStorage: true,
    );
    await unzip(nameFile);
  }

  Future<void> unzip(String nameFile) async {
    final destinationDir = await getExternalStorageDirectory();
    final zipFile = File("${destinationDir?.path}/$nameFile");

    try {
      await ZipFile.extractToDirectory(
          zipFile: zipFile,
          destinationDir: destinationDir!,
          onExtracting: (zipEntry, progress) {
            if (kDebugMode) {
              print('progress: ${progress.toStringAsFixed(1)}%');
              print('name: ${zipEntry.name}');
              print('isDirectory: ${zipEntry.isDirectory}');
              print(
                  'modificationDate: ${zipEntry.modificationDate?.toLocal().toIso8601String()}');
              print('uncompressedSize: ${zipEntry.uncompressedSize}');
              print('compressedSize: ${zipEntry.compressedSize}');
              print('compressionMethod: ${zipEntry.compressionMethod}');
              print('crc: ${zipEntry.crc}');
            }
            return ZipFileOperation.includeItem;
          });
    } catch (e) {
      print(e);
    }
  }



  /// Build Item: đầu vào là bài test, bài thi gần nhất
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
      /// Chuyển đến trang giới thiệu bài thi
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
                          const SizedBox(
                            width: 4,
                          ),
                          test.typeTest?.id == 8 && examination != null
                              ? Text(
                                  'Điểm: ${calScore(examination)}',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: orangeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const SizedBox(),
                          const Spacer(),
                          testCubit.isDownloaded(test.id!)
                              ? const SizedBox(
                                  width: 72,
                                  height: 48,
                                  child: Icon(
                                    Icons.download_done_sharp,
                                    size: 24,
                                  ),
                                )
                              : InkWell(
                                  onTap: () async {
                                    try{
                                      await download("part1.zip");
                                      testCubit.updateDownload(test.id!);
                                    }catch(e){

                                    }
                                  },
                                  child: const SizedBox(
                                    width: 72,
                                    height: 48,
                                    child: Icon(
                                      Icons.download_sharp,
                                      size: 24,
                                    ),
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
                            onTap: () async {
                              /// Xem chi tiết (Nếu có)
                              loadingCubit.showLoading();
                              if (examination?.finishedAt != null) {
                                /// Setup xem chi tiết
                                await examinationCubit
                                    .setupReadExamination(examination!.id!);
                                if (mounted) {
                                  /// Chuyển đến trang thi với chế độ readOnly
                                  Navigator.of(context).push(
                                      ExaminationPage.route(test,
                                          examinationId: examination.id!));
                                  loadingCubit.hideLoading();
                                }
                              }
                            },
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

  int calScore(Examination? examination) {
    if (examination?.test?.typeTest?.id != 8) return 0;
    var totalScore = 0;
    var listening = (examination?.numberCorrectPart1 ?? 0) +
        (examination?.numberCorrectPart2 ?? 0) +
        (examination?.numberCorrectPart3 ?? 0) +
        (examination?.numberCorrectPart4 ?? 0);
    var reading = (examination?.numberCorrectPart5 ?? 0) +
        (examination?.numberCorrectPart6 ?? 0) +
        (examination?.numberCorrectPart7 ?? 0);
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

        /// Thi thử thì không có nút back
        leading: widget.typeTestId != 8
            ? GestureDetector(
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
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(),
                        // child: SizedBox(
                        //   height: 80,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(horizontal: 16),
                        //     child: DropdownSearch<String>(
                        //       popupProps: const PopupProps.menu(
                        //         showSelectedItems: true,
                        //       ),
                        //       items: const [
                        //         "500",
                        //         "700",
                        //         "900"
                        //       ],
                        //       dropdownDecoratorProps: const DropDownDecoratorProps(
                        //         dropdownSearchDecoration: InputDecoration(
                        //           labelText: "Mục tiêu",
                        //           hintText: "Chọn mục tiêu",
                        //         ),
                        //       ),
                        //       onChanged: (val){
                        //         //Todo: Thực hiện call api và reset lại mảng
                        //         print(val);
                        //       },
                        //       selectedItem: examinationCubit.authenticationRepository.user?.target?.toString() ?? "500",
                        //     ),
                        //   ),
                        // ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          // padding: EdgeInsets.only(bottom: 150),
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              if (index == testCubit.listTest.length) {
                                return Container(
                                  height: widget.typeTestId == 8 ? 150 : 100,
                                );
                              }
                              if(testCubit.examination?.length == 0){
                                return Text(
                                  "Examination rong"
                                );
                              }
                              /// Điểm mấu chốt quan trọng ở đây chỉ cần đảm bảo 2 điều kiện sau:
                              /// 1. Lấy được danh sách đề bài. Nếu không mạng gọi db
                              /// 2. Lấy được danh sách lịch sử thi. Nếu không mạng gọi db
                              return _buildTestItem(testCubit.listTest[index],
                                  testCubit.examination?[index]);
                            },
                            itemCount: testCubit.listTest.length + 1,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            Loading(
              loadingCubit: loadingCubit,
            )
          ],
        ),
      ),
    );
  }
}
