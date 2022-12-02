import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/colors.dart';

// import 'package:d_chart/d_chart.dart';
import 'package:flutter_charts/flutter_charts.dart';

import '../../ui_kits/widgets/views/pie_chart.dart';
import 'cubit/home_cubit.dart';
import 'cubit/piechart_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = getIt<HomeCubit>();
  final piechartCubit = getIt<PieChartCubit>();
  final dataNotifier =
      ValueNotifier<List<double>>([1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]);

  @override
  void initState() {
    super.initState();
    setup();
  }

  void setup() async {
    Future.wait([
      homeCubit.getActivities(DateTime.now().year, DateTime.now().month),
      piechartCubit.getSumOfTest()
    ]);

    piechartCubit.stream.listen((state) {
      if (state is PieChartStateLoaded) {
        print("Data Change");
        dataNotifier.value = state.data;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const ticks = [10, 20, 30, 40, 50];
    var features = [
      "Part 1",
      "Part 2",
      "Part 3",
      "Part 4",
      "Part 5",
      "Part 6",
      "Part 7"
    ];
    var data = [
      [10.0, 20, 28, 5, 16, 15, 50],
      [14.5, 1, 4, 14, 23, 10, 6],
      [36, 10, 50, 50, 50, 50, 20],
      [34, 20, 27, 5, 23, 10, 20],
    ];

    // features = features.sublist(0, numberOfFeatures.floor());
    // data = data
    //     .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
    //     .toList();
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/security-on-green.svg'),
                    Text(
                      "Xin chào: ",
                      style: GoogleFonts.openSans(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Luân",
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
                              RotateAnimatedText('500 Toeic'),
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
              Text(
                '1. Mức điểm trung bình: 532',
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
                    customWidths: CustomSliderWidths(progressBarWidth: 10),
                  ),
                  min: 0,
                  max: 100,
                  initialValue: 50,
                ),
              ),
              Center(
                child: Text(
                  'Biểu đồ miêu tả năng lực hiện tại so mới mục tiêu',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: lightTextColor,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: lightPurpleColor,
              ),
              Text(
                '2. Lịch sử hoạt động',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: darkBlueColor,
                ),
              ),
              Container(
                child: BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  builder: (context, state) {
                    print(homeCubit.dateActivities);
                    return HeatMapCalendar(
                      defaultColor: Colors.white,
                      flexible: true,
                      colorMode: ColorMode.color,
                      datasets: homeCubit.dateActivities,
                      colorsets: {
                        1: Colors.green,
                      },
                      borderRadius: 100.0,
                      showColorTip: false,
                      onMonthChange: (value) {
                        homeCubit.getActivities(value.year, value.month);
                      },
                      onClick: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value.toString())));
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Biểu đồ hoạt động theo tháng',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: lightTextColor,
                  ),
                ),
              ),
              Text('Biểu đồ hoàn thành các đề luyện tập'),
              Text('Biểu đồ điểm mạnh điểm yếu của từng part'),
              Container(
                height: 324,
                child: RadarChart.light(
                  ticks: ticks,
                  features: features,
                  data: data,
                  reverseAxis: false,
                  useSides: true,
                ),
              ),
              Divider(
                thickness: 1,
                color: lightPurpleColor,
              ),
              Text(
                '3. Xu hướng luyện tập',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: darkBlueColor,
                ),
              ),
              // ValueListenableBuilder<List<double>>(
              //   valueListenable: dataNotifier,
              //   builder: (context, data, _){
              //     print("DATATATATATA: ${data}");
              //     return PieChartSample2(data: data);
              //   },
              // ),
              BlocBuilder<PieChartCubit, PieChartState>(
                bloc: piechartCubit,
                builder: (context, state) => state.maybeWhen(
                  loaded: (data) => PieChartSample2(data: data),
                  orElse: () => const SizedBox(),
                ),
              ),
              Center(
                child: Text(
                  'Biểu đồ thể hiện xu hướng luyện tập',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: lightTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// Widget chartToRun() {
//   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions();
//   // Example with side effects cannot be simply pasted to your code, as the _ExampleSideEffects is private
//   // This example shows the result with sufficient space to show all labels, but not enough to be horizontal;
//   // The iterative layout strategy makes the labels to tilt but show fully.
//   chartData = ChartData(
//     dataRows: const [
//       [200.0, 190.0, 180.0, 200.0, 250.0, 300.0],
//       [300.0, 280.0, 260.0, 240.0, 300.0, 350.0],
//     ],
//     xUserLabels: const ['January', 'February', 'March', 'April', 'May', 'June'],
//     dataRowsLegends: const [
//       'Owl count',
//       'Hawk count',
//     ],
//     chartOptions: chartOptions,
//   );
//   // exampleSideEffects = _ExampleSideEffects()..leftSqueezeText='>>'.. rightSqueezeText='<' * 3;
//   var verticalBarChartContainer = VerticalBarChartTopContainer(
//     chartData: chartData,
//     xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//   );
//
//   var verticalBarChart = VerticalBarChart(
//     painter: VerticalBarChartPainter(
//       verticalBarChartContainer: verticalBarChartContainer,
//     ),
//   );
//   return verticalBarChart;
// }
}
