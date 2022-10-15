import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FowRadio extends StatefulWidget {
  final bool isCheck;
  final VoidCallback onCheckChange;
  final bool isEnable;
  const FowRadio({required this.isCheck, required this.onCheckChange, this.isEnable=true, Key? key})
      : super(key: key);

  @override
  _FowRadioState createState() => _FowRadioState();
}

class _FowRadioState extends State<FowRadio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: !widget.isEnable ? SvgPicture.asset('assets/images/radio_blur.svg') :
        widget.isCheck
            ? SvgPicture.asset('assets/images/icon.svg')
            : SvgPicture.asset('assets/images/icon-uncheck.svg'),
        onPressed: () {
          setState(() {
            widget.onCheckChange();
          });
        });
  }
}
