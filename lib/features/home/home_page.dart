import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toeic/features/home/cubit/barchart_cubit.dart';
import 'package:toeic/features/home/cubit/radar_chart_cubit.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/colors.dart';

import 'package:d_chart/d_chart.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:toeic/ui_kits/widgets/views/d_chart_bart.dart';
import 'package:toeic/utils/utils.dart';

import '../../ui_kits/widgets/views/pie_chart.dart';
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
    Future.wait([
      homeCubit.getActivities(DateTime.now().year, DateTime.now().month),
      pieChartCubit.getSumOfTest(),
      barChartCubit.getDataBarChar(),
      progressCubit.getAverageScoreFrom3LastExamination(),
      radarChartCubit.getDataRadarChar()
    ]);
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
          child: BlocBuilder<UserCubit, UserState>(
            bloc: userCubit,
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/security-on-green.svg'),
                      Text(
                        "Xin ch??o: ",
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
                              borderRadius: BorderRadius.circular(8)),
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
                BlocBuilder<ProgressCubit, ProgressState>(
                  bloc: progressCubit,
                  builder: (context, state) => state.maybeWhen(
                    loaded: (data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. M???c ??i???m trung b??nh: ${data.toInt()}',
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
                              customWidths:
                                  CustomSliderWidths(progressBarWidth: 10),
                            ),
                            min: 0,
                            max: 100,
                            initialValue:
                                (data / (userCubit.user?.target ?? 700)) * 100,
                          ),
                        ),
                      ],
                    ),
                    orElse: () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. M???c ??i???m trung b??nh: 0',
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
                              customWidths:
                                  CustomSliderWidths(progressBarWidth: 10),
                            ),
                            min: 0,
                            max: 100,
                            initialValue: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildTitleChart(
                    title: "Bi???u ????? mi??u t??? n??ng l???c hi???n t???i so m???i m???c ti??u"),
                Divider(
                  thickness: 1,
                  color: lightPurpleColor,
                ),
                _buildTitle(title: "2. Ti???n ????? luy???n t???p"),
                BlocBuilder<BarChartCubit, BarChartState>(
                  bloc: barChartCubit,
                  buildWhen: (p,c) => c is BarChartStateLoaded,
                  builder: (context, state) => state.maybeWhen(
                    loaded: (dataUser, dataApp) {
                      if(dataUser == null || dataUser.length != 8 || dataApp == null || dataApp.length != 8) return SizedBox(
                        child: Center(child: Text('Ch??a c?? d??? li???u')),
                      );
                      return AppBarChart(dataUser: dataUser, dataApp: dataApp);
                    },
                    orElse: () => const SizedBox(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildTitleChart(title: "Bi???u ????? mi??u t??? ti???n ????? luy???n t???p"),
                Divider(
                  thickness: 1,
                  color: lightPurpleColor,
                ),
                _buildTitle(title: "3. Xu h?????ng luy???n t???p"),
                BlocBuilder<PieChartCubit, PieChartState>(
                  bloc: pieChartCubit,
                  buildWhen: (p,c) => c is PieChartStateLoaded,
                  builder: (context, state) => state.maybeWhen(
                    loaded: (data) {
                      print("Length: "+data.length.toString());
                      if(data == null || data.length == 0 || data.length != 8) {
                        return const SizedBox(
                        child: Center(
                            child: Text('Ch??a c?? d??? li???u'),
                        ),
                      );
                      }
                      return PieChartSample2(data: data);
                      },
                    orElse: () => const SizedBox(),
                  ),
                ),
                _buildTitleChart(title: "Bi???u ????? th??? hi???n xu h?????ng luy???n t???p"),
                const SizedBox(height: 16),
                Divider(
                  thickness: 1,
                  color: lightPurpleColor,
                ),
                _buildTitle(title: "4. N??ng l???c b???n th??n"),
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
                          child: Center(child: Text('Ch??a c?? d??? li???u',)),
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
                        "Bi???u ????? mi??u t??? chi ti???t ph???n tr??m ????ng m???i ph???n c???a trung b??nh 3 b??i thi th??? g???n nh???t",
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: lightPurpleColor,
                ),
                _buildTitle(title: "5. L???ch s??? ho???t ?????ng"),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  builder: (context, state) {
                    return HeatMapCalendar(
                      defaultColor: Colors.white,
                      flexible: true,
                      colorMode: ColorMode.color,
                      datasets: homeCubit.dateActivities,
                      colorsets: const {
                        1: Colors.green,
                      },
                      borderRadius: 100.0,
                      showColorTip: false,
                      onMonthChange: (value) {
                        homeCubit.getActivities(value.year, value.month);
                      },
                      // onClick: (value) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text(value.toString())));
                      // },
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                _buildTitleChart(title: "Bi???u ????? mi??u t??? ho???t ?????ng theo th??ng"),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
