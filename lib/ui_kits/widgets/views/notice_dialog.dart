import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_button.dart';

import '../../colors.dart';

class NoticeDialog extends StatefulWidget {
  final String price;
  final VoidCallback onPositiveTap;
  final String positive;

  const NoticeDialog({
    Key? key,
    required this.price,
    required this.onPositiveTap,
    required this.positive,
  }) : super(key: key);

  @override
  _NoticeDialogState createState() => _NoticeDialogState();
}

class _NoticeDialogState extends State<NoticeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
          height: 472,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Chú ý',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:
                          'Bạn vui lòng nộp tiền qua tài khoản học viện, sau khi nộp đơn.',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Tên tài khoản: ',
                        style: GoogleFonts.poppins(
                          color: darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Học viện Công nghệ Bưu chính Viễn Thông Cơ sở tại TPHCM',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Tên tài khoản: ',
                        style: GoogleFonts.poppins(
                          color: darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Học viện Công nghệ Bưu chính Viễn Thông Cơ sở tại TPHCM',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                  ),
                  Row(
                    children: [
                      Text(
                        'Số tài khoản:  ',
                        style: GoogleFonts.poppins(
                          color: darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: lightBlueColor),
                        padding: const EdgeInsets.all(2),
                        child: const SelectableText(
                          '1904201065266',
                        ),
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Ngân hàng: ',
                        style: GoogleFonts.poppins(
                          color: darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Agribank chi nhánh Miền Đông',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Nội dung chuyển tiền: ',
                        style: GoogleFonts.poppins(
                          color: darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Mã sinh viên_Họ và tên sinh viên_Nội dung nộp tiền',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Mức phí: ',
                        style: GoogleFonts.poppins(
                          color: darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '${widget.price} vnđ',
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Thời gian xử lý: ',
                        style: GoogleFonts.poppins(
                          color: darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                            '3-4 ',
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                            'ngày',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                  ),

                ],
              ),
              const SizedBox(height: 24),
              makeSBoxButton(widget.positive.toUpperCase(),
                  onTap: widget.onPositiveTap),
            ],
          ),
      ),
    );
  }
}