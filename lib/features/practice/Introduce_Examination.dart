import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/ui_kits/colors.dart';
import 'package:toeic/ui_kits/widgets/cubits/loading_cubit.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_button.dart';
import '../../apis/models/Test.dart';
import '../../injection/injection.dart';
import '../../ui_kits/widgets/views/sbox_loading.dart';
import 'examination_page.dart';

class IntroduceExamination extends StatefulWidget {
  const IntroduceExamination({Key? key, required this.test}) : super(key: key);
  final Test test;

  static Route route({required Test test}) {
    return MaterialPageRoute(
      builder: (_) => IntroduceExamination(
        test: test,
      ),
    );
  }

  @override
  State<IntroduceExamination> createState() => _IntroduceExaminationState();
}

class _IntroduceExaminationState extends State<IntroduceExamination> {
  late int key;
  final String part1 =
      "Bạn sẽ xem một bức hình → Nghe 4 lựa chọn A, B, C, D → Chọn một đáp án mô tả chính xác nhất nội dung có trong hình.\n\n";
  final String part2 =
      "Bạn sẽ nghe một câu hỏi hoặc một câu nói → Nghe tiếp 3 câu trả lời / hồi đáp lại câu trên (tương ứng với 3 lựa chọn A, B, C) → Chọn một câu hồi đáp phù hợp nhất cho câu hỏi.\n\n";
  final String part3 =
      "Bạn sẽ lắng nghe các đoạn hội thoại ngắn giữa 2 người -> Với mỗi đoạn sẽ có 3 câu hỏi, mỗi câu hỏi có 4 lựa chọn A, B, C, D. Bạn đọc câu hỏi và chọn câu trả lời phù hợp nhất cho câu hỏi.\n\n";
  final String part4 =
      "Bạn sẽ lắng nghe các bài nói chuyện ngắn (độc thoại) → Với mỗi đoạn sẽ có 3 câu hỏi, mỗi câu hỏi có 4 lựa chọn A, B, C, D. Bạn đọc câu hỏi và chọn câu trả lời phù hợp nhất cho câu hỏi.\n\n";
  final String part5 =
      "Bạn sẽ được cho một câu có một chỗ trống → Chọn một đáp án phù hợp nhất để điền vào chỗ trống.\n\n";
  final String part6 =
      "Bạn sẽ được cho một đoạn văn có nhiều chỗ trống → Chọn một đáp án phù hợp nhất để điền vào chỗ trống.\n\n";
  final String part7 =
      "Bạn sẽ được cho 15 bài đọc với mỗi bài gồm 1, 2 hoặc 3 đoạn văn. Số lượng câu hỏi cho mỗi bài đọc dao động từ 2 đến 5 câu → Bạn đọc câu hỏi và chọn câu trả lời phù hợp nhất cho câu hỏi.\n\n";
  final List<String> title = [
    'Mô tả hình ảnh',
    'Hỏi & Đáp',
    'Đoạn hội thoại',
    'Bài nói chuyện ngắn',
    'Điền vào câu',
    'Điền vào đoạn văn',
    'Đọc hiểu đoạn văn',
    'Thi thử'
  ];

  final examinationCubit = getIt<ExaminationCubit>();
  final loadingCubit = getIt<LoadingCubit>();

  @override
  void initState() {
    /// Gán key bằng typeTestId
    key = widget.test.typeTest?.id ?? 1;
    examinationCubit.stream.listen((state) {
      if (state is ExaminationStateStarted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => ShowCaseWidget(
              builder: Builder(
                builder: (context) => ExaminationPage(
                    test: examinationCubit.examination!.test!,
                    examinationId: -1,
                ),
              ),
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        /// Dựa vào loại bài thi sẽ có title khác nhau
        title: Text(
          title[key - 1],
          style: GoogleFonts.openSans(
              fontSize: 18, color: darkBlueColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              width: 24,
              height: 24,
              color: orangeColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 64),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      borderOnForeground: true,
                      shadowColor: lightPurpleColor,
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 12,
                              child: SingleChildScrollView(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Hướng dẫn: ',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: orangeColor,
                                    ),
                                    /// Build hướng dẫn
                                    children: [
                                      TextSpan(
                                        text: key == 1 || key == 8
                                            ? "\n\n${title[0]}: "
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 1 || key == 8
                                            ? "$part1"
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 2 || key == 8
                                            ? "${title[1]}: "
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 2 || key == 8 ? part2 : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 3 || key == 8
                                            ? "${title[2]}: "
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 3 || key == 8 ? part3 : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 4 || key == 8
                                            ? "${title[3]}: "
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 4 || key == 8 ? part4 : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 5 || key == 8
                                            ? "${title[4]}: "
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 5 || key == 8 ? part5 : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 6 || key == 8
                                            ? "${title[5]}: "
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 6 || key == 8 ? part6 : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 7 || key == 8
                                            ? "${title[6]}: "
                                            : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: key == 7 || key == 8 ? part7 : '',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: makeSBoxButton(
                                  'Làm bài',
                                  onTap: () {
                                    loadingCubit.showLoading();
                                    /// Khi click vào nút làm bài, thực hiện tạo 1 Examination.
                                    /// Nếu có examination nào chưa hoàn thành thì sẽ lấy nó.
                                    /// Không có mạng: Tạo 1 examination ở db
                                    examinationCubit
                                        .startExamination(widget.test.id!);
                                  },
                                  height: 50,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    'assets/images/character-illustration.svg',
                    height: 256,
                  ),
                ),
              ],
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
