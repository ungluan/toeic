import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/login/cubit/authentication_cubit.dart';
import 'package:toeic/features/login/cubit/register_cubit.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_text_field.dart';

import '../../../ui_kits/colors.dart';
import '../../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../../../ui_kits/widgets/views/air_18_checkbox.dart';
import '../../../ui_kits/widgets/views/password_text_field.dart';
import '../../../ui_kits/widgets/views/phone_number_text_field.dart';
import '../../../ui_kits/widgets/views/sbox_button.dart';
import '../../../ui_kits/widgets/views/sbox_loading.dart';
import '../../../utils/air_18_notification_dialog.dart';
import '../../../utils/utils.dart';
import '../cubit/otp_cubit.dart';
import 'otp_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterPage());
  }

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  // final dateController = TextEditingController();

  final ValueNotifier<bool> firstNameNotifier = ValueNotifier(false);
  final ValueNotifier<bool> lastNameNotifier = ValueNotifier(false);
  final ValueNotifier<bool> emailNotifier = ValueNotifier(false);
  final ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
  final ValueNotifier<bool> repeatPasswordNotifier = ValueNotifier(false);
  final ValueNotifier<bool> phoneNotifier = ValueNotifier(false);
  final ValueNotifier<bool> checkNotifier = ValueNotifier(false);
  final ValueNotifier<bool> checkErrorNotifier = ValueNotifier(false);
  final ValueNotifier<bool> createAccountNotifier = ValueNotifier(false);
  final ValueNotifier<bool> phoneExistedNotifier = ValueNotifier(false);
  final ValueNotifier<bool> emailExistedNotifier = ValueNotifier(false);

  FocusNode lastNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repeatPasswordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  late RegisterCubit registerCubit = getIt<RegisterCubit>();
  late OtpCubit otpCubit = getIt<OtpCubit>();

  late AuthenticationCubit authenticationCubit = getIt<AuthenticationCubit>();
  late LoadingCubit loadingCubit = LoadingCubit();

  String phoneExisted = "";
  String emailExisted = "";
  var isTheFirst = true;

  // late SwitchCubit genderCubit = SwitchCubit(userRepository);
  late String? genderSaved;
  late Map<String, dynamic> data;

  @override
  void initState() {
    mock();
    init();
    passwordNotifier.addListener(() {
      final text = repeatPasswordController.text;
      repeatPasswordController.text = '';
      repeatPasswordController.text = text;
      final status = isValid();
      createAccountNotifier.value = status;
    });
    repeatPasswordNotifier.addListener(() {
      final status = isValid();
      createAccountNotifier.value = status;
    });
    emailNotifier.addListener(() {
      final status = isValid();
      createAccountNotifier.value = status;
    });
    phoneNotifier.addListener(() {
      final status = isValid();
      createAccountNotifier.value = status;
    });
    checkNotifier.addListener(() {
      final status = isValid();
      createAccountNotifier.value = status;
    });
    passwordController.addListener(() {
      debugPrint(passwordController.text);
      if (passwordController.text == repeatPasswordController.text) {
        repeatPasswordNotifier.value = true;
      } else if (repeatPasswordController.text.isNotEmpty) {
        repeatPasswordNotifier.value = false;
      }
    });

    otpCubit.stream.listen((state) async {
      if (state is OtpStateUserExisted) {
        loadingCubit.hideLoading();
        logger(data['email'] != '');
        logger(data['phone_number'] != '');
        handleEmailAndPassword(
            email: data['email'] != '', phone: data['phone_number'] != '');
      }
      else if (state is OtpStateUserNotExisted) {
        // logger(phoneNumberController.text);
        // logger(trimStartPhone(phoneNumberController.text));
        await otpCubit.sendOTP(
            phoneNumber: trimStartPhone(phoneNumberController.text));
        loadingCubit.hideLoading();
      } else if (state is OtpStateSendSuccess) {
        loadingCubit.hideLoading();
        Navigator.push(
            context,
            OtpPage.route(
                isRegister: true,
                data: {"phone": trimStart(phoneNumberController.text)},
                otpCubit: otpCubit));
      } else if (state is OtpStateSendFailed) {
        loadingCubit.hideLoading();
        showDialog(
          context: context,
          builder: (context) => Air18NotificationDialog(
            title: "Thông báo",
            content: "Gửi OTP thất bại, vui lòng thử lại sau.",
            positive: "Ok",
            onPositiveTap: () => Navigator.pop(context),
            onNegativeTap: () {},
            isShowNegative: false,
          ),
        );
      } else if (state is OtpStateVerifySuccess) {
        loadingCubit.showLoading();
        logger(data);
        await registerCubit.register(data);
      }
    });

    registerCubit.stream.listen((state) {
      if (state is RegisterStateSuccessful /* && isTheFirst*/) {
        /*isTheFirst = false;*/
        loadingCubit.hideLoading();
        showDialog(
          context: context,
          builder: (context) => Air18NotificationDialog(
            title: "Thông báo",
            content:
                "Đăng ký tài khoản thành công. Hãy tận hưởng ứng dụng thôi.",
            positive: "Ok",
            onPositiveTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // registerCubit.completed();
            },
            onNegativeTap: () {},
            isShowNegative: false,
          ),
        );
      } else if (state is RegisterStateFailed) {
        loadingCubit.hideLoading();
        showDialog(
          context: context,
          builder: (context) => Air18NotificationDialog(
            title: "Thông báo",
            content: "Đăng ký tài khoản thất bại. Lỗi: ${state.error}",
            positive: "Ok",
            onPositiveTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // registerCubit.completed();
            },
            onNegativeTap: () {},
            isShowNegative: false,
          ),
        );
      }
    });
    super.initState();
  }

  Future<void> init() async {
    // await genderCubit.setUpGender();
  }

  void handleEmailAndPassword({required bool email, required bool phone}) {
    if (email) {
      emailExisted = emailController.text;
    }
    if (phone) {
      phoneExisted = phoneNumberController.text;
    }
    emailExistedNotifier.value = email;
    phoneExistedNotifier.value = phone;
    print(emailExistedNotifier.value);
    print(phoneExistedNotifier.value);
  }

  // 0968147002
  void mock() {
    firstNameController.text = 'a';
    lastNameController.text = 'a';
    emailController.text = 'luan1@gmail.com';
    phoneNumberController.text = '0915837119';
    passwordController.text = 'Passlagi123';
    repeatPasswordController.text = 'Passlagi123';
    // dateController.text = "08-10-2000";
    emailNotifier.value = true;
    passwordNotifier.value = true;
    repeatPasswordNotifier.value = true;
    phoneNotifier.value = true;
  }

  bool isValid() {
    return lastNameNotifier.value &&
        firstNameNotifier.value &&
        emailNotifier.value &&
        phoneNotifier.value &&
        passwordNotifier.value &&
        repeatPasswordNotifier.value &&
        checkNotifier.value;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 24, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/images/arrow-left-icon.svg',
                              color: orangeColor,
                              width: 32,
                              height: 32,
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 128,
                              height: 128,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          const SizedBox(
                            width: 32,
                            height: 32,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SBoxTextField(
                              validator: validatorFirstName,
                              validNotifier: firstNameNotifier,
                              controller: firstNameController,
                              labelText: 'Họ',
                              nextFocusNode: lastNameFocusNode,
                            ),
                            const SizedBox(height: 24),
                            SBoxTextField(
                              validator: validatorLastName,
                              validNotifier: lastNameNotifier,
                              controller: lastNameController,
                              labelText: 'Tên',
                              focusNode: lastNameFocusNode,
                              nextFocusNode: emailFocusNode,
                            ),
                            const SizedBox(height: 24),
                            ValueListenableBuilder<bool>(
                              valueListenable: emailExistedNotifier,
                              builder: (_, value, __) => SBoxTextField(
                                validator: validateEmail,
                                validNotifier: emailNotifier,
                                controller: emailController,
                                labelText: 'Email',
                                focusNode: emailFocusNode,
                                nextFocusNode: passwordFocusNode,
                                validateModeAlways: value,
                              ),
                            ),
                            const SizedBox(height: 24),
                            PasswordTextField(
                              validator: validatorPassword,
                              validNotifier: passwordNotifier,
                              controller: passwordController,
                              labelText: 'Mật khẩu',
                              textInputAction: TextInputAction.next,
                              focusNode: passwordFocusNode,
                              nextFocusNode: repeatPasswordFocusNode,
                              image: 'assets/images/password.svg',
                            ),
                            const SizedBox(height: 24),
                            ValueListenableBuilder<bool>(
                              valueListenable: repeatPasswordNotifier,
                              builder: (context, value, _) => PasswordTextField(
                                validator: (String? value) {
                                  if (passwordController.text == value &&
                                      value != null) {
                                    return null;
                                  } else {
                                    return 'Mật khẩu phải trùng khớp';
                                  }
                                },
                                validNotifier: repeatPasswordNotifier,
                                controller: repeatPasswordController,
                                labelText: 'Nhập lại mật khẩu',
                                textInputAction: TextInputAction.next,
                                focusNode: repeatPasswordFocusNode,
                                nextFocusNode: phoneFocusNode,
                                isRepeat: true,
                                image: 'assets/images/password.svg',
                              ),
                            ),
                            const SizedBox(height: 24),
                            ValueListenableBuilder<bool>(
                              valueListenable: phoneExistedNotifier,
                              builder: (context, value, _) =>
                                  PhoneNumberTextField(
                                validator: validatePhone,
                                controller: phoneNumberController,
                                labelText: 'Số điện thoại',
                                validNotifier: phoneNotifier,
                                focusNode: phoneFocusNode,
                                textInputAction: TextInputAction.done,
                                validateModeAlways: value,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                ValueListenableBuilder(
                                  builder: (BuildContext context, bool value,
                                      Widget? child) {
                                    return Air18CheckBox(
                                      valueChanged: (v) {
                                        checkErrorNotifier.value = false;
                                      },
                                      isCheck: value,
                                      checkNotifier: checkNotifier,
                                    );
                                  },
                                  valueListenable: checkNotifier,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.5),
                                  child: Text(
                                    'Đồng ý với những ',
                                    style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'điều khoản của chúng tôi',
                                    overflow: TextOverflow.clip,
                                    softWrap: false,
                                    style: GoogleFonts.openSans(
                                        decoration: TextDecoration.underline,
                                        color: blueColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            ValueListenableBuilder(
                                valueListenable: checkErrorNotifier,
                                builder: (context, bool value, widget) {
                                  return value
                                      ? Row(
                                          children: [
                                            const SizedBox(
                                              width: 24,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Vui lòng chấp nhận điều khoản',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .errorColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox();
                                }),
                            const SizedBox(height: 24),
                            Column(
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: createAccountNotifier,
                                  builder: (context, bool value, widget) {
                                    return makeSBoxButton('Đăng ký',
                                        onTap: _onPressed,
                                        // height: 50,
                                        isEnable: true);
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SvgPicture.asset(
                                  'assets/images/character-illustration.svg',
                                  width: double.infinity,
                                  height: 200,
                                ),
                                const SizedBox(
                                  height: 40,
                                )
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Loading(loadingCubit: loadingCubit)
            ],
          ),
        ),
      ),
    );
  }

  String? validatePhone(String? phone) {
    if (phoneExistedNotifier.value && phone == phoneExisted) {
      return "Số điện thoại đã tồn tại";
    }
    return validatorPhoneNumber(phone);
  }

  String? validateEmail(String? email) {
    if (emailExistedNotifier.value && email == emailExisted) {
      return "Email đã tồn tại";
    }
    return validatorEmail(email);
  }

  void _onPressed() async {
    FocusScope.of(context).unfocus();
    if (!checkNotifier.value) {
      checkErrorNotifier.value = true;
      phoneNumberController.text = phoneNumberController.text;
    }
    if (_formKey.currentState!.validate() && checkNotifier.value) {
      data = {
        "email": emailController.text,
        "password": passwordController.text,
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "phone_number": phoneNumberController.text,
      };
      logger(data);
      otpCubit.checkUserExist(
          phoneNumber: phoneNumberController.text, email: emailController.text);
      // await otpCubit.checkEmail(emailController.text);
    }
  }

// void showNotificationDialog({
//   required String title,
//   required String content,
//   required String positive,
//   VoidCallback? onPositive
// }) {
//   showDialog(
//     context: context,
//     builder: (context) =>
//         Air18NotificationDialog(
//           title: title,
//           content: content,
//           onPositiveTap: () {
//             onPositive!();
//           },
//           onNegativeTap: () {},
//           positive: positive,
//           isShowNegative: false,
//         ),
//   );
// }
}
