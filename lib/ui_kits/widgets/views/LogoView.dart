import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoView extends StatefulWidget {
  const LogoView({Key? key}) : super(key: key);

  @override
  _LogoViewState createState() => _LogoViewState();
}

class _LogoViewState extends State<LogoView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      width: 112,
      child: SvgPicture.asset(
        'assets/images/ptit.svg',
      ),
    );
  }
}
