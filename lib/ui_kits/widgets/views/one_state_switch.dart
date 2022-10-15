import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles.dart';
import 'fow_radio.dart';

class OneStateSwitch extends StatefulWidget {
  final Map<int, String> data;
  final Map<int, String> images;
  final int selected;
  final ValueChanged<int> onChanged;
  final bool isEnable;

  const OneStateSwitch({Key? key,
    required this.data,
    required this.selected,
    this.images = const {},
    this.isEnable = true,
    required this.onChanged,
  }) : super(key: key);

  @override
  _OneStateSwitchState createState() => _OneStateSwitchState();
}

class _OneStateSwitchState extends State<OneStateSwitch> {
  late int selected;
  late Map<int, String> data;

  @override
  void initState() {
    data = widget.data;
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = data.map(
      (key, value) => MapEntry(
        key,
        InkWell(
          onTap: () {
            setState(() {
              selected = key;
              widget.onChanged(selected);
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IgnorePointer(
                child: FowRadio(
                    isCheck: key == selected,
                    isEnable: widget.isEnable,
                    onCheckChange: () {}),
              ),
              Text(
                value,
                style: textContentStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: widget.isEnable ? Colors.black : Colors.black45),
              ),
              if (widget.images.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SvgPicture.asset(widget.images[key] ?? ''),
                )
            ],
          ),
        ),
      ),
    );

    return Wrap(
      spacing: 16,
      children: widgets.values.toList(),
    );
  }
}
