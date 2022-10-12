import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../colors.dart';

class IdUploadView extends StatefulWidget {
  final String title;
  final ValueNotifier<File?> notifier;

  const IdUploadView({
    required this.notifier,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _IdUploadViewState createState() => _IdUploadViewState();
}

class _IdUploadViewState extends State<IdUploadView> {
  ValueNotifier<File?> notifier = ValueNotifier(null);
  @override
  void initState() {
    notifier = widget.notifier;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPickImageBottomSheet();
      },
      child: Column(
        children: [
          // Text(
          //   widget.title,
          //   style: GoogleFonts.openSans(
          //       fontSize: 15, fontWeight: FontWeight.bold, color: darkBlueColor),
          // ),
          Stack(
            alignment: Alignment.center,
            children: [
              ValueListenableBuilder(
                  valueListenable: notifier,
                  builder: (context, File? file, child) {
                    if (file != null) {
                      return Container(
                        padding:
                        const EdgeInsets.only(top: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: SizedBox(
                              height: 160,
                              child: Image.file(
                                file,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        padding:
                        const EdgeInsets.only(top: 4),
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: const Color(0xfff4f9fe),
                              borderRadius: BorderRadius.circular(16),
                              border: RDottedLineBorder.all(
                                color: blueColor,
                                width: 1,
                                dottedLength: 10,
                                dottedSpace: 4,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/image-bold.svg',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    'Upload Image',
                                    style: GoogleFonts.openSans(
                                      color: blueColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
              Container(
                child: CustomPaint(
                  size: Size(48 + 160 * 1.5, 32 + 160), //2
                  painter: CameraCornerPainter(color: blueColor), //3
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showPickImageBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 128,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.picture_in_picture),
                  title: const Text("Gallery"),
                  onTap: () async {
                    pickImage(ImageSource.gallery);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text("Camera"),
                  onTap: () async {
                    pickImage(ImageSource.camera);
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> pickImage(ImageSource imageSource) async {
    final _picker = ImagePicker();
    Navigator.pop(context);
    final pickedFile = await _picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      notifier.value = File(pickedFile.path);

      String? mimeType = mime(notifier.value!.path);
      if(mimeType == 'image/gif' || mimeType == 'image/webp'){
        // showNotification();
        notifier.value = null;
      }
    } else {
      print('No image selected.');
    }
    setState(() {});
  }
}

class CameraCornerPainter extends CustomPainter {
  CameraCornerPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = color
      ..strokeWidth = 4;
    canvas.drawLine(const Offset(0, 0), const Offset(32, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, 32), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, 32), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - 32, 0), paint);

    canvas.drawLine(Offset(0, size.height), Offset(32, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - 32), paint);

    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - 32), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - 32, size.height), paint);
  }

  @override
  bool shouldRepaint(CameraCornerPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}