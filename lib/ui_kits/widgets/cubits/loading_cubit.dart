import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'loading_cubit.freezed.dart';

@injectable
class LoadingCubit extends Cubit<LoadingState>{
  LoadingCubit() : super(const LoadingState.init());

  void showLoading(){
    emit(const LoadingState.loading());
  }
  void hideLoading(){
    emit(const LoadingState.init());
  }
}
@freezed
class LoadingState with _$LoadingState{
  const factory LoadingState.loading() = LoadingStateLoading;
  const factory LoadingState.init() = LoadingStateInit;
}