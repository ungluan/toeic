import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

import '../../colors.dart';

class AppBarChart extends StatelessWidget {
  final List<double>? dataUser;
  final List<double>? dataApp;

  const AppBarChart({Key? key, required this.dataUser, required this.dataApp})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    double max = dataApp?.reduce((cur, next) => cur > next ? cur : next) ?? 0;
    return SizedBox(
      height: 456,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartBar(
          data: [
            {
              'id': 'Bar 1',
              'data': [
                {'domain': '1', 'measure': dataUser?.length == 7 ? (dataUser?[0].toInt() ?? 0) : 0},
                {'domain': '2', 'measure': dataUser?.length == 7 ? (dataUser?[1].toInt() ?? 0) : 0},
                {'domain': '3', 'measure': dataUser?.length == 7 ? (dataUser?[2].toInt() ?? 0) : 0},
                {'domain': '4', 'measure': dataUser?.length == 7 ? (dataUser?[3].toInt() ?? 0) : 0},
                {'domain': '5', 'measure': dataUser?.length == 7 ? (dataUser?[4].toInt() ?? 0) : 0},
                {'domain': '6', 'measure': dataUser?.length == 7 ? (dataUser?[5].toInt() ?? 0) : 0},
                {'domain': '7', 'measure': dataUser?.length == 7 ? (dataUser?[6].toInt() ?? 0) : 0},
                {'domain': 'TT', 'measure': dataUser?.length == 7 ? (dataUser?[7].toInt() ?? 0) : 0},
              ],
            },
            {
              'id': 'Bar 2',
              'data': [
                {'domain': '1', 'measure': dataApp?[0].toInt() ?? 0},
                {'domain': '2', 'measure': dataApp?[1].toInt() ?? 0},
                {'domain': '3', 'measure': dataApp?[2].toInt() ?? 0},
                {'domain': '4', 'measure': dataApp?[3].toInt() ?? 0},
                {'domain': '5', 'measure': dataApp?[4].toInt() ?? 0},
                {'domain': '6', 'measure': dataApp?[5].toInt() ?? 0},
                {'domain': '7', 'measure': dataApp?[6].toInt() ?? 0},
                {'domain': 'TT', 'measure': dataApp?[7].toInt() ?? 0},
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
