// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fow/feature/login/cubit/reset_password_cubit.dart';
// import 'package:fow/injection/injection.dart';
// import 'package:fow/localization/app_localization.dart';
// import 'package:fow/ui_kit/colors.dart';
// import 'package:fow/ui_kit/ui_kit.dart';
// import 'package:fow/ui_kit/widget/view/background_view.dart';
// import 'package:fow/utils/utils.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ResetPasswordPage extends StatefulWidget {
//   final String phone;
//
//   ResetPasswordPage(this.phone);
//   static Route route({required String phone}) {
//     return MaterialPageRoute<void>(builder: (_) => ResetPasswordPage(phone));
//   }
//
//   @override
//   _ResetPasswordPageState createState() => _ResetPasswordPageState();
// }
//
// class _ResetPasswordPageState extends State<ResetPasswordPage> {
//   final passwordController = TextEditingController();
//   final repeatPasswordController = TextEditingController();
//   FocusNode passwordFocusNode = FocusNode();
//   FocusNode repeatPasswordFocusNode = FocusNode();
//   ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
//   ValueNotifier<bool> repeatPasswordNotifier = ValueNotifier(false);
//   ValueNotifier<bool> actionNotifier = ValueNotifier(false);
//   ResetPasswordCubit cubit = getIt<ResetPasswordCubit>();
//   AppLocalizationsData get labels => context.localizations;
//
//   @override
//   void initState() {
//     passwordController.addListener(() {
//       if(passwordController.text==repeatPasswordController.text){
//         repeatPasswordNotifier.value = true;
//       }
//       else if(repeatPasswordController.text.length>0){
//         repeatPasswordNotifier.value = false;
//       }
//       actionNotifier.value =
//           passwordNotifier.value && repeatPasswordNotifier.value;
//     });
//
//     passwordNotifier.addListener(() {
//       actionNotifier.value =
//           passwordNotifier.value && repeatPasswordNotifier.value;
//     });
//     repeatPasswordNotifier.addListener(() {
//       actionNotifier.value =
//           passwordNotifier.value && repeatPasswordNotifier.value;
//     });
//     cubit.stream.listen((state) {
//       if (state is ResetPasswordStateFailed) {
//         // dialogUtil.showToast(state.error);
//       } else if (state is ResetPasswordStateSuccess) {
//         showDialog(
//             context: context,
//             builder: (buildContext) => NotificationDialog(
//               title: labels.resetText06,
//               content: labels.resetText05,
//               onPositiveTap: (){
//                 Navigator.pop(buildContext);
//                 Navigator.pop(buildContext);
//               },
//               onNegativeTap: (){},
//               isShowNegative: false,
//               positive: labels.resetChoose02,
//             )
//         );
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
//               resizeToAvoidBottomInset: false,
//               backgroundColor: Colors.transparent,
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
//                                 Text(
//                                   labels.resetText01.toUpperCase(),
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                       color: darkBlueColor),
//                                 ),
//                                 SizedBox(width: 8),
//                                 SvgPicture.asset(
//                                   'assets/images/synchronize-icon.svg',
//                                   height: 42,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 24),
//                             Text(
//                               labels.resetText02,
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
//                                       PasswordFowTextField(
//                                         validator: validatorPassword,
//                                         focusNode: passwordFocusNode,
//                                         nextFocusNode: repeatPasswordFocusNode,
//                                         controller: passwordController,
//                                         labelText: labels.loginText02,
//                                         validNotifier: passwordNotifier,
//                                         textInputAction: TextInputAction.next,
//                                       ),
//                                       SizedBox(height: 24),
//                                       PasswordFowTextField(
//                                         validator: (String? value) {
//                                           if (passwordController.text ==
//                                                   value &&
//                                               value != null &&
//                                               value.isNotEmpty)
//                                             return null;
//                                           else
//                                             return labels.validateText09;
//                                         },
//                                         validNotifier: repeatPasswordNotifier,
//                                         controller: repeatPasswordController,
//                                         labelText: labels.registerText04,
//                                         textInputAction: TextInputAction.done,
//                                         focusNode: repeatPasswordFocusNode,
//                                         isRepeat: true,
//                                       ),
//                                       SizedBox(
//                                         height: 72,
//                                       ),
//                                       ValueListenableBuilder(
//                                           valueListenable: actionNotifier,
//                                           builder:
//                                               (context, bool value, widget) {
//                                             return makeFowButton(
//                                                 labels.resetChoose01
//                                                     .toUpperCase(),
//                                                 isEnable: value,
//                                                 onTap: _onPressed,
//                                                 height: 60);
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
//
//   String? validatorPassword(String? password) {
//     RegExp regex = RegExp(r'^((?=.*[A-Z])|(?=.*[@$!%*#?&]))[A-Za-z\d@$!%*#?&]{8,20}$');
//     if (password != null && regex.hasMatch(password))
//       return null;
//     else
//       return labels.resetText04;
//   }
//
//   Future<void> _onPressed() async {
//     await dialogUtil.showLoadingPopup(
//         context, cubit.resetPassword(passwordController.text, widget.phone));
//   }
// }
