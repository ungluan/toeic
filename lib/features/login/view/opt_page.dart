// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_countdown_timer/countdown.dart';
// import 'package:flutter_countdown_timer/countdown_controller.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fow/feature/login/cubit/authentication_cubit.dart';
// import 'package:fow/feature/login/cubit/otp_cubit.dart';
// import 'package:fow/feature/login/view/reset_password_page.dart';
// import 'package:fow/injection/injection.dart';
// import 'package:fow/localization/app_localization.dart';
// import 'package:fow/ui_kit/colors.dart';
// import 'package:fow/ui_kit/ui_kit.dart';
// import 'package:fow/ui_kit/widget/view/background_view.dart';
// import 'package:fow/utils/utils.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class OtpPage extends StatefulWidget {
//   final bool isResetPassword;
//   final bool isEditProfile;
//   final bool second;
//   final Map<String, dynamic> data;
//
//   OtpPage(
//       {this.isResetPassword = false,
//       required this.data,
//       this.second = false,
//       this.isEditProfile = false});
//
//   static Route route(
//       {bool isResetPassword = false,
//       required Map<String, dynamic> data,
//       bool isEditProfile = false}) {
//     return MaterialPageRoute<void>(
//       builder: (_) => OtpPage(
//         isResetPassword: isResetPassword,
//         data: data,
//         isEditProfile: isEditProfile,
//       ),
//     );
//   }
//
//   @override
//   _OtpPageState createState() => _OtpPageState();
// }
//
// class _OtpPageState extends State<OtpPage> {
//   String phoneNumber = '';
//   bool isFillOtp = false;
//   bool isVerifyFailed = true;
//   TextEditingController _otpController = TextEditingController();
//   late CountdownController countdownController;
//   OtpCubit otpCubit = getIt<OtpCubit>();
//   AuthenticationCubit get cubit => context.read();
//   FocusNode pinCodeFocusNode = FocusNode();
//   late bool isTimeOut = false;
//   final int timeOut = 120;
//   AppLocalizationsData get labels => context.localizations;
//   int counter = 0;
//
//   @override
//   void initState() {
//     countdownController = CountdownController(
//         duration: Duration(seconds: timeOut),
//         onEnd: () {
//           setState(() {
//             isTimeOut = true;
//             isVerifyFailed = true;
//             _otpController.clear();
//           });
//         });
//     phoneNumber = widget.data['phone'];
//     countdownController.start();
//     otpCubit.stream.listen((state) async {
//       if (state is OtpStateSendFailed) {
//         isTimeOut = true;
//         // dialogUtil.showToast(state.error);
//         if (state.error ==
//             "You have reached the limit of receiving OTP codes. Please try again in 30 minutes.") {
//           showDialog(context: context, builder: (context) =>
//               NotificationDialog(
//                 title: labels.oTPFailedTitle,
//                 content: labels.oTPFailedText,
//                 onPositiveTap: () {
//                   Navigator.pop(context);
//                 },
//                 onNegativeTap: () {},
//                 isShowNegative: false,
//                 positive: labels.oTPChoose03,
//               ));
//         }
//       }
//       else if (state is OtpStateSendSuccess) {
//         setState(() {
//           isTimeOut = false;
//           countdownController.value = Duration(seconds: timeOut).inMilliseconds;
//           countdownController.start();
//         });
//       }
//       else if (state is OtpStateVerifyFailed) {
//         // dialogUtil.showToast(state.error);
//         setState(() {
//           isVerifyFailed = false;
//         });
//       }
//       else if (state is OtpStateVerifySuccess) {
//         if (widget.second) {
//           // dialogUtil.showToast('Verify Success');
//           await cubit.saveToken();
//           cubit.dispatch();
//         } else if (widget.isResetPassword) {
//           Navigator.pushReplacement(
//               context, ResetPasswordPage.route(phone: phoneNumber));
//         } else {
//           if (!widget.isEditProfile)
//             dialogUtil.showLoadingPopup(
//                 context, otpCubit.register(widget.data));
//           else
//             Navigator.pop(context, true);
//         }
//       } else if (state is OtpStateRegisterSuccess) {
//         // Comment popup
//         // dialogUtil.showToast(labels.oTPText08);
//         Navigator.pop(context);
//       }
//       else if (state is OtpStateRegisterFailed) {
//         // dialogUtil.showToast(state.error);
//       }
//       else if (state is OtpStateCheckUserFailed) {
//         if(widget.isEditProfile){
//           Navigator.pop(context);
//         }
//         showDialog(
//           context: context,
//           builder: (context) => NotificationDialog(
//             title: labels.registerText08,
//             content: convertMes(state.message),
//             onPositiveTap: () {
//               Navigator.pop(context);
//             },
//             onNegativeTap: () {},
//             isShowNegative: false,
//             positive: labels.popupErrorText02,
//           ),
//         );
//       }
//     });
//     super.initState();
//   }
//
//   String convertMes(String message){
//     if(message=="A registered user with this phone number already exists. Please use another phone number.")
//       return labels.popupErrorTextPhone;
//     else if(message=="A registered user with this email already exists. Please use another email.")
//       return labels.popupErrorTextEmail;
//     else if(message=="A registered user with this username already exists. Please use another username.")
//       return labels.popupErrorTextUsername;
//     else return message;
//   }
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     print(width);
//     return Stack(
//       children: [
//         BackgroundView(),
//         GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: SafeArea(
//             child: Scaffold(
//               backgroundColor: Colors.transparent,
//               resizeToAvoidBottomInset: false,
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 32),
//                       if (!widget.second)
//                         GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context, false);
//                             },
//                             child: SvgPicture.asset(
//                                 'assets/images/arrow-left-icon.svg')),
//                       SizedBox(height: 48),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   '${labels.oTPText01} ',
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                       color: darkBlueColor),
//                                 ),
//                                 SizedBox(width: 8),
//                                 SvgPicture.asset(
//                                   'assets/images/business-and-finance-icon.svg',
//                                   height: 42,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 24),
//                             Text(labels.oTPText02,
//                                 style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w500,
//                                 )),
//                             SizedBox(height: 2),
//                             Text(
//                               phoneNumber,
//                               style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   color: blueColor,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 12),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 !isVerifyFailed
//                                     ? Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.clear,
//                                             color: darkRedColor,
//                                           ),
//                                           Text(
//                                             labels.oTPText07,
//                                             style: GoogleFonts.poppins(
//                                                 color: darkRedColor,
//                                                 fontWeight: FontWeight.w700),
//                                           )
//                                         ],
//                                       )
//                                     : SizedBox(
//                                         height: 24,
//                                       ),
//                                 SizedBox(height: 12),
//                                 Countdown(
//                                   countdownController: countdownController,
//                                   builder: (_, Duration time) {
//                                     if (time.inSeconds == 0) {
//                                       return Text(
//                                         labels.oTPText06,
//                                         style: GoogleFonts.poppins(
//                                             color: darkRedColor,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600),
//                                       );
//                                     }
//                                     return Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           '${labels.oTPText03}  ',
//                                           style: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                         Container(
//                                           child: Text(
//                                             '${digitFormat(time.inMinutes % 60)}:${digitFormat(time.inSeconds % 60)}',
//                                             style: GoogleFonts.poppins(
//                                                 color: darkRedColor,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.w600),
//                                             textAlign: TextAlign.left,
//                                           ),
//                                           width: 56,
//                                         )
//                                       ],
//                                     );
//                                   },
//                                 ),
//                                 SizedBox(height: 16),
//                                 PinCodeTextField(
//                                   appContext: context,
//                                   focusNode: pinCodeFocusNode,
//                                   length: 5,
//                                   controller: _otpController,
//                                   animationType: AnimationType.none,
//                                   onChanged: (value) {
//                                     if (value.length == 5) {
//                                       FocusScope.of(context).unfocus();
//                                       setState(() {
//                                         isFillOtp = true;
//                                       });
//                                     } else {
//                                       setState(() {
//                                         isFillOtp = false;
//                                         isVerifyFailed = true;
//                                       });
//                                     }
//                                   },
//                                   keyboardType: TextInputType.number,
//                                   pinTheme: PinTheme(
//                                     selectedColor: isVerifyFailed
//                                         ? Color(0xFF00B0FF)
//                                         : Color(0xFFFF1010),
//                                     selectedFillColor: Colors.white,
//                                     activeColor: isVerifyFailed
//                                         ? Color(0xFF00B0FF)
//                                         : Color(0xFFFF1010),
//                                     inactiveColor: Colors.white,
//                                     activeFillColor: isVerifyFailed
//                                         ? Colors.white
//                                         : Color(0xFFFFEAEA),
//                                     inactiveFillColor: Colors.white,
//                                     fieldHeight: width > 392 ? 70 : 60 ,
//                                     fieldWidth: width > 392 ? 60 : 55,
//                                     borderWidth: 1,
//                                     borderRadius: BorderRadius.circular(14),
//                                     shape: PinCodeFieldShape.box,
//                                   ),
//
//                                   enableActiveFill: true,
//                                   enablePinAutofill: true,
//                                   showCursor: false,
//                                 ),
//                                 SizedBox(height: 32),
//                                 Text(
//                                   labels.oTPText04,
//                                   style: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 SizedBox(height: 4),
//                                 TextButton(
//                                     onPressed: !isTimeOut
//                                         ? null
//                                         : () async {
//                                             await dialogUtil.showLoadingPopup(
//                                                 context,
//                                                 otpCubit.sendOtp(phoneNumber,register: widget.isResetPassword ? 0 : 1));
//                                           },
//                                     child: Text(
//                                       labels.oTPText05,
//                                       style: GoogleFonts.poppins(
//                                           color: isTimeOut
//                                               ? orangeColor
//                                               : Colors.grey,
//                                           fontWeight: FontWeight.w700),
//                                     )),
//                                 SizedBox(height: 32),
//                                 makeFowButton(
//                                     isVerifyFailed
//                                         ? labels.oTPChoose01.toUpperCase()
//                                         : labels.oTPChoose02.toUpperCase(),
//                                     isEnable: isFillOtp && !isTimeOut,
//                                     onTap: !(isFillOtp && !isTimeOut)
//                                         ? null
//                                         : () async {
//                                             if (!isVerifyFailed) {
//                                               setState(() {
//                                                 _otpController.clear();
//                                                 isVerifyFailed = true;
//                                                 pinCodeFocusNode.requestFocus();
//                                               });
//                                             } else {
//                                               await dialogUtil.showLoadingPopup(
//                                                 context,
//                                                 otpCubit.verifyOtp(
//                                                     _otpController.text,
//                                                     phoneNumber),
//                                               );
//                                             }
//                                           },
//                                     height: 60),
//                                 SizedBox(height: 24),
//                                 Image.asset(
//                                   'assets/images/character-vector.png',
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
