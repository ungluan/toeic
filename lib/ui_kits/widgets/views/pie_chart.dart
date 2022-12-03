import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toeic/features/home/cubit/piechart_cubit.dart';

import '../../../injection/injection.dart';
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key,  required this.data});
  final List<double> data  ;
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;
  late List<double> data;
  double sum = 1;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    sum = data.reduce((value, element) => value+element);
  }


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                text: 'Part 1',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: 'Part 2',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff845bef),
                text: 'Part 3',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff13d38e),
                text: 'Part 4',
                isSquare: false,
              ),
              Indicator(
                color: Colors.yellow,
                text: 'Part 5',
                isSquare: false,
              ),
              Indicator(
                color: Colors.indigo,
                text: 'Part 6',
                isSquare: false,
              ),
              Indicator(
                color: Colors.pink,
                text: 'Part 7',
                isSquare: false,
              ),
              Indicator(
                color: Colors.redAccent,
                text: 'Thi thử',
                isSquare: false,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(8, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 12.0;
      final radius = isTouched ? 100.0 : 80.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: data[0],
            title: '${((data[0] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: data[1],
            title: '${((data[1] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: data[2],
            title: '${((data[2] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: data[3],
            title: '${((data[3] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.yellow,
            value: data[4],
            title: '${((data[4] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.indigo,
            value: data[5],
            title: '${((data[5] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 6:
          return PieChartSectionData(
            color: Colors.pink,
            value: data[6],
            title: '${((data[6] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 7:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: data[7],
            title: '${((data[7] / sum) * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
