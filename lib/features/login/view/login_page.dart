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
import '../../../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }
}

class _LoginPageState extends State<LoginPage> {
  // LoginCubit cubit = getIt<LoginCubit>();
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
    // cubit.stream.listen((state) {
    //   if (state is LoginStateFailed) {
    //     // showOkToast(state.message);
    //     showDialog(
    //       context: context,
    //       builder: (context) => NotificationDialog(
    //         title: labels.loginErrorTitle,
    //         content: labels.loginErrorText,
    //         onPositiveTap: () {
    //           Navigator.pop(context);
    //         },
    //         onNegativeTap: () {},
    //         positive: labels.loginChoose02,
    //         isShowNegative: false,
    //       ),
    //     );
    //   } else if (state is LoginStateSuccess) {
    //     if (mounted) if (Navigator.canPop(context)) Navigator.pop(context);
    //   }
    // });
    // registerCubit.stream.listen((state) {
    //   if (state is RegisterStateLoaded) {
    //     userNameController.text =
    //         state.data['phone'].toString().replaceFirst('+84', '');
    //     passwordController.text = state.data['password'];
    //   }
    // });

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

  bool isPhoneNumber(String? s) {
    if (s == null) return false;
    return double.tryParse(s) != null && trimStart(s).length == 12;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png', width: 128, height: 128,),
                        const SizedBox(height: 20),
                        // RichText(
                        //   text: TextSpan(
                        //     children: [
                        //       const TextSpan(
                        //         text: "Make ",
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       TextSpan(
                        //         text: "Friend ",
                        //         style: TextStyle(
                        //           color: blueColor,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       const TextSpan(
                        //         text: "& ",
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       TextSpan(
                        //         text: "Chat, ",
                        //         style: TextStyle(
                        //           color: orangeColor,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       const TextSpan(
                        //         text: "Dating",
                        //         style: TextStyle(
                        //           color: Color(0xff7d00ec),
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 16),
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
                                // Navigator.push(context, ForgotPasswordPage.route());
                              },
                              child: Text(
                                'Quên mật khẩu',
                                style: GoogleFonts.poppins(
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
                                style: GoogleFonts.poppins(
                                    color: orangeColor,
                                    fontSize: 14,
                                    letterSpacing: 0.1,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: loginNotifier,
                          builder: (context, enable, _) =>
                              makeSBoxButton(
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
      print("UserName: " + userName);
      print("Password: " + password);
      loadingCubit.showLoading();
      // await cubit.login(username: trimStart(userName), password: password);
      loadingCubit.hideLoading();
    }
  }

}
