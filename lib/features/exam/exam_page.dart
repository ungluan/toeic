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

class _ExamPageState extends State<ExamPage> {
  final testCubit = getIt<TestCubit>();
  final loadingCubit = getIt<LoadingCubit>();
  Widget _buildTestItem() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shadowColor: blueColor,
      borderOnForeground: true,
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      semanticContainer: true,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Text 1',
              style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: darkBlueColor,
                  fontWeight: FontWeight.bold),
            ),
            Text('Thời gian: 120 phút | Câu hỏi: 200', style: GoogleFonts.openSans(fontSize: 14, color: lightTextColor),),
            Row(
              children: [
                GestureDetector(
                  onTap: ()=>{},
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Chip(
                      backgroundColor: primaryColor.withOpacity(0.5),
                      elevation: 2,
                      padding: EdgeInsets.all(8),
                      label: Text('10/990'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>{},
                  child: Chip(
                    elevation: 2,
                    backgroundColor: Colors.green.withOpacity(0.8),
                    padding: EdgeInsets.all(8),
                    label: Text('Làm lại'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 60,
            color: darkBlueColor,
            child: const Center(
              child: Text('Luyện thi'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          // child: ListView.builder(itemBuilder: ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            child: BlocBuilder<TestCubit, TestState>(
              bloc: testCubit,
              builder: (context, state){
                return ListView.builder(
                  itemBuilder: (context, index) => _buildTestItem(),
                  itemCount: 10,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

