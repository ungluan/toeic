import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../ui_kits/colors.dart';
import '../../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../../../ui_kits/widgets/views/sbox_button.dart';
import '../../../ui_kits/widgets/views/sbox_loading.dart';
import '../../../utils/air_18_notification_dialog.dart';
import '../../../utils/utils.dart';
import '../cubit/otp_cubit.dart';


class OtpPage extends StatefulWidget {
  const OtpPage(
      {Key? key, required this.isRegister, this.data, required this.otpCubit})
      : super(key: key);
  final bool isRegister;
  final OtpCubit otpCubit;
  final Map<String, dynamic>? data;

  static Route route(
          {required bool isRegister,
          Map<String, dynamic>? data,
          required OtpCubit otpCubit}) =>
      MaterialPageRoute(
        builder: (context) => OtpPage(
          isRegister: isRegister,
          data: data,
          otpCubit: otpCubit,
        ),
      );

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late CountdownController countdownController;
  final TextEditingController otpController = TextEditingController();
  final FocusNode pinCodeFocusNode = FocusNode();
  final LoadingCubit loadingCubit = LoadingCubit();

  // late OTPService otpService = OTPService();
  // late OTPRepository otpRepository = OTPRepository(otpService: otpService);
  // late OtpCubit otpCubit = OtpCubit(otpRepository);
  // late OtpCubit otpCubit;

  // late RegisterService registerService = RegisterService();
  // late RegisterRepository registerRepository =
  //     RegisterRepository(registerService: registerService);
  // late RegisterCubit registerCubit = RegisterCubit(repository: registerRepository);

  bool isFillOtp = false;
  bool isVerifyFailed = true;
  bool isTimeOut = false;
  ValueNotifier resend = ValueNotifier(false);
  late String phone;

  @override
  void initState() {
    super.initState();
    countdownController = CountdownController(
        duration: const Duration(seconds: 60),
        onEnd: () {
          setState(() {
            isTimeOut = true;
            isVerifyFailed = false;
            otpController.clear();
          });
        });

    phone = widget.data?['phone'] ?? '';
    widget.otpCubit.stream.listen((state) async {
      if (state is OtpStateLoading) {
        loadingCubit.showLoading();
      } else if (state is OtpStateSendSuccess) {
        loadingCubit.hideLoading();
        setState(() {
          isTimeOut = false;
          countdownController.value =
              const Duration(seconds: 60).inMilliseconds;
          countdownController.start();
        });
      } else if (state is OtpStateVerifyFailed) {
        loadingCubit.hideLoading();
        setState(() {
          isVerifyFailed = false;
        });
      } else if (state is OtpStateVerifySuccess) {
        loadingCubit.hideLoading();
        if (widget.isRegister) {
          Navigator.pop(context);
        } else {
          // Navigator.pushReplacement(
          //     context, ResetPasswordPage.route(phone: phone));
        }
      }
      else if (state is OtpStateSendFailed) {
        loadingCubit.hideLoading();
        showDialog(
            context: context,
            builder: (context) => Air18NotificationDialog(
                  title: 'Thông báo',
                  content: 'Gửi OTP thất bại, vui lòng thử lại sau.',
                  positive: "OK",
                  onPositiveTap: () => Navigator.pop(context),
                  onNegativeTap: () {},
                  isShowNegative: false,
                ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    countdownController.start();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false);
                          },
                          child: SvgPicture.asset(
                            'assets/images/arrow-left-icon.svg',
                            color: Colors.orange,
                          ),
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
                                Text(
                                  'Xác thực OTP',
                                  style: GoogleFonts.openSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: darkBlueColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                  'assets/images/business-and-finance-icon.svg',
                                  height: 42,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Vui lòng nhập mã OTP được gửi về điện thoại',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              phone,
                              style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  color: blueColor,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                !isVerifyFailed
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.clear,
                                            color: darkRedColor,
                                          ),
                                          Text(
                                            'Mã OTP không chính xác',
                                            style: GoogleFonts.openSans(
                                                color: darkRedColor,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )
                                    : const SizedBox(
                                        height: 24,
                                      ),
                                const SizedBox(height: 12),
                                Countdown(
                                    // controller: timerController,
                                    countdownController: countdownController,
                                    builder: (_, Duration time) {
                                      if (time.inSeconds == 0) {
                                        return Text(
                                          'Hết giờ!',
                                          style: GoogleFonts.openSans(
                                              color: darkRedColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        );
                                      }
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'OTP code còn hiệu lực trong ',
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '${digitFormat(time.inMinutes % 60)}:${digitFormat(time.inSeconds % 60)}',
                                            style: GoogleFonts.openSans(
                                                color: darkRedColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      );
                                    }),
                                const SizedBox(height: 16),
                                PinCodeTextField(
                                  appContext: context,
                                  focusNode: pinCodeFocusNode,
                                  length: 6,
                                  controller: otpController,
                                  animationType: AnimationType.none,
                                  onChanged: (value) {
                                    if (value.length == 6) {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        isFillOtp = true;
                                      });
                                    } else {
                                      setState(() {
                                        isFillOtp = false;
                                        isVerifyFailed = true;
                                      });
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  pinTheme: PinTheme(
                                    selectedColor: isVerifyFailed
                                        ? const Color(0xFF00B0FF)
                                        : const Color(0xFFFF1010),
                                    selectedFillColor: Colors.white,
                                    activeColor: isVerifyFailed
                                        ? const Color(0xFF00B0FF)
                                        : const Color(0xFFFF1010),
                                    inactiveColor: Colors.white,
                                    activeFillColor: isVerifyFailed
                                        ? Colors.white
                                        : const Color(0xFFFFEAEA),
                                    inactiveFillColor: Colors.white,
                                    fieldHeight: width > 392 ? 70 : 60,
                                    fieldWidth: width > 392 ? 50 : 45,
                                    borderWidth: 1,
                                    borderRadius: BorderRadius.circular(14),
                                    shape: PinCodeFieldShape.box,
                                  ),
                                  enableActiveFill: true,
                                  enablePinAutofill: true,
                                  showCursor: false,
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'Bạn vẫn chưa nhận được OTP code?',
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 4),
                                TextButton(
                                    onPressed: !isTimeOut
                                        ? null
                                        : () async {
                                            widget.otpCubit.sendOTP(
                                              phoneNumber: trimStartPhone(phone),
                                            );
                                          },
                                    child: Text(
                                      'Gửi lại OTP Code',
                                      style: GoogleFonts.openSans(
                                          color: isTimeOut
                                              ? orangeColor
                                              : Colors.grey,
                                          fontWeight: FontWeight.w700),
                                    )),
                                const SizedBox(height: 32),
                                makeSBoxButton(
                                    isVerifyFailed
                                        ? 'Xác thực'
                                        : 'Gửi lại',
                                    isEnable: isFillOtp && !isTimeOut,
                                    onTap: !(isFillOtp && !isTimeOut)
                                        ? null
                                        : () async {
                                            if (!isVerifyFailed) {
                                              setState(() {
                                                otpController.clear();
                                                isVerifyFailed = true;
                                                pinCodeFocusNode.requestFocus();
                                              });
                                            } else {
                                              widget.otpCubit.verifyOtp(
                                                  smsCode: otpController.text,
                                              );
                                            }
                                          },
                                    height: 50),
                                const SizedBox(height: 24),
                                Image.asset(
                                  'assets/images/character-vector.png',
                                  width: 256,
                                )
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
    );
  }
}
