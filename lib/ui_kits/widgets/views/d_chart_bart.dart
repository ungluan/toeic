import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

import '../../colors.dart';

class AppBarChart extends StatelessWidget {
  final List<double> dataUser;
  final List<double> dataApp;

  const AppBarChart({Key? key, required this.dataUser, required this.dataApp})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    double max = dataApp.reduce((cur, next) => cur > next ? cur : next);
    return SizedBox(
      height: 456,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartBar(
          data: [
            {
              'id': 'Bar 1',
              'data': [
                {'domain': '1', 'measure': dataUser[0].toInt()},
                {'domain': '2', 'measure': dataUser[1].toInt()},
                {'domain': '3', 'measure': dataUser[2].toInt()},
                {'domain': '4', 'measure': dataUser[3].toInt()},
                {'domain': '5', 'measure': dataUser[4].toInt()},
                {'domain': '6', 'measure': dataUser[5].toInt()},
                {'domain': '7', 'measure': dataUser[6].toInt()},
                {'domain': 'TT', 'measure': dataUser[7].toInt()},
              ],
            },
            {
              'id': 'Bar 2',
              'data': [
                {'domain': '1', 'measure': dataApp[0].toInt()},
                {'domain': '2', 'measure': dataApp[1].toInt()},
                {'domain': '3', 'measure': dataApp[2].toInt()},
                {'domain': '4', 'measure': dataApp[3].toInt()},
                {'domain': '5', 'measure': dataApp[4].toInt()},
                {'domain': '6', 'measure': dataApp[5].toInt()},
                {'domain': '7', 'measure': dataApp[6].toInt()},
                {'domain': 'TT', 'measure': dataApp[7].toInt()},
              ],
            },
          ],
          yAxisTitle: 'Luyện tập',
          xAxisTitle: 'Bài thi',
          measureMin: 0,
          measureMax: max.toInt(),
          minimumPaddingBetweenLabel: 1,
          domainLabelPaddingToAxisLine: 16,
          axisLineTick: 2,
          axisLinePointTick: 2,
          axisLinePointWidth: 10,
          axisLineColor: lightPurpleColor,
          measureLabelPaddingToAxisLine: 16,
          barColor: (barData, index, id) =>
              id == 'Bar 1' ? Colors.deepPurple.shade200 : dartPurpleColor,
          barValue: (barData, index) => '${barData['measure']}',
          showBarValue: true,
          barValuePosition: BarValuePosition.outside,
          verticalDirection: false,
        ),
      ),
    );
  }
}
