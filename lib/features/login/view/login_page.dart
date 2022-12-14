import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/login/view/register_page.dart';
import '../../../injection/injection.dart';
import '../../../ui_kits/colors.dart';
import '../../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../../../ui_kits/widgets/views/password_text_field.dart';
import '../../../ui_kits/widgets/views/phone_number_text_field.dart';
import '../../../ui_kits/widgets/views/sbox_button.dart';
import '../../../ui_kits/widgets/views/sbox_loading.dart';
import '../../../utils/air_18_notification_dialog.dart';
import '../../../utils/utils.dart';
import '../cubit/login_cubit.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginCubit cubit = getIt<LoginCubit>();
  LoadingCubit loadingCubit = getIt<LoadingCubit>();

  // HiveService hive = HiveService();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // RegisterCubit registerCubit = getIt<RegisterCubit>();
  ValueNotifier<bool> phoneNotifier = ValueNotifier(false);
  ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
  ValueNotifier<bool> loginNotifier = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    cubit.stream.listen((state) {
      if (state is LoginStateFailed) {
        loadingCubit.hideLoading();
        showDialog(
          context: context,
          builder: (context) => Air18NotificationDialog(
            title: "Thông báo",
            content:
                "Tài khoản hoặc mật khẩu không chính xác, vui lòng thử lại.",
            onPositiveTap: () {
              Navigator.pop(context);
            },
            onNegativeTap: () {},
            positive: "Ok",
            isShowNegative: false,
          ),
        );
      }else if(state is LoginStateSuccess){
        loadingCubit.hideLoading();
      }else{
        loadingCubit.showLoading();
      }
    });

    phoneNotifier.addListener(() {
      loginNotifier.value = phoneNotifier.value && passwordNotifier.value;
    });
    passwordNotifier.addListener(() {
      loginNotifier.value = phoneNotifier.value && passwordNotifier.value;
    });
    super.initState();
  }

  void mock() {
    userNameController.text = '387370149';
    passwordController.text = 'Passlagi@123';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 128,
                          height: 128,
                        ),
                        const SizedBox(height: 20),
                        PhoneNumberTextField(
                          validator: validatorPhoneNumber,
                          controller: userNameController,
                          labelText: 'Số điện thoại',
                          validNotifier: phoneNotifier,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PasswordTextField(
                          validator: validatorPassword,
                          controller: passwordController,
                          labelText: 'Mật khẩu',
                          textInputAction: TextInputAction.done,
                          validNotifier: passwordNotifier,
                          image: "assets/images/password_v1.svg",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context, ForgotPasswordPage.route());
                              },
                              child: Text(
                                'Quên mật khẩu',
                                style: GoogleFonts.openSans(
                                  color: orangeColor,
                                  fontSize: 14,
                                  letterSpacing: 0.1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, RegisterPage.route());
                              },
                              child: Text(
                                'Đăng ký',
                                style: GoogleFonts.openSans(
                                  color: orangeColor,
                                  fontSize: 14,
                                  letterSpacing: 0.1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: loginNotifier,
                          builder: (context, enable, _) => makeSBoxButton(
                            'Đăng Nhập',
                            onTap: _onPressed,
                            height: 50,
                            isEnable: true,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'assets/images/character-vector.png',
                            height: 326,
                            scale: 1.2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Loading(
                loadingCubit: loadingCubit,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      final userName = userNameController.text;
      final password = passwordController.text;
      await cubit.login(username: trimStart(userName), password: password);
    }
  }
}
