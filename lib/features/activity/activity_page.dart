import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toeic/features/activity/cubit/user_cubit.dart';
import 'package:toeic/features/activity/term_and_condition_page.dart';
import 'package:toeic/features/edit_profile/edit_profile_page.dart';
import '../../injection/injection.dart';
import '../../services/notification.dart';
import '../../ui_kits/colors.dart';
import '../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../../ui_kits/widgets/views/notification_dialog.dart';
import '../../ui_kits/widgets/views/sbox_loading.dart';
import '../../utils/utils.dart';
import '../login/cubit/authentication_cubit.dart';
import 'history_page.dart';

class ActivityPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ActivityPage());
  }

  ActivityPage();

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with AutomaticKeepAliveClientMixin {
  UserCubit userCubit = getIt<UserCubit>();
  final authenticationCubit = getIt<AuthenticationCubit>();
  ValueNotifier<File?>? fileNotifier = ValueNotifier(null);
  LoadingCubit loadingCubit = getIt<LoadingCubit>();

  final notificationService = getIt<NotificationService>();

  void _interceptTap(DrawerItem item) {
    switch (item) {
      case DrawerItem.Logout:
      case DrawerItem.Notification:
      case DrawerItem.Policy:
      case DrawerItem.UpdateProfile:
      case DrawerItem.History:
        _onTap(item);
        break;
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void _onTap(DrawerItem item) async {
    switch (item) {
      case DrawerItem.Logout:
        logout();
        break;
      case DrawerItem.History:
        Navigator.of(context).push(HistoryPage.route());
        break;
      case DrawerItem.UpdateProfile:
        Navigator.of(context).push(EditProfilePage.route(cubit: userCubit));
        break;
      case DrawerItem.Notification:
        final time = await showPicker(context);
        if (time != null) {
          notificationService.scheduleNotification(
            id: 0,
            title: "C?? c??ng m??i s???t c?? ng??y n??n kim.",
            body:
                "T???i gi??? ??n luy???n r???i, ch??m ch??? luy???n t???p ????? c?? m???t k???t qu??? v?????t qua c??? s??? mong ?????i.",
            hour: time.hour,
            minute: time.minute,
          );
        }
        break;
      case DrawerItem.Policy:
        Navigator.of(context).push(TermAndConditionPage.route());
        break;
    }
  }

  Future<TimeOfDay?> showPicker(BuildContext context) => showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
        confirmText: 'Nh???c nh???',
        cancelText: 'H???y',
        helpText: 'Vui l??ng ch???n gi??? b???n mu???n ???????c nh???c nh???',
        hourLabelText: 'Gi???',
        minuteLabelText: 'Ph??t',
        initialEntryMode: TimePickerEntryMode.input,
      );

  @override
  void initState() {
    super.initState();
    setup();

    userCubit.stream.listen((state) {
      print("OOKOKOKO");
      logger(userCubit.user);
    });
  }

  void setup() async {}

  void showPickImageBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: 128,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.picture_in_picture),
                  title: const Text('Th?? vi???n'),
                  onTap: () async {
                    pickImage(ImageSource.gallery);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('M??y ???nh'),
                  onTap: () async {
                    pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<void> pickImage(ImageSource imageSource) async {
    final _picker = ImagePicker();
    Navigator.pop(context);
    final pickedFile = await _picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      // update Profile lv1
      //
      fileNotifier!.value = File(pickedFile.path);
      await _onPressed();
    } else {
      print('No image selected.');
    }
  }

  Future<void> _onPressed() async {
    loadingCubit.showLoading();
    await userCubit.updateAvatar(fileNotifier!.value!);
    loadingCubit.hideLoading();
  }

  void showUpdateProfileDialog() {
    // showDialog(
    //   context: context,
    //   builder: (buildContext) => NotificationDialog(
    //     title: labels.updateProfilePopupText01.toUpperCase(),
    //     content: labels.updateProfilePopupText02,
    //     onPositiveTap: () {
    //       Navigator.pop(context);
    //       Navigator.push(context, UpgradeInformationPage.route());
    //     },
    //     onNegativeTap: () {
    //       Navigator.pop(context);
    //     },
    //   ),
    // );
  }

  void logout() {
    final title = 'Th??ng b??o';
    final yes = "C??";
    final content = "B???n c?? th???c s??? mu???n ????ng xu???t kh??ng?";
    final cancel = "H???y";

    showDialog(
      context: context,
      builder: (context) => NotificationDialog(
        title: title,
        content: content,
        onPositiveTap: () async {
          Navigator.pop(context);
          loadingCubit.showLoading();
          await authenticationCubit.logout();
          loadingCubit.hideLoading();
        },
        onNegativeTap: () {
          Navigator.pop(context);
        },
        positive: yes,
        negative: cancel,
      ),
    );
  }

  Widget buildContent(String icon, String content,
      {required VoidCallback onTap, bool enable = true}) {
    return InkWell(
      onTap: () => onTap(),
      child: Opacity(
        opacity: enable ? 1 : 0.5,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Row(
            children: [
              SizedBox(
                height: 30,
                child: SvgPicture.asset(
                  icon,
                  height: 30,
                  color: blueColor,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                content,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BlocBuilder<UserCubit, UserState>(
                      bloc: userCubit,
                      builder: (context, state) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  makeFowImage(
                                    userCubit.user?.avatar ?? '',
                                    size: 112,
                                    ratio: 1,
                                    borderRadius: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showPickImageBottomSheet();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/la-user-edit.svg",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/membership.svg',
                                          width: 24,
                                          height: 24,
                                          color: orangeColor,
                                        ),
                                        Flexible(
                                          child: Text(
                                            '${userCubit.user?.firstName} ${userCubit.user?.lastName}',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'M???c ti??u: ${userCubit.user?.target ?? 0}',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SvgPicture.asset('assets/images/la-medal.svg', width: 24, height: 24,)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Divider(color: blueColor),
                          const SizedBox(height: 16),
                          // buildTitle('1'),
                          const SizedBox(height: 12),
                          buildContent('assets/images/profile-icon.svg',
                              'C???p nh???t th??ng tin', onTap: () {
                            _interceptTap(DrawerItem.UpdateProfile);
                          }, enable: true),
                          const SizedBox(height: 16),
                          buildContent(
                              'assets/images/la-medal.svg', 'L???ch s??? luy???n t???p',
                              onTap: () {
                            _interceptTap(DrawerItem.History);
                          }, enable: true),
                          const SizedBox(height: 16),
                          buildContent('assets/images/ic_chat_time.svg',
                              'Nh???c nh??? ??n luy???n', onTap: () {
                            _interceptTap(DrawerItem.Notification);
                          }, enable: true),
                          const SizedBox(height: 16),
                          buildContent(
                              'assets/images/report.svg', '??i???u kho???n s??? d???ng',
                              onTap: () {
                            _interceptTap(DrawerItem.Policy);
                          }, enable: true),
                          const SizedBox(height: 16),
                          buildContent('assets/images/logout.svg', '????ng xu???t',
                              onTap: () {
                            logout();
                          }, enable: true),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Loading(loadingCubit: loadingCubit)
          ],
        ),
      ),
    );
  }
}

enum DrawerItem { History, Logout, UpdateProfile, Notification, Policy }
