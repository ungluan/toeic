import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class PhoneNumberTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final ValueNotifier<bool>? validNotifier;
  final bool validateModeAlways;

  const PhoneNumberTextField({
    Key? key,
    this.focusNode,
    this.nextFocusNode,
    this.labelText,
    this.validator,
    this.validNotifier,
    this.controller,
    this.textInputType = TextInputType.number,
    this.textInputAction = TextInputAction.next,
    this.validateModeAlways = false,
  }) : super(key: key);

  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      if (widget.validator != null) {
        setState(() {
          isValid =
              !(widget.validator!(widget.controller?.text)?.isNotEmpty == true);
          if (widget.validNotifier != null) {
            widget.validNotifier!.value = isValid;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (v) {
        widget.focusNode?.unfocus();
        widget.nextFocusNode?.requestFocus();
      },
      validator: widget.validator,
      autovalidateMode: widget.validateModeAlways
          ? AutovalidateMode.always
          : AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.labelText,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 16),
            Text(
              '+84',
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: blueColor,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              height: 32,
              width: 1,
              color: lightTextColor,
            ),
            const SizedBox(width: 16),
          ],
        ),
        suffixIcon: isValid
            ? Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.check,
                  color: orangeColor,
                ),
              )
            : const SizedBox(),
        hintStyle: GoogleFonts.openSans(fontSize: 15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: blueColor, width: 2)),
        contentPadding: const EdgeInsets.only(top: 16, bottom: 16, left: 24),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: lightPurpleColor, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: lightPurpleColor, width: 2)),
        errorMaxLines: 3,
      ),
    );
  }
}
