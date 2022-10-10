import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';
import 'LogoView.dart';

class SBoxAppBar extends StatefulWidget {
  final VoidCallback? onFirstPressed;
  final VoidCallback? onSecondPressed;
  final String? firstImageAsset;
  final String? secondImageAsset;
  final bool firstHide;
  final bool secondHide;
  final Color firstColor;
  final String title;

  const SBoxAppBar(
      {this.onFirstPressed,
        this.onSecondPressed,
        this.firstImageAsset,
        this.secondImageAsset,
        this.firstHide = false,
        this.secondHide = false,
        this.firstColor = FowColors.blueColor,
        this.title = '',
        Key? key})
      : super(key: key);

  @override
  _SBoxAppBarState createState() => _SBoxAppBarState();
}

class _SBoxAppBarState extends State<SBoxAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 12,
            ),
            Opacity(
              opacity: widget.firstHide ? 0 : 1,
              child: InkWell(
                onTap: widget.firstHide ? null : widget.onFirstPressed,
                child: Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: widget.firstImageAsset != null
                        ? SvgPicture.asset(
                      widget.firstImageAsset!,
                      color: widget.firstColor,
                      fit: BoxFit.contain,
                    )
                        : Container()),
              ),
            ),
            Expanded(
                child: widget.title.isEmpty
                    ? const LogoView()
                    : Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )),
            Opacity(
              opacity: widget.secondHide ? 0 : 1,
              child: InkWell(
                onTap: widget.secondHide ? null : widget.onSecondPressed,
                child: Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: widget.secondImageAsset != null
                        ? SvgPicture.asset(
                      widget.secondImageAsset!,
                      fit: BoxFit.contain,
                    )
                        : Container()),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ));
  }
}
