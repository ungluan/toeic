import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toeic/features/activity/activity_page.dart';
import 'package:toeic/features/activity/cubit/user_cubit.dart';
import 'package:toeic/features/login/cubit/otp_cubit.dart';
import 'package:toeic/features/main_page.dart';
import 'package:toeic/features/update_profile_lv1/update_profile_cubit.dart';
import 'package:toeic/ui_kits/colors.dart';
import 'package:toeic/ui_kits/widgets/cubits/loading_cubit.dart';
import 'package:toeic/ui_kits/widgets/views/air_18_date_time.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_button.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_loading.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_text_field.dart';
import '../../injection/injection.dart';
import '../../ui_kits/styles.dart';
import '../../ui_kits/ui_kit.dart';
import '../../ui_kits/widgets/views/fow_image_picker.dart';
import '../../ui_kits/widgets/views/one_state_switch.dart';
import '../../ui_kits/widgets/views/phone_number_text_field.dart';
import '../../utils/air_18_notification_dialog.dart';
import '../../utils/utils.dart';
import '../login/view/otp_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.userCubit}) : super(key: key);
  final UserCubit userCubit;

  static Route route({required UserCubit cubit}) {
    return MaterialPageRoute<void>(
      builder: (_) => EditProfilePage(userCubit: cubit),
    );
  }

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  final ValueNotifier<bool> submitNotifier = ValueNotifier(true);
  final ValueNotifier<bool> firstNameNotifier = ValueNotifier(true);
  final ValueNotifier<bool> lastNameNotifier = ValueNotifier(true);
  final ValueNotifier<bool> emailNotifier = ValueNotifier(true);
  final ValueNotifier<bool> phoneNotifier = ValueNotifier(true);
  final ValueNotifier<bool> phoneExistedNotifier = ValueNotifier(false);
  final ValueNotifier<bool> emailExistedNotifier = ValueNotifier(false);


  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode dateFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  final otpCubit = getIt<OtpCubit>();
  late Map<String, dynamic> data;

  String phoneExisted = "";
  String emailExisted = "";

  int genderSelected = 1;
  int targetSelected = 1;
  LoadingCubit loadingCubit = LoadingCubit();

  @override
  void initState() {
    setup();
    firstNameController.addListener(() {
      handleSubmit();
    });

    lastNameController.addListener(() {
      handleSubmit();
    });

    emailController.addListener(() {
      handleSubmit();
    });

    phoneController.addListener(() {
      handleSubmit();
    });

    dateController.addListener(() {
      handleSubmit();
    });

    emailNotifier.addListener(() {
      handleSubmit();
    });

    phoneNotifier.addListener(() {
      handleSubmit();
    });

    widget.userCubit.stream.listen((state) {
      loadingCubit.showLoading();
      if(state is UserStateUpdated){
        loadingCubit.hideLoading();
        if(mounted){
          showDialog(
            context: context,
            builder: (context) => Air18NotificationDialog(
              title: "Th??ng b??o",
              content:
              "C???p nh???t th??ng tin th??nh c??ng",
              onPositiveTap: () {
                int count = 2;
                Navigator.of(context).popUntil((_) => count-- <= 0);
              },
              onNegativeTap: () {},
              positive: "?????ng ??",
              isShowNegative: false,
            ),
          );
        }
      }
      else if(state is UserStateFailed){
        loadingCubit.hideLoading();
        if(mounted) {
          showDialog(
            context: context,
            builder: (context) =>
                Air18NotificationDialog(
                  title: "Th??ng b??o",
                  content:
                  "C???p nh???t th??ng tin th???t b???i, vui l??ng th??? l???i sau.",
                  onPositiveTap: () {
                    Navigator.pop(context);
                  },
                  onNegativeTap: () {},
                  positive: "?????ng ??",
                  isShowNegative: false,
                ),
          );
        }
      }
    });

    otpCubit.stream.listen((state) async {
      loadingCubit.showLoading();
      if (state is OtpStateUserExisted) {
        loadingCubit.hideLoading();
        handleEmailAndPassword(
            email: data['email'] != '', phone: data['phone_number'] != '');
      } else if (state is OtpStateUserNotExisted) {
        await otpCubit.sendOTP(phoneNumber: trimStartPhone(phoneController.text));
        loadingCubit.hideLoading();
      } else if (state is OtpStateSendSuccess) {
        loadingCubit.hideLoading();
        Navigator.push(
            context,
            OtpPage.route(
                isRegister: true,
                data: {"phone": trimStart(phoneController.text)},
                otpCubit: otpCubit
            ),
        );
      } else if( state is OtpStateSendFailed){
        loadingCubit.hideLoading();
        showDialog(
          context: context,
          builder: (context) => Air18NotificationDialog(
            title: "Th??ng b??o",
            content: "G???i OTP th???t b???i, vui l??ng th??? l???i sau.",
            positive: "Ok",
            onPositiveTap: () => Navigator.pop(context),
            onNegativeTap: () {},
            isShowNegative: false,
          ),
        );
      } else if (state is OtpStateVerifySuccess) {
        loadingCubit.showLoading();
        logger("Th???c hi???n ????ng k?? user");
        logger(data);
        await widget.userCubit.updateUser(data);
      } else if (state is OtpStateLoading) {
        loadingCubit.showLoading();
      }
    });

    super.initState();
  }

  void handleSubmit() {
    submitNotifier.value =
        firstNameController.text.trim().isNotEmpty && lastNameController.text.trim().isNotEmpty
      && emailNotifier.value && phoneNotifier.value;
  }

  void handleEmailAndPassword({required bool email, required bool phone}) {
    if (email) {
      emailExisted = emailController.text;
    }
    if (phone) {
      phoneExisted = phoneController.text;
    }
    emailExistedNotifier.value = email;
    phoneExistedNotifier.value = phone;
  }

  void setup(){
    var user = widget.userCubit.user;
    print(user);
    firstNameController.text = user?.firstName ?? '';
    lastNameController.text = user?.lastName ?? '';
    emailController.text = user?.email ?? '';
    targetSelected = getKeyFromTarget(user?.target);
    phoneController.text = user?.phoneNumber ?? '';
    dateController.text = user?.birthDate?.convertToBirthDate() ?? '';
    genderSelected = user?.gender == 'Nam' ? 1 : 2;
    addressController.text = user?.address ?? '';

    // if(user?.email != null) emailNotifier.value = true;
    // if(user?.phoneNumber != null) phoneNotifier.value = true;

  }

  int getKeyFromTarget(int? target){
    if(target == 500) {
      return 1;
    } else if(target==700) {
      return 2;
    } else {
      return 3;
    }
  }

  Future<void> init() async {
    setup();
  }

  Widget buildBody() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(height: 32),
      buildTitle("H???"),
      SBoxTextField(
        validator: validatorFirstName,
        validNotifier: firstNameNotifier,
        controller: firstNameController,
        labelText: 'H???',
        focusNode: firstNameFocusNode,
        nextFocusNode: lastNameFocusNode,
      ),
      SizedBox(height: 16),
      buildTitle("T??n"),
      SBoxTextField(
        validator: validatorLastName,
        validNotifier: lastNameNotifier,
        controller: lastNameController,
        labelText: 'T??n',
        focusNode: lastNameFocusNode,
        nextFocusNode: emailFocusNode,
      ),
      SizedBox(height: 16),
      buildTitle("Email"),
      ValueListenableBuilder<bool>(
        valueListenable: emailExistedNotifier,
        builder: (_, value, __) => SBoxTextField(
          validator: validateEmail,
          validNotifier: emailNotifier,
          controller: emailController,
          labelText: 'Email',
          focusNode: emailFocusNode,
          validateModeAlways: value,
        ),
      ),
      SizedBox(height: 16),
      buildTitle("M???c ti??u"),
      OneStateSwitch(
        data: targets.getMap(),
        selected: targetSelected,
        onChanged: (v) {
          targetSelected = v;
        },
      ),
      buildTitle("S??? ??i???n tho???i"),
      ValueListenableBuilder<bool>(
        valueListenable: phoneExistedNotifier,
        builder: (context, value, _) =>
            PhoneNumberTextField(
              validator: validatePhone,
              controller: phoneController,
              labelText: 'S??? ??i???n tho???i',
              validNotifier: phoneNotifier,
              focusNode: phoneFocusNode,
              nextFocusNode: dateFocusNode,
              textInputAction: TextInputAction.done,
              validateModeAlways: value,
            ),
      ),
      SizedBox(height: 16),
      buildTitle("Ng??y sinh"),
      Air18DateTime(
        currentDateTime: DateTime.now(),
        isBirthDate: true,
        isBlueColor: false,
        labelText: 'dd/mm/yyyy',
        focusNode: dateFocusNode,
        nextFocusNode: addressFocusNode,
        controller: dateController,
      ),
      buildTitle("Gi???i t??nh"),
      OneStateSwitch(
        data: genders.getMap(),
        selected: genderSelected,
        images: genders.getImages(),
        onChanged: (v) {
          genderSelected = v;
        },
      ),
      buildTitle("?????a ch???", isAsterisk: false),
      SBoxTextField(
        controller: addressController,
        textInputAction: TextInputAction.done,
        labelText: "Nh???p ?????a ch???",
        isBlueColor: false,
        maxLines: 3,
        focusNode: addressFocusNode,
        maxLength: 200,
      ),
      const SizedBox(height: 4),
      const Text(
        'T???i ??a 200 k?? t???',
        style: TextStyle(fontSize: 12, color: Color(0xff6b7ea6)),
      ),
      const SizedBox(height: 24),
      ValueListenableBuilder<bool>(
        valueListenable: submitNotifier,
        builder: (context, bool value, widget) {
          return makeSBoxButton(
            "C???p nh???t",
            height: 60,
            onTap: _onPressed,
            isEnable: value,
          );
        },
      ),
      const SizedBox(height: 32),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "C???p nh???t th??ng tin",
                      textAlign: TextAlign.center,
                      style: textTitleStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: orangeColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: buildBody(),
                    )
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
      return "S??? ??i???n tho???i ???? t???n t???i";
    }
    return validatorPhoneNumber(phone);
  }

  Future<void> _onPressed() async {
    data = {
      "first_name": firstNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "phone_number": trimStart(phoneController.text.trim()),
      "birth_date": dateController.text.convertToDate(),
      "address": addressController.text,
      "gender": genders.value(genderSelected),
      "target": int.parse(targets.value(targetSelected)!),
    };
    logger(trimStart(phoneController.text.trim()));
    logger(widget.userCubit.user!.phoneNumber);
    if(emailController.text.trim() == widget.userCubit.user!.email && trimStart(phoneController.text.trim()) != widget.userCubit.user!.phoneNumber){
      await otpCubit.sendOTP(phoneNumber: trimStartPhone(phoneController.text));
    }
    else if(emailController.text.trim() != widget.userCubit.user!.email && trimStart(phoneController.text.trim()) != widget.userCubit.user!.phoneNumber){
      await otpCubit.checkUserExist(
          phoneNumber: phoneController.text, email: emailController.text);
    }else{
      widget.userCubit.updateUser(data);
    }
  }

  String? validateEmail(String? email) {
    if (emailExistedNotifier.value && email == emailExisted) {
      return "Email ???? t???n t???i";
    }
    return validatorEmail(email);
  }
}
