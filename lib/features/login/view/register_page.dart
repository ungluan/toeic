// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fow/feature/login/cubit/otp_cubit.dart';
// import 'package:fow/feature/login/cubit/term_cubit.dart';
// import 'package:fow/feature/login/view/opt_page.dart';
// import 'package:fow/feature/login/view/terms_page.dart';
// import 'package:fow/injection/injection.dart';
// import 'package:fow/localization/app_localization.dart';
// import 'package:fow/ui_kit/colors.dart';
// import 'package:fow/ui_kit/ui_kit.dart';
// import 'package:fow/ui_kit/widget/view/background_view.dart';
// import 'package:fow/ui_kit/widget/view/fow_app_bar.dart';
// import 'package:fow/ui_kit/widget/view/fow_button.dart';
// import 'package:fow/ui_kit/widget/view/fow_checkbox.dart';
// import 'package:fow/ui_kit/widget/view/fow_textfield.dart';
// import 'package:fow/ui_kit/widget/view/password_fow_textfield.dart';
// import 'package:fow/ui_kit/widget/view/phone_number_text_field.dart';
// import 'package:fow/utils/utils.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class RegisterPage extends StatefulWidget {
//   RegisterPage();
//   static Route route() {
//     return MaterialPageRoute<void>(builder: (_) => RegisterPage());
//   }
//
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   final userController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final repeatPasswordController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//
//   final ValueNotifier<bool> userNotifier = ValueNotifier(false);
//   final ValueNotifier<bool> emailNotifier = ValueNotifier(false);
//   final ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
//   final ValueNotifier<bool> repeatPasswordNotifier = ValueNotifier(false);
//   final ValueNotifier<bool> phoneNotifier = ValueNotifier(false);
//   final ValueNotifier<bool> checkNotifier = ValueNotifier(false);
//   final ValueNotifier<bool> checkErrorNotifier = ValueNotifier(false);
//   final ValueNotifier<bool> createAccountNotifier = ValueNotifier(false);
//
//   FocusNode userFocusNode = FocusNode();
//   FocusNode phoneFocusNode = FocusNode();
//   FocusNode passwordFocusNode = FocusNode();
//   FocusNode repeatPasswordFocusNode = FocusNode();
//   FocusNode emailFocusNode = FocusNode();
//   OtpCubit otpCubit = getIt<OtpCubit>();
//   TermCubit termCubit = getIt<TermCubit>();
//   AppLocalizationsData get labels => context.localizations;
//   // String content = '';
//   void mock() {
//     String number = '${getDigitNumber(3)}';
//     userController.text = 'dev$number';
//     emailController.text = 'dev$number@gmail.com';
//     phoneNumberController.text = getDigitNumber(9);
//     passwordController.text = '12345678';
//     repeatPasswordController.text = '12345678';
//     userNotifier.value = true;
//     emailNotifier.value = true;
//     passwordNotifier.value = true;
//     repeatPasswordNotifier.value = true;
//     phoneNotifier.value = true;
//   }
//
//   @override
//   void initState() {
//     userNotifier.addListener(() {
//       final status = isValid();
//       createAccountNotifier.value = status;
//     });
//     passwordNotifier.addListener(() {
//       final text = repeatPasswordController.text;
//       repeatPasswordController.text = '';
//       repeatPasswordController.text = text;
//       final status = isValid();
//       createAccountNotifier.value = status;
//     });
//     repeatPasswordNotifier.addListener(() {
//       final status = isValid();
//       createAccountNotifier.value = status;
//     });
//     emailNotifier.addListener(() {
//       final status = isValid();
//       createAccountNotifier.value = status;
//     });
//     phoneNotifier.addListener(() {
//       final status = isValid();
//       createAccountNotifier.value = status;
//     });
//     checkNotifier.addListener(() {
//       final status = isValid();
//       createAccountNotifier.value = status;
//     });
//     otpCubit.stream.listen((state) {
//       if (state is OtpStateSendFailed) {
//         final status = isValid();
//         if (state.error ==
//             "You have reached the limit of receiving OTP codes. Please try again in 30 minutes.") {
//           showDialog(
//               context: context,
//               builder: (context) => NotificationDialog(
//                     title: labels.oTPFailedTitle,
//                     content: labels.oTPFailedText,
//                     onPositiveTap: () {
//                       Navigator.pop(context);
//                     },
//                     onNegativeTap: () {},
//                     isShowNegative: false,
//                     positive: labels.oTPChoose03,
//                   ));
//         }
//         createAccountNotifier.value = status;
//       } else if (state is OtpStateSendSuccess) {
//         String username = userController.text;
//         String email = emailController.text;
//         String phone = trimStart(phoneNumberController.text);
//         String password = passwordController.text;
//         final data = {
//           'username': username,
//           'email': email,
//           'phone': phone,
//           'password': password,
//           'agree': true,
//         };
//         Navigator.pushReplacement(context, OtpPage.route(data: data));
//       } else if (state is OtpStateCheckUserFailed) {
//         showDialog(
//             context: context,
//             builder: (context) => NotificationDialog(
//                   title: labels.popupErrorText05,
//                   content: convertMes(state.message),
//                   onPositiveTap: () {
//                     Navigator.pop(context);
//                   },
//                   onNegativeTap: () {},
//                   isShowNegative: false,
//                   positive: labels.popupErrorText02,
//                 ));
//       }
//     });
//     passwordController.addListener(() {
//       print(passwordController.text);
//       if (passwordController.text == repeatPasswordController.text) {
//         repeatPasswordNotifier.value = true;
//       } else if (repeatPasswordController.text.length > 0) {
//         repeatPasswordNotifier.value = false;
//       }
//     });
//     super.initState();
//   }
//
//   bool isValid() {
//     return userNotifier.value &&
//         emailNotifier.value &&
//         phoneNotifier.value &&
//         passwordNotifier.value &&
//         repeatPasswordNotifier.value &&
//         checkNotifier.value;
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   // TODO: implement didChangeDependencies
//   //   super.didChangeDependencies();
//   //   otpCubit.stream.listen((state) {
//   //     if ( state is OtpStateCheckUserFailed){
//   //       showDialog(context: context, builder: (context) => NotificationDialog(
//   //         title: labels.popupErrorText05,
//   //         content: convertMes(state.message),
//   //         onPositiveTap: (){
//   //           Navigator.pop(context);
//   //         },
//   //         onNegativeTap: (){},
//   //         isShowNegative: false,
//   //         positive: labels.popupErrorText02,
//   //       ),
//   //       );
//   //     }
//   //   });
//   // }
//
//   String convertMes(String message) {
//     if (message ==
//         "A registered user with this phone number already exists. Please use another phone number.")
//       return labels.popupErrorTextPhone;
//     else if (message ==
//         "A registered user with this email already exists. Please use another email.")
//       return labels.popupErrorTextEmail;
//     else if (message ==
//         "A registered user with this username already exists. Please use another username.")
//       return labels.popupErrorTextUsername;
//     else
//       return message;
//   }
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Stack(
//           children: [
//             BackgroundView(),
//             SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.only(right: 24),
//                 child: Column(
//                   children: [
//                     FowAppBar(
//                       onFirstPressed: () {
//                         Navigator.pop(context);
//                       },
//                       onSecondPressed: () {},
//                       firstColor: orangeColor,
//                       firstImageAsset: 'assets/images/arrow-left-icon.svg',
//                       secondImageAsset: '',
//                       secondeHide: true,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 24),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             SizedBox(height: 16),
//                             FowTextField(
//                               validator: validatorUsername,
//                               controller: userController,
//                               validNotifier: userNotifier,
//                               labelText: labels.registerText01,
//                               focusNode: userFocusNode,
//                               nextFocusNode: emailFocusNode,
//                             ),
//                             SizedBox(height: 24),
//                             FowTextField(
//                               validator: validatorEmail,
//                               validNotifier: emailNotifier,
//                               controller: emailController,
//                               labelText: labels.registerText02,
//                               focusNode: emailFocusNode,
//                               nextFocusNode: passwordFocusNode,
//                             ),
//                             SizedBox(height: 24),
//                             PasswordFowTextField(
//                               validator: validatorPassword,
//                               validNotifier: passwordNotifier,
//                               controller: passwordController,
//                               labelText: labels.registerText03,
//                               textInputAction: TextInputAction.next,
//                               focusNode: passwordFocusNode,
//                               nextFocusNode: repeatPasswordFocusNode,
//                             ),
//                             SizedBox(height: 24),
//                             ValueListenableBuilder<bool>(
//                               valueListenable: repeatPasswordNotifier,
//                               builder: (context, value, _) =>
//                                   PasswordFowTextField(
//                                 validator: (String? value) {
//                                   if (passwordController.text == value &&
//                                       value != null)
//                                     return null;
//                                   else
//                                     return labels.validateText09;
//                                 },
//                                 validNotifier: repeatPasswordNotifier,
//                                 controller: repeatPasswordController,
//                                 labelText: labels.registerText04,
//                                 textInputAction: TextInputAction.next,
//                                 focusNode: repeatPasswordFocusNode,
//                                 nextFocusNode: phoneFocusNode,
//                                 isRepeat: true,
//                               ),
//                             ),
//                             SizedBox(height: 24),
//                             PhoneNumberFowTextField(
//                               validator: (String? value) {
//                                 final nineNumberPhone = trimStart(value);
//                                 if (nineNumberPhone.length == 12 &&
//                                     RegExp(r'^[0-9]*$').hasMatch(value!))
//                                   return null;
//                                 else
//                                   return labels.validateText02;
//                               },
//                               controller: phoneNumberController,
//                               labelText: labels.registerText05,
//                               validNotifier: phoneNotifier,
//                               focusNode: phoneFocusNode,
//                               textInputAction: TextInputAction.done,
//                             ),
//                             SizedBox(height: 12),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   ValueListenableBuilder(
//                                     builder: (BuildContext context, bool value,
//                                         Widget? child) {
//                                       return FowCheckbox(
//                                           valueChanged: (v) {
//                                             checkErrorNotifier.value = false;
//                                           },
//                                           isCheck: value,
//                                           checkNotifier: checkNotifier);
//                                     },
//                                     valueListenable: checkNotifier,
//                                   ),
//                                   Text(
//                                     '${labels.registerText06} ',
//                                     style: GoogleFonts.poppins(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       child: GestureDetector(
//                                         onTap: () async {
//                                           final content =
//                                               await dialogUtil.showLoadingPopup(
//                                                   context, termCubit.getData());
//                                           final isCheck = await Navigator.push(
//                                               context,
//                                               TermsPage.route(content));
//                                           if (isCheck != null)
//                                             checkNotifier.value = isCheck;
//                                         },
//                                         child: Text(
//                                           labels.registerChoose01,
//                                           overflow: TextOverflow.clip,
//                                           softWrap: false,
//                                           style: GoogleFonts.poppins(
//                                               decoration:
//                                                   TextDecoration.underline,
//                                               color: blueColor,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             ValueListenableBuilder(
//                                 valueListenable: checkErrorNotifier,
//                                 builder: (context, bool value, widget) {
//                                   return value
//                                       ? Container(
//                                           child: Row(
//                                             children: [
//                                               SizedBox(
//                                                 width: 24,
//                                               ),
//                                               Expanded(
//                                                 child: Text(
//                                                   labels.registerText09,
//                                                   textAlign: TextAlign.left,
//                                                   style: TextStyle(
//                                                       color: Theme.of(context)
//                                                           .errorColor,
//                                                       fontSize: 12),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       : SizedBox();
//                                 }),
//                             SizedBox(height: 24),
//                             Column(
//                               children: [
//                                 ValueListenableBuilder(
//                                     valueListenable: createAccountNotifier,
//                                     builder: (context, bool value, widget) {
//                                       return makeFowButton(
//                                           labels.registerChoose02.toUpperCase(),
//                                           onTap: _onPressed,
//                                           height: 60,
//                                           isEnable: true);
//                                     }),
//                                 SizedBox(
//                                   height: 16,
//                                 ),
//                                 TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: RichText(
//                                       text: TextSpan(
//                                         text: '${labels.registerText08} ',
//                                         style: GoogleFonts.poppins(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 14,
//                                             color: Colors.black),
//                                         children: <TextSpan>[
//                                           TextSpan(
//                                               text: labels.registerChoose03,
//                                               style: GoogleFonts.poppins(
//                                                   fontWeight: FontWeight.w600,
//                                                   color: orangeColor,
//                                                   fontSize: 14)),
//                                         ],
//                                       ),
//                                     )),
//                                 Image.asset(
//                                   'assets/images/character-vector.png',
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _onPressed() async {
//     if (!checkNotifier.value) {
//       checkErrorNotifier.value = true;
//     }
//     if (_formKey.currentState!.validate() && checkNotifier.value) {
//       await dialogUtil.showLoadingPopup(
//         context,
//         otpCubit.checkAndSendOtp(
//           context,
//           userController.text,
//           emailController.text,
//           trimStart(phoneNumberController.text),
//           passwordController.text,
//         ),
//       );
//     }
//   }
//
//   String? validatorUsername(String? username) {
//     if (username!.length > 0 && username.length <= 50) {
//       return null;
//     } else
//       return labels.validateText06;
//   }
//
//   String? validatorEmail(String? email) {
//     RegExp regex = RegExp(
//         r'^[^_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*$');
//     if (email != null &&
//         EmailValidator.validate(email) &&
//         regex.hasMatch(email))
//       return null;
//     else
//       return labels.validateText07;
//   }
//
//   String? validatorPassword(String? password) {
//     RegExp regex =
//         RegExp(r'^((?=.*[A-Z])|(?=.*[@$!%*#?&]))[A-Za-z\d@$!%*#?&]{8,20}$');
//     if (password != null && regex.hasMatch(password))
//       return null;
//     else
//       return labels.registerText07;
//   }
// }
