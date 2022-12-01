import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/hive/hive_service.dart';
import 'package:toeic/injection/injection.dart';

import '../../../apis/models/Examination.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/examination_repository.dart';
import '../../../repositories/user_repository.dart';

part 'history_cubit.freezed.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final hive = getIt<HiveService>();
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final ExaminationRepository examinationRepository;
  bool isLoadMore = true;
  List<Examination> _examinations = [];
  List<Examination> get examinations => _examinations;
  int curIndex = 0;
  HistoryCubit(this.authenticationRepository, this.userRepository, this.examinationRepository)
      : super(const HistoryState.loading()) {
    authenticationRepository.userStream.listen((user) {

    });
  }

  Future<void> getHistory({int limit = 10}) async {
    try {
      emit(const HistoryState.loading());
      final response = await examinationRepository.getHistory(curIndex, limit);
      curIndex += response.length;
      if(response.length ==0) isLoadMore = false;
      _examinations.addAll(response);
      emit(const HistoryState.loaded());
    } on DioError catch (e) {
      emit(HistoryState.failed(e.message));
    }
  }

}

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = HistoryStateLoading;
  const factory HistoryState.loaded() = HistoryStateLoaded;
  const factory HistoryState.failed(String error) = HistoryStateFailed;
}
