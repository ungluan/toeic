import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../styles.dart';
import 'fow_radio.dart';

enum KindDisplay {
  ABCD,
  BOTH
}

class OneChoice extends StatefulWidget {
  const OneChoice({
    Key? key,
    required this.data,
    required this.onChanged,
    this.selected = '',
    this.isEnable = true,
    required this.questionNumber,
    required this.questionContent,
    required this.kind,
    required this.explain,
    this.answer,
  }) : super(key: key);
  final int questionNumber;
  final String questionContent;
  final Map<String, String> data;
  final ValueChanged<String> onChanged;
  final String selected;
  final bool isEnable;
  final KindDisplay kind;
  final String explain;
  final String? answer;
  @override
  State<OneChoice> createState() => _OneChoiceState();
}

class _OneChoiceState extends State<OneChoice> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    final widgets = widget.data.map(
      (key, value) => MapEntry(
        key,
        InkWell(
          onTap: () {
            if(widget.isEnable){
              setState(() {
                selected = key;
                widget.onChanged(selected);
              });
            }
          },
          child: Container(
            color: (!widget.isEnable && widget.answer == key)  ? lightBlueColor :
            (!widget.isEnable && widget.selected == key) ? null : null,
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IgnorePointer(
                    child: FowRadio(
                      isCheck: key == selected,
                      isEnable: widget.isEnable,
                      onCheckChange: () {},
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.kind == KindDisplay.ABCD ? "(${value.toUpperCase()})" : "(${key.toUpperCase()}) $value" ,
                      style: textContentStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: widget.isEnable ? Colors.black : Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 12),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: lightBlueColor,
          ),
          child: RichText(
            text: TextSpan(
              text: '${widget.questionNumber}. ',
              style: questionStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: darkBlueColor,
              ),
              children: [
                TextSpan(
                  text: widget.questionContent,
                  style: questionStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        ...widgets.values.toList(),
        !widget.isEnable ?
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: RichText(
              text: TextSpan(
                text: widget.explain.isNotEmpty ? 'Giải thích:\n' : '',
                style: questionStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: darkBlueColor,
                ),
                children: [
                  TextSpan(
                    text: widget.explain,
                    style: questionStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ) : const SizedBox()
      ],
    );
  }
}

// class OneChoice extends StatefulWidget {
//   final Map<int, String> data;
//   final Map<int, String> images;
//   final int selected;
//   final ValueChanged<int> onChanged;
//   final bool isEnable;
//
//   const OneStateSwitch({
//     required this.data,
//     required this.selected,
//     this.images = const {},
//     this.isEnable = true,
//     required this.onChanged,
//   });
//
//   @override
//   _OneStateSwitchState createState() => _OneStateSwitchState();
// }
//
// class _OneStateSwitchState extends State<OneStateSwitch> {
//   late int selected;
//   late Map<int, String> data;
//
//   @override
//   void initState() {
//     data = widget.data;
//     selected = widget.selected;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final widgets = data.map(
//           (key, value) =>
//           MapEntry(
//             key,
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   selected = key;
//                   widget.onChanged(selected);
//                 });
//               },
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IgnorePointer(
//                     child: FowRadio(
//                         isCheck: key == selected,
//                         isEnable: widget.isEnable,
//                         onCheckChange: () {}),
//                   ),
//                   Text(
//                     value,
//                     style: textContentStyle.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: widget.isEnable ? Colors.black : Colors.black45),
//                   ),
//                   if (widget.images.length > 0)
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: SvgPicture.asset(widget.images[key] ?? ''),
//                     )
//                 ],
//               ),
//             ),
//           ),
//     );
//
//     return Container(
//       child: Wrap(
//         spacing: 16,
//         children: widgets.values.toList(),
//       ),
//     );
//   }
// }
