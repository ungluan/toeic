import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toeic/features/home/cubit/barchart_cubit.dart';
import 'package:toeic/features/home/cubit/radar_chart_cubit.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/colors.dart';
import '../../ui_kits/widgets/views/d_chart_bart.dart';
import '../../ui_kits/widgets/views/pie_chart.dart';
import '../../utils/utils.dart';
import '../activity/cubit/user_cubit.dart';
import 'cubit/home_cubit.dart';
import 'cubit/piechart_cubit.dart';
import 'cubit/progress_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final homeCubit = getIt<HomeCubit>();
  final pieChartCubit = getIt<PieChartCubit>();
  final barChartCubit = getIt<BarChartCubit>();
  final progressCubit = getIt<ProgressCubit>();
  final userCubit = getIt<UserCubit>();
  final radarChartCubit = getIt<RadarChartCubit>();

  var ticks = [20, 40, 60, 80, 100];
  var features = [
    "Part 1",
    "Part 2",
    "Part 3",
    "Part 4",
    "Part 5",
    "Part 6",
    "Part 7"
  ];

  @override
  void initState() {
    super.initState();
    setup();
  }

  void setup() async {
    /// Vẫn chưa lưu trữ được đống này
    Future.wait([
      /// Chart 01
      progressCubit.getAverageScoreFrom3LastExamination(),

      /// Chart 02
      barChartCubit.getDataBarChar(),

      /// Chart 03
      pieChartCubit.getSumOfTest(),

      /// Chart 04
      radarChartCubit.getDataRadarChar()

      //   homeCubit.getActivities(DateTime.now().year, DateTime.now().month),

    ]);
    userCubit.getUser();
    homeCubit.saveDataToDB();
  }

  Widget _buildTitleChart({required String title}) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: lightTextColor,
        ),
      ),
    );
  }

  Widget _buildTitle({required String title}) {
    return Text(
      title,
      style: GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: darkBlueColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<UserCubit, UserState>(
                bloc: userCubit,
                builder: (context, state) => state.maybeWhen(
                    loaded: (user) => Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/security-on-green.svg'),
                                  Text(
                                    "Xin chào: ",
                                    style: GoogleFonts.openSans(
                                      color: Colors.deepPurple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    user?.lastName ?? '',
                                    style: GoogleFonts.openSans(
                                      color: Colors.deepPurple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 100,
                                      height: 54,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: lightPurpleColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: DefaultTextStyle(
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: orangeColor),
                                        child: AnimatedTextKit(
                                          displayFullTextOnTap: true,
                                          repeatForever: true,
                                          animatedTexts: [
                                            RotateAnimatedText(
                                                '${user?.target ?? 500} Toeic'),
                                          ],
                                          onTap: () {
                                            print("Tap Event");
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: lightPurpleColor,
                            ),
                            BlocBuilder<ProgressCubit, ProgressState>(
                              bloc: progressCubit,
                              buildWhen: (p, c) => c is ProgressStateLoaded,
                              builder: (context, state) =>
                                  state.maybeWhen(loaded: (data) {
                                logger("CHART 1 STATE LOADED");
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1. Mức điểm trung bình: ${data.toInt()}',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Center(
                                      child: SleekCircularSlider(
                                        appearance: CircularSliderAppearance(
                                          customWidths: CustomSliderWidths(
                                              progressBarWidth: 10),
                                        ),
                                        min: 0,
                                        max: 100,
                                        initialValue: (data /
                                                (userCubit.user?.target ??
                                                    700)) *
                                            100,
                                      ),
                                    ),
                                  ],
                                );
                              }, orElse: () {
                                logger("CHART 1 STATE != LOADED");
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1. Mức điểm trung bình: 0',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Center(
                                      child: SleekCircularSlider(
                                        appearance: CircularSliderAppearance(
                                          customWidths: CustomSliderWidths(
                                              progressBarWidth: 10),
                                        ),
                                        min: 0,
                                        max: 100,
                                        initialValue: 0,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                            _buildTitleChart(
                                title:
                                    "Biểu đồ miêu tả năng lực hiện tại so mới mục tiêu"),
                          ],
                        ),
                    orElse: () => Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/security-on-green.svg'),
                                  Text(
                                    "Xin chào: ",
                                    style: GoogleFonts.openSans(
                                      color: Colors.deepPurple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    userCubit.user?.lastName ?? '...',
                                    style: GoogleFonts.openSans(
                                      color: Colors.deepPurple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 100,
                                      height: 54,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: lightPurpleColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: DefaultTextStyle(
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: orangeColor),
                                        child: AnimatedTextKit(
                                          displayFullTextOnTap: true,
                                          repeatForever: true,
                                          animatedTexts: [
                                            RotateAnimatedText(
                                                '${userCubit.user?.target ?? 500} Toeic'),
                                          ],
                                          onTap: () {
                                            print("Tap Event");
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: lightPurpleColor,
                            ),
                            // BlocBuilder<ProgressCubit, ProgressState>(
                            //   bloc: progressCubit,
                            //   builder: (context, state) => state.maybeWhen(
                            //     loaded: (data) => Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           '1. Mức điểm trung bình: ${data.toInt()}',
                            //           textAlign: TextAlign.start,
                            //           style: GoogleFonts.openSans(
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.bold,
                            //             color: darkBlueColor,
                            //           ),
                            //         ),
                            //         const SizedBox(
                            //           height: 8,
                            //         ),
                            //         Center(
                            //           child: SleekCircularSlider(
                            //             appearance: CircularSliderAppearance(
                            //               customWidths:
                            //                   CustomSliderWidths(progressBarWidth: 10),
                            //             ),
                            //             min: 0,
                            //             max: 100,
                            //             initialValue:
                            //                 (data / (userCubit.user?.target ?? 700)) * 100,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     orElse: () => Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           '1. Mức điểm trung bình: 0',
                            //           textAlign: TextAlign.start,
                            //           style: GoogleFonts.openSans(
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.bold,
                            //             color: darkBlueColor,
                            //           ),
                            //         ),
                            //         const SizedBox(
                            //           height: 8,
                            //         ),
                            //         Center(
                            //           child: SleekCircularSlider(
                            //             appearance: CircularSliderAppearance(
                            //               customWidths:
                            //                   CustomSliderWidths(progressBarWidth: 10),
                            //             ),
                            //             min: 0,
                            //             max: 100,
                            //             initialValue: 0,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            _buildTitleChart(
                                title:
                                    "Biểu đồ miêu tả năng lực hiện tại so mới mục tiêu"),
                          ],
                        )),
              ),
              Divider(
                thickness: 1,
                color: lightPurpleColor,
              ),
              _buildTitle(title: "2. Tiến độ luyện tập"),
              BlocBuilder<BarChartCubit, BarChartState>(
                bloc: barChartCubit,
                buildWhen: (p, c) => c is BarChartStateLoaded,
                builder: (context, state) => state.maybeWhen(
                  loaded: (dataUser, dataApp) {
                    logger("BARCHARCUBIT");
                    logger("DATAUSER:");
                    logger(dataUser);
                    logger("DATAAPP:");
                    logger(dataApp);
                    if (dataUser == null ||
                        dataUser.length != 8 ||
                        dataApp == null ||
                        dataApp.length != 8) {
                      return const SizedBox(
                        child: Center(child: Text('Chưa có dữ liệu')),
                      );
                    }

                    return AppBarChart(dataUser: dataUser, dataApp: dataApp);
                  },
                  orElse: () => const SizedBox(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _buildTitleChart(title: "Biểu đồ miêu tả tiến độ luyện tập"),
              Divider(
                thickness: 1,
                color: lightPurpleColor,
              ),
              _buildTitle(title: "3. Xu hướng luyện tập"),
              BlocBuilder<PieChartCubit, PieChartState>(
                bloc: pieChartCubit,
                buildWhen: (p, c) => c is PieChartStateLoaded,
                builder: (context, state) => state.maybeWhen(
                  loaded: (data) {
                    print("Length: " + data.length.toString());
                    if (data == null || data.length == 0 || data.length != 8) {
                      return const SizedBox(
                        child: Center(
                          child: Text('Chưa có dữ liệu'),
                        ),
                      );
                    }
                    return PieChartSample2(data: data);
                  },
                  orElse: () => const SizedBox(),
                ),
              ),
              _buildTitleChart(title: "Biểu đồ thể hiện xu hướng luyện tập"),
              const SizedBox(height: 16),
              Divider(
                thickness: 1,
                color: lightPurpleColor,
              ),
              _buildTitle(title: "4. Năng lực bản thân"),
              SizedBox(
                height: 324,
                child: BlocBuilder<RadarChartCubit, RadarChartState>(
                  bloc: radarChartCubit,
                  builder: (context, state) => state.maybeWhen(
                    loaded: (data) {
                      logger("Radar Chart");
                      logger(data);
                      if(data == null || data.length == 0 || data.length != 7) {
                        return const SizedBox(
                        child: Center(child: Text('Chưa có dữ liệu',)),
                      );
                      }
                      var newData = [
                        (data[0] / 6) * 100,
                        (data[1] / 25) * 100,
                        (data[2] / 39) * 100,
                        (data[3] / 30) * 100,
                        (data[4] / 30) * 100,
                        (data[5] / 16) * 100,
                        (data[6] / 54) * 100
                      ];
                      return RadarChart.light(
                        ticks: ticks,
                        features: features,
                        data: [newData],
                        reverseAxis: false,
                        useSides: true,
                      );
                    },
                    orElse: () => const SizedBox(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: _buildTitleChart(
                  title:
                      "Biểu đồ miêu tả chi tiết phần trăm đúng mỗi phần của trung bình 3 bài thi thử gần nhất",
                ),
              ),
              Divider(
                thickness: 1,
                color: lightPurpleColor,
              ),
              _buildTitle(title: "5. Lịch sử hoạt động"),
              // BlocBuilder<HomeCubit, HomeState>(
              //   bloc: homeCubit,
              //   builder: (context, state) {
              //     return HeatMapCalendar(
              //       defaultColor: Colors.white,
              //       flexible: true,
              //       colorMode: ColorMode.color,
              //       datasets: homeCubit.dateActivities,
              //       colorsets: const {
              //         1: Colors.green,
              //       },
              //       borderRadius: 100.0,
              //       showColorTip: false,
              //       onMonthChange: (value) {
              //         homeCubit.getActivities(value.year, value.month);
              //       },
              //       // onClick: (value) {
              //       //   ScaffoldMessenger.of(context).showSnackBar(
              //       //       SnackBar(content: Text(value.toString())));
              //       // },
              //     );
              //   },
              // ),
              const SizedBox(
                height: 8,
              ),
              _buildTitleChart(title: "Biểu đồ miêu tả hoạt động theo tháng"),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
