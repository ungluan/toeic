// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:toeic/apis/models/Choice.dart';
//
// import '../../../apis/models/Test.dart';
// import '../../../repositories/user_repository.dart';
//
// part 'practice_cubit.freezed.dart';
//
// @injectable
// class PracticeCubit extends Cubit<PracticeState> {
//   final UserRepository userRepository;
//
//   PracticeCubit(this.userRepository) : super(const PracticeState.loading());
//
//   Map<String, dynamic> mock() => {
//     "type": "part1",
//     "questions": [
//       {
//         "id": 1,
//         "content": "content",
//         "explain": "explain",
//         "a": "aaa",
//         "b": "bbb",
//         "c": "ccc",
//         "d": "ddd",
//         "answer": "answer",
//         "exam": {
//           "id": "id",
//           "paragraph": "id",
//           "image": "id",
//           "audio": "id",
//           "part": {"id": 1, "name": "name"}
//         }
//       },
//       {
//         "id": 1,
//         "content": "content",
//         "explain": "explain",
//         "a": "aaa",
//         "b": "bbb",
//         "c": "ccc",
//         "d": "ddd",
//         "answer": "answer",
//         "exam": {
//           "id": "id",
//           "paragraph": "id",
//           "image": "id",
//           "audio": "id",
//           "part": {"id": 1, "name": "name"}
//         }
//       }
//     ]
//   };
//   List<Choice>? _choices = [];
//   List<Choice>? get choices => _choices;
//   Future<void> setupTest() async {
//     try {
//       emit(const PracticeState.loading());
//       var response = Test.fromJson(mock());
//       if (responase.type == "part1") {
//         _choices = response.questions
//             ?.map((e) => Choice(id: e.id!, name: ""))
//             .toList();
//         emit(PracticeState.loaded(response.questions ?? []));
//       }
//     } on DioError catch (e) {
//       emit(PracticeState.failed(e.response?.statusMessage ?? ''));
//     }
//   }
// }
//
// @freezed
// class PracticeState with _$PracticeState {
//   const factory PracticeState.loading() = PracticeStateLoading;
//
//   const factory PracticeState.failed(String error) = PracticeStateFailed;
//
//   const factory PracticeState.loaded(Test test) = PracticeStateLoaded;
//
//   const factory PracticeState.chooseAnswer() = PracticeStateChooseAnswer;
// }
