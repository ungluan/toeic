import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/practice/cubit/test_cubit.dart';
import 'package:toeic/features/practice/list_test_page.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/ui_kits/colors.dart';
import 'package:toeic/ui_kits/widgets/cubits/loading_cubit.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_loading.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> with AutomaticKeepAliveClientMixin {
  final testCubit = getIt<TestCubit>();
  final loadingCubit = getIt<LoadingCubit>();

  @override
  void initState() {
    super.initState();
    loadingCubit.showLoading();
    testCubit.getListTestByTypeTest(8);

    testCubit.stream.listen((state) {
      if(state is TestStateLoaded){
        loadingCubit.hideLoading();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListTestPage(typeTestId: 8)
    );
  }


  @override
  bool get wantKeepAlive => true;
}

