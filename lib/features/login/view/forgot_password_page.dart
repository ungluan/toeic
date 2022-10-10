// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fow/feature/login/cubit/otp_cubit.dart';
// import 'package:fow/injection/injection.dart';
// import 'package:fow/localization/app_localization.dart';
// import 'package:fow/ui_kit/colors.dart';
// import 'package:fow/ui_kit/ui_kit.dart';
// import 'package:fow/ui_kit/widget/view/background_view.dart';
// import 'package:fow/ui_kit/widget/view/phone_number_fow_textfiled.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../utils/utils.dart';
// import 'opt_page.dart';
//
// class ForgotPasswordPage extends StatefulWidget {
//   static Route route() {
//     return MaterialPageRoute<void>(builder: (_) => ForgotPasswordPage());
//   }
//
//   @override
//   _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
// }
//
// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   final phoneNumberController = TextEditingController();
//   ValueNotifier<bool> phoneNotifier = ValueNotifier(false);
//   OtpCubit otpCubit = getIt<OtpCubit>() ;
//
//   AppLocalizationsData get labels => context.localizations;
//
//   @override
//   void initState() {
//     otpCubit.stream.listen((state) {
//       if (state is OtpStateSendFailed) {
//         if(state.error=="You have reached the limit of receiving OTP codes. Please try again in 30 minutes.") {
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
//         else showDialog(context: context, builder: (context) => NotificationDialog(
//           title: labels.forgotpasswordText03,
//           content: labels.forgotpasswordText04,
//           onPositiveTap: (){
//             Navigator.pop(context);
//           },
//           onNegativeTap: (){},
//           isShowNegative: false,
//           positive: labels.popupErrorText02,
//         ),);
//       } else if (state is OtpStateSendSuccess) {
//         Navigator.pushReplacement(
//             context,
//             OtpPage.route(
//                 isResetPassword: true,
//                 data: {'phone': trimStart(phoneNumberController.text)}));
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
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
//                       GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: SvgPicture.asset(
//                               'assets/images/arrow-left-icon.svg')),
//                       SizedBox(height: 48),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     labels.forgotpasswordText01.toUpperCase(),
//                                     maxLines: 2,
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold,
//                                         color: darkBlueColor),
//                                   ),
//                                 ),
//                                 SizedBox(width: 4),
//                                 SvgPicture.asset(
//                                   'assets/images/forgot-icon.svg',
//                                   height: 40,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 24),
//                             Text(
//                               labels.forgotpasswordText02,
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             SizedBox(height: 24),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(height: 16),
//                                 Form(
//                                   child: Column(
//                                     children: [
//                                       PhoneNumberFowTextField(
//                                         validator: (String? value) {
//                                           final nineNumberPhone =
//                                               trimStart(value);
//                                           if (nineNumberPhone.length == 12 && RegExp(r'^[0-9]*$').hasMatch(value!))
//                                             return null;
//                                           else
//                                             return labels.validateText19;
//                                         },
//                                         textInputAction: TextInputAction.done,
//                                         controller: phoneNumberController,
//                                         labelText: labels.registerText05,
//                                         validNotifier: phoneNotifier,
//                                       ),
//                                       SizedBox(
//                                         height: 160,
//                                       ),
//                                       ValueListenableBuilder(
//                                           valueListenable: phoneNotifier,
//                                           builder:
//                                               (context, bool value, widget) {
//                                             return makeFowButton(
//                                                 labels.forgotpasswordChoose02
//                                                     .toUpperCase(),
//                                                 isEnable: value, onTap: () {
//                                               dialogUtil.showLoadingPopup(
//                                                   context,
//                                                   otpCubit.sendOtp(
//                                                       trimStart(
//                                                           phoneNumberController
//                                                               .text),
//                                                       register: 0));
//                                             }, height: 60);
//                                           }),
//                                       SizedBox(height: 24),
//                                       Image.asset(
//                                         'assets/images/character-vector.png',
//                                       )
//                                     ],
//                                   ),
//                                 ),
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
