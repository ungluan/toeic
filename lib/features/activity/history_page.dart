import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/ui_kits/widgets/views/sbox_loading.dart';

import '../../injection/injection.dart';
import '../../ui_kits/colors.dart';
import '../../ui_kits/widgets/cubits/loading_cubit.dart';
import '../../utils/utils.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const HistoryPage());
  }

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final examinationCubit = getIt<ExaminationCubit>();
  final loadingCubit = getIt<LoadingCubit>();


  @override
  void initState() {
    super.initState();
    examinationCubit.getListExaminationByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Lịch sử',
          style: GoogleFonts.openSans(
            fontSize: 18,
            color: darkBlueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/images/arrow-left-icon.svg',
            width: 24,
            height: 24,
            color: orangeColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<ExaminationCubit, ExaminationState>(
            bloc: examinationCubit,
            builder: (context, state)=> state.maybeWhen(
                history: (examinations){
                  if(examinations.isEmpty){
                    return const Text("Không có lịch sử");
                  }else{
                    return ListView.builder(
                      itemCount: examinations.length,
                      itemBuilder: (ctx, index)=> buildTestItem(),
                    );
                  }
                },
                failed: (message)=> Text("Lỗi: $message"),
                orElse: ()=> const SizedBox(),
            ),
          ),
          Loading(loadingCubit: loadingCubit)
        ],
      ),
    );
  }
}
