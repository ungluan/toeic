import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:toeic/features/practice/cubit/test_cubit.dart';
import 'package:toeic/injection/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double numberOfFeatures = 3;
  final testCubit = getIt<TestCubit>();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    const ticks = [10, 20, 30, 40, 50];
    var features = ["Part 1", "Part 2", "Part 3", "Part 4", "Part 5", "Part 6", "Part 7"];
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
        child: Column(
          children: [
            Text('Trick'),
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
            Text('Lịch sử hoạt động'),
            Container(
              height: 420,
              child: HeatMapCalendar(
                defaultColor: Colors.white,
                flexible: true,
                colorMode: ColorMode.color,
                datasets: {
                  DateTime(2022, 10, 6): 3,
                  DateTime(2022, 10, 7): 7,
                  DateTime(2022, 10, 8): 10,
                  DateTime(2022, 10, 9): 13,
                  DateTime(2022, 10, 13): 6,
                },
                colorsets: const {
                  1: Colors.red,
                  3: Colors.orange,
                  5: Colors.yellow,
                  7: Colors.green,
                  9: Colors.blue,
                  11: Colors.indigo,
                  13: Colors.purple,
                },
                onClick: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
