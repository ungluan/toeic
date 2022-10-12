import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class SBoxTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final int maxLines;
  final ValueNotifier<bool>? validNotifier;
  final int? maxLength;
  final ValueNotifier<String>? stringNotifier;
  final bool isEnable;
  final bool isBlueColor;

  const SBoxTextField({
    Key? key,
    this.focusNode,
    this.nextFocusNode,
    this.labelText,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.validNotifier,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.stringNotifier,
    this.isEnable = true,
    this.isBlueColor = false,
  }) : super(key: key);

  @override
  _SBoxTextFieldState createState() => _SBoxTextFieldState();
}

class _SBoxTextFieldState extends State<SBoxTextField> {
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      if (widget.validator != null && mounted) {
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
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (v) {
        widget.focusNode?.unfocus();
        widget.nextFocusNode?.requestFocus();
      },
      onChanged: (value) {
        if (widget.stringNotifier != null) widget.stringNotifier!.value = value;
      },
      style:
          GoogleFonts.poppins(color: widget.isEnable ? null : Colors.black38),
      maxLength: widget.maxLength,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.disabled,
      enabled: widget.isEnable,
      decoration: InputDecoration(
        hintText: widget.labelText,
        fillColor: Colors.white,
        filled: true,
        counterText: "",
        suffixIcon: (isValid && widget.isEnable)
            ? Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.check,
                  color: orangeColor,
                ),
              )
            : const SizedBox(),
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: blueColor, width: 2)),
        contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: lightPurpleColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: widget.isBlueColor ? blueColor : lightPurpleColor,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: blueColor.withOpacity(0.4), width: 1),
        ),
        errorMaxLines: 3,
      ),
    );
  }
}

class SBoxTextField2 extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final int maxLines;
  final ValueNotifier<bool>? validNotifier;
  final int? maxLength;
  final ValueNotifier<String>? stringNotifier;
  final bool isEnable;
  final bool isBlueColor;
  final bool isChecked;
  final bool initShowCheckBox;

  SBoxTextField2({
    this.focusNode,
    this.nextFocusNode,
    this.labelText,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.validNotifier,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.stringNotifier,
    this.isEnable = true,
    this.isBlueColor = false,
    this.isChecked = true,
    this.initShowCheckBox = true
  });

  @override
  _SBoxTextField2State createState() => _SBoxTextField2State();
}

class _SBoxTextField2State extends State<SBoxTextField2> {
  late bool isValid = widget.initShowCheckBox;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      if (widget.validator != null && mounted) {
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
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (v) {
        widget.focusNode?.unfocus();
        widget.nextFocusNode?.requestFocus();
      },
      onChanged: (value) {
        if (widget.stringNotifier != null) widget.stringNotifier!.value = value;
      },
      style:
          GoogleFonts.poppins(color: widget.isEnable ? null : Colors.black38),
      maxLength: widget.maxLength,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.isEnable,
      decoration: InputDecoration(
        hintText: widget.labelText,
        fillColor: Colors.white,
        filled: true,
        counterText: "",
        suffixIcon: ( isValid && widget.isEnable)
            ? Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.check,
                  color: orangeColor,
                ),
              )
            : const SizedBox(),
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: blueColor, width: 2)),
        contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 24),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: lightPurpleColor, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: widget.isBlueColor ? blueColor : lightPurpleColor,
                width: 2)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: blueColor.withOpacity(0.4), width: 1),
        ),
        errorMaxLines: 3,
      ),
    );
  }
}
