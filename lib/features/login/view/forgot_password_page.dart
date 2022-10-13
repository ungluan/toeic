import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/login/cubit/otp_cubit.dart';
import 'package:toeic/injection/injection.dart';
import '../../../ui_kits/colors.dart';
import '../../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../../../ui_kits/widgets/views/air_18_button.dart';
import '../../../ui_kits/widgets/views/phone_number_text_field.dart';
import '../../../ui_kits/widgets/views/sbox_loading.dart';
import '../../../utils/air_18_notification_dialog.dart';
import '../../../utils/utils.dart';
import 'otp_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ForgotPasswordPage());
  }

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final phoneNumberController = TextEditingController();
  ValueNotifier<bool> phoneNotifier = ValueNotifier(false);
  late String phoneNotExisted;
  ValueNotifier<bool> phoneNotExistedNotifier = ValueNotifier(false);

  // late OTPService otpService = OTPService();
  // late OTPRepository otpRepository = OTPRepository(otpService: otpService);
  // late OtpCubit otpCubit = OtpCubit(otpRepository);
  late OtpCubit otpCubit = getIt<OtpCubit>();

  late LoadingCubit loadingCubit = LoadingCubit();

  @override
  void initState() {
    otpCubit.stream.listen((state) async {
      if (state is OtpStateUserNotExisted) {
        loadingCubit.hideLoading();
        // Handle Số điện thoại không tồn tại
        phoneNotExisted = phoneNumberController.text;
        phoneNotExistedNotifier.value = true;
      } else if (state is OtpStateUserExisted) {
        await otpCubit.sendOTP(
            phoneNumber: trimStartPhone(phoneNumberController.text));
        loadingCubit.hideLoading();
      } else if (state is OtpStateSendSuccess) {
        loadingCubit.hideLoading();
        Navigator.push(
          context,
          OtpPage.route(
              isRegister: false,
              data: {"phone": trimStart(phoneNumberController.text)},
              otpCubit: otpCubit),
        );
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
      } else if (state is OtpStateLoading) {
        loadingCubit.showLoading();
      } else {
        loadingCubit.hideLoading();
      }
    });
    /*otpCubit.stream.listen((state) {
      if (state is OtpStateSendFailed) {
        if(state.error=="You have reached the limit of receiving OTP codes. Please try again in 30 minutes.") {
          showDialog(context: context, builder: (context) =>
              NotificationDialog(
                title: labels.oTPFailedTitle,
                content: labels.oTPFailedText,
                onPositiveTap: () {
                  Navigator.pop(context);
                },
                onNegativeTap: () {},
                isShowNegative: false,
                positive: labels.oTPChoose03,
              ));
        }
        else showDialog(context: context, builder: (context) => NotificationDialog(
          title: labels.forgotpasswordText03,
          content: labels.forgotpasswordText04,
          onPositiveTap: (){
            Navigator.pop(context);
          },
          onNegativeTap: (){},
          isShowNegative: false,
          positive: labels.popupErrorText02,
        ),);
      } else if (state is OtpStateSendSuccess) {
        Navigator.pushReplacement(
            context,
            OtpPage.route(
                isResetPassword: true,
                data: {'phone': trimStart(phoneNumberController.text)}));
      }
    });*/
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
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
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
                              'assets/images/arrow-left-icon.svg',
                              color: orangeColor,
                            ),
                          ),
                          const SizedBox(height: 48),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Quên mật khẩu?',
                                        maxLines: 2,
                                        style: GoogleFonts.openSans(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: darkBlueColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    SvgPicture.asset(
                                      'assets/images/forgot-icon.svg',
                                      height: 40,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Nhập số điện thoại bạn đã đăng ký, chúng tôi sẽ gửi OTP code về điện thoại của bạn.',
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
                                            valueListenable:
                                                phoneNotExistedNotifier,
                                            builder: (_, value, __) =>
                                                PhoneNumberTextField(
                                              validator: validatePhone,
                                              textInputAction:
                                                  TextInputAction.done,
                                              controller: phoneNumberController,
                                              labelText: 'Số điện thoại',
                                              validNotifier: phoneNotifier,
                                              validateModeAlways: value,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 160,
                                          ),
                                          ValueListenableBuilder(
                                            valueListenable: phoneNotifier,
                                            builder:
                                                (context, bool value, widget) {
                                              return makeAir18Button(
                                                'Gửi OTP',
                                                isEnable: value,
                                                onTap: () async {
                                                  FocusScope.of(context).unfocus();
                                                  await otpCubit
                                                      .checkPhoneNumber(
                                                          phoneNumber:
                                                              trimStart(
                                                    phoneNumberController.text,
                                                  ));
                                                },
                                                height: 50,
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 24),
                                          Image.asset(
                                            'assets/images/character-vector.png',
                                            width: 256,
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
                  Loading(loadingCubit: loadingCubit)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String? validatePhone(String? value) {
    if (phoneNotExistedNotifier.value && phoneNotExisted == value ) {
      return "Số điện thoại không tồn tại";
    }
    return validatorPhoneNumber(value);
  }
}
