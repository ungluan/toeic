import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/login/cubit/reset_password_cubit.dart';
import 'package:toeic/features/login/view/login_page.dart';
import 'package:toeic/injection/injection.dart';

import '../../../ui_kits/colors.dart';
import '../../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../../../ui_kits/widgets/views/air_18_button.dart';
import '../../../ui_kits/widgets/views/air_18_password_text_field.dart';
import '../../../ui_kits/widgets/views/sbox_loading.dart';
import '../../../utils/air_18_notification_dialog.dart';
import '../../../utils/utils.dart';

class ResetPasswordPage extends StatefulWidget {
  final String phone;

  const ResetPasswordPage(this.phone, {Key? key}) : super(key: key);

  static Route route({required String phone}) {
    return MaterialPageRoute<void>(builder: (_) => ResetPasswordPage(phone));
  }

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repeatPasswordFocusNode = FocusNode();
  ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
  ValueNotifier<bool> repeatPasswordNotifier = ValueNotifier(false);
  ValueNotifier<bool> actionNotifier = ValueNotifier(false);
  ValueNotifier<bool> duplicate = ValueNotifier(false);
  late String oldPass;
  late ResetPasswordCubit cubit = getIt<ResetPasswordCubit>();
  late LoadingCubit loadingCubit = LoadingCubit();

  @override
  void initState() {
    passwordController.addListener(() {
      if (passwordController.text == repeatPasswordController.text) {
        repeatPasswordNotifier.value = true;
      } else if (repeatPasswordController.text.isNotEmpty) {
        repeatPasswordNotifier.value = false;
      }
      actionNotifier.value =
          passwordNotifier.value && repeatPasswordNotifier.value;
    });

    passwordNotifier.addListener(() {
      actionNotifier.value =
          passwordNotifier.value && repeatPasswordNotifier.value;
    });
    repeatPasswordNotifier.addListener(() {
      actionNotifier.value =
          passwordNotifier.value && repeatPasswordNotifier.value;
    });
    cubit.stream.listen((state) async {
      if (state is ResetPasswordStateFailed) {
        loadingCubit.hideLoading();
        showDialog(
            context: context,
            builder: (context) => Air18NotificationDialog(
                  title: "Th??ng b??o",
                  content: "?????i m???t kh???u th???t b???i, vui l??ng th??? l???i.",
                  onPositiveTap: () {
                    Navigator.pop(context);
                  },
                  onNegativeTap: () {},
                  isShowNegative: false,
                  positive: "Ok",
                ));
      } else if (state is ResetPasswordStateSuccess) {
        loadingCubit.hideLoading();
        showDialog(
            context: context,
            builder: (context) => Air18NotificationDialog(
                  title: "Th??ng b??o",
                  content: "?????i m???t kh???u th??nh c??ng, h??y ????ng nh???p l???i.",
                  onPositiveTap: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  },
                  onNegativeTap: () {},
                  isShowNegative: false,
                  positive: "Let's go",
                ));
      } else if (state is ResetPasswordStateLoading) {
        loadingCubit.showLoading();
      } else if (state is ResetPasswordStateDuplicate) {
        duplicate.value = true;
        oldPass = passwordController.text;
        loadingCubit.hideLoading();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                  'assets/images/arrow-left-icon.svg')),
                          const SizedBox(height: 48),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '?????i m???t kh???u',
                                      style: GoogleFonts.openSans(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(
                                      'assets/images/synchronize-icon.svg',
                                      height: 42,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'M???t kh???u m???i ph???i kh??c v???i m???t kh???u c??.',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 16),
                                    Form(
                                      child: Column(
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: duplicate,
                                            builder: (_, value, __) =>
                                                Air18PasswordTextField(
                                              validator: validatePassword,
                                              focusNode: passwordFocusNode,
                                              nextFocusNode:
                                                  repeatPasswordFocusNode,
                                              controller: passwordController,
                                              labelText: 'M???t kh???u',
                                              validNotifier: passwordNotifier,
                                              textInputAction:
                                                  TextInputAction.next,
                                              image:
                                                  'assets/images/password.svg',
                                              validateModeAlways: value,
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          Air18PasswordTextField(
                                            validator: (String? value) {
                                              if (passwordController.text ==
                                                      value &&
                                                  value != null &&
                                                  value.isNotEmpty)
                                                return null;
                                              else {
                                                return 'M???t kh???u ph???i tr??ng kh???p.';
                                              }
                                            },
                                            validNotifier:
                                                repeatPasswordNotifier,
                                            controller:
                                                repeatPasswordController,
                                            labelText: 'Nh???p l???i m???t kh???u',
                                            textInputAction:
                                                TextInputAction.done,
                                            focusNode: repeatPasswordFocusNode,
                                            isRepeat: true,
                                            image: 'assets/images/password.svg',
                                          ),
                                          const SizedBox(
                                            height: 72,
                                          ),
                                          ValueListenableBuilder(
                                            valueListenable: actionNotifier,
                                            builder:
                                                (context, bool value, widget) {
                                              return makeAir18Button('C???p nh???t',
                                                  isEnable: value,
                                                  onTap: _onPressed,
                                                  height: 50);
                                            },
                                          ),
                                          const SizedBox(height: 24),
                                          Image.asset(
                                            'assets/images/character-vector.png',
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Loading(
                    loadingCubit: loadingCubit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String? validatePassword(String? value) {
    if (duplicate.value && value == oldPass) {
      return "M???t kh???u ph???i kh??c v???i m???t kh???u c??";
    }
    return validatorPassword(value);
  }

  Future<void> _onPressed() async {
    FocusScope.of(context).unfocus();
    cubit.resetPassword(password: passwordController.text, phone: widget.phone);
  }
}
