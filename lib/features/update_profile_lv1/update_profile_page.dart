import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toeic/features/update_profile_lv1/update_profile_cubit.dart';
import 'package:toeic/ui_kits/colors.dart';
import 'package:toeic/ui_kits/widgets/cubits/loading_cubit.dart';
import 'package:toeic/ui_kits/widgets/views/air_18_date_time.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_button.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_loading.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_text_field.dart';
import '../../hive/hive_service.dart';
import '../../injection/injection.dart';
import '../../ui_kits/styles.dart';
import '../../ui_kits/widgets/views/fow_image_picker.dart';
import '../../ui_kits/widgets/views/one_state_switch.dart';
import '../../utils/air_18_notification_dialog.dart';
import '../../utils/utils.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const UpdateProfilePage());
  }

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  late UpdateProfileCubit updateProfileCubit = getIt<UpdateProfileCubit>();
  final ValueNotifier<bool> submitNotifier = ValueNotifier(false);
  final ValueNotifier<String> profileNotifier = ValueNotifier('');

  int genderSelected = 1;
  int targetSelected = 1;
  LoadingCubit loadingCubit = LoadingCubit();

  @override
  void initState() {
    dateController.addListener(() {
      if (dateController.text.isNotEmpty) handleSubmit();
    });
    profileNotifier.addListener(() {
      handleSubmit();
    });
    updateProfileCubit.stream.listen((state) {
      if(state is UpdateProfileStateFailed){
        showDialog(
          context: context,
          builder: (context) => Air18NotificationDialog(
            title: "Thông báo",
            content:
            "Cập nhật thông tin thất bại, vui lòng thử lại sau.",
            onPositiveTap: () {
              Navigator.pop(context);
            },
            onNegativeTap: () {},
            positive: "Ok",
            isShowNegative: false,
          ),
        );
      }else if(state is UpdateProfileStateUploadFileFailed){
        showDialog(
          context: context,
          builder: (context) => Air18NotificationDialog(
            title: "Thông báo",
            content:
            "Upload file thất bại, vui lòng thử lại sau.",
            onPositiveTap: () {
              Navigator.pop(context);
            },
            onNegativeTap: () {},
            positive: "Ok",
            isShowNegative: false,
          ),
        );
      }
    });
    updateProfileCubit.reset();
    init();
    super.initState();
  }

  void handleSubmit() {
    submitNotifier.value =
        dateController.text.isNotEmpty && profileNotifier.value.isNotEmpty;
  }

  // void mock() {
  //   fullNameController.text = 'Vo Xuan Thinh';
  //   dateController.text = '14/09/1991';
  //   fullNameNotifier.value = true;
  //   dateNotifier.value = true;
  // }

  Future<void> init() async {
    updateProfileCubit.setup();
  }

  Widget buildTitle(String title, {bool isAsterisk = true}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: textTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          isAsterisk
              ? Text(
                  '*',
                  textAlign: TextAlign.left,
                  style: textTitleStyle.copyWith(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(height: 32),
      Center(
        child: Stack(
          children: [
            SizedBox(
              width: 128,
              child: FowImagePickerView(
                title: "Ảnh đại diện",
                onPicker: (file) {
                  profileNotifier.value = file.path;
                },
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IgnorePointer(
                child: SvgPicture.asset('assets/images/camera.svg'),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 32),
      buildTitle("Mục tiêu"),
      OneStateSwitch(
        data: targets.getMap(),
        selected: targetSelected,
        onChanged: (v) {
          targetSelected = v;
        },
      ),
      buildTitle("Ngày sinh"),
      Air18DateTime(
        currentDateTime: DateTime.now(),
        isBirthDate: true,
        isBlueColor: false,
        labelText: 'dd/mm/yyyy',
        controller: dateController,
      ),
      buildTitle("Giới tính"),
      OneStateSwitch(
        data: genders.getMap(),
        selected: genderSelected,
        images: genders.getImages(),
        onChanged: (v) {
          genderSelected = v;
        },
      ),
      buildTitle("Địa chỉ", isAsterisk: false),
      SBoxTextField(
        controller: addressController,
        textInputAction: TextInputAction.done,
        labelText: "Nhập địa chỉ",
        isBlueColor: false,
        maxLines: 3,
        maxLength: 200,
      ),
      const SizedBox(height: 4),
      const Text(
        'Maximum 200 characters',
        style: TextStyle(fontSize: 12, color: Color(0xff6b7ea6)),
      ),
      const SizedBox(height: 24),
      ValueListenableBuilder<bool>(
        valueListenable: submitNotifier,
        builder: (context, bool value, widget) {
          return makeSBoxButton(
            "Cập nhật",
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
                      "Cập nhật thông tin",
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

  Future<void> _onPressed() async {
    var data = {
      "birth_date": dateController.text.convertToDate(),
      "address": addressController.text,
      "gender": genders.value(genderSelected),
      "target": int.parse(targets.value(targetSelected)!),
    };
    final avatar = profileNotifier.value;
    loadingCubit.showLoading();
    final File file = File(avatar);
    await updateProfileCubit.updateLv1(data, file);
    loadingCubit.hideLoading();
  }
}
