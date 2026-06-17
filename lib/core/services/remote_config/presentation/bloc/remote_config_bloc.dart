import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_template/core/services/remote_config/domain/usecases/fetch_remote_config_usecase.dart';
import 'package:flutter_app_template/core/services/remote_config/domain/usecases/get_remote_value_usecase.dart';
import 'package:flutter_app_template/core/services/remote_config/presentation/bloc/remote_config_event.dart';
import 'package:flutter_app_template/core/services/remote_config/presentation/bloc/remote_config_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteConfigBloc extends Bloc<RemoteConfigEvent, RemoteConfigState> {
  RemoteConfigBloc({
    required this.fetchRemoteConfigUseCase,
    required this.getRemoteValueUseCase,
  }) : super(const RemoteConfigInitial()) {
    on<FetchRemoteConfigEvt>(_onFetch);
  }

  final FetchRemoteConfigUseCase fetchRemoteConfigUseCase;
  final GetRemoteValueUseCase getRemoteValueUseCase;

  FutureOr<void> _onFetch(
    FetchRemoteConfigEvt event,
    Emitter<RemoteConfigState> emit,
  ) async {
    emit(const RemoteConfigLoading());
    final result = await fetchRemoteConfigUseCase.call();
    result.fold(
      (failure) => emit(RemoteConfigError(message: failure.message)),
      (_) => emit(const RemoteConfigLoaded()),
    );
  }

  String getString(String key) => getRemoteValueUseCase.getString(key);
  bool getBool(String key) => getRemoteValueUseCase.getBool(key);
  int getInt(String key) => getRemoteValueUseCase.getInt(key);
  double getDouble(String key) => getRemoteValueUseCase.getDouble(key);
}
