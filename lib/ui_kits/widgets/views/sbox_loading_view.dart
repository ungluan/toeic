import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SBoxLoadingView extends StatefulWidget {
  final double ratio;
  const SBoxLoadingView({this.ratio = 2.0 / 3.0, Key? key}) : super(key: key);

  @override
  _SBoxLoadingViewState createState() => _SBoxLoadingViewState();
}

class _SBoxLoadingViewState extends State<SBoxLoadingView> {

  @override
  Widget build(BuildContext context) {
    return buildLoading("Đang tải...");
  }

  Widget buildLoading(String loading) {
    Widget child = Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 115,
      height: 115,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: const LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        backgroundColor: Colors.transparent,
        colors: [
          Colors.blue,
          Colors.green,
          Colors.greenAccent,
          Colors.yellow,
          Colors.orange,
          Colors.red,
          Colors.pink,
          Colors.purple,
          Colors.indigo
        ],
      ),
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.ratio,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [child],
        ),
      ),
    );
  }
}
