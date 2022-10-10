import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_button.dart';

import '../../colors.dart';

class NotificationDialog extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onPositiveTap;
  final VoidCallback onNegativeTap;
  final String? positive;
  final String? negative;
  final bool? isShowNegative;

  const NotificationDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onPositiveTap,
    required this.onNegativeTap,
    this.positive,
    this.negative,
    this.isShowNegative = true,
  }) : super(key: key);

  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          color: orangeColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: RichText(
                    text: TextSpan(
                      text: widget.content,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.isShowNegative == true)
                        Expanded(
                          child: makeSBoxButton(widget.negative!.toUpperCase(),
                              onTap: widget.onNegativeTap),
                        ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: makeSBoxButton(widget.positive!.toUpperCase(),
                            onTap: widget.onPositiveTap),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
