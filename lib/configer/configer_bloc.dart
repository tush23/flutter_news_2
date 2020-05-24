import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutternews2/configer/index.dart';

class ConfigerBloc extends Bloc<ConfigerEvent, ConfigerState> {
  //* making singleton
  // ignore: close_sinks
  static final ConfigerBloc _configerBlocSingleton = ConfigerBloc._internal();

  factory ConfigerBloc() => _configerBlocSingleton;

  ConfigerBloc._internal();

  bool darkModeOn = true;
  bool internetConnection = true;

  @override
  ConfigerState get initialState => UnConfigerState();

  @override
  Stream<ConfigerState> mapEventToState(
    ConfigerEvent event,
  ) async* {
    try {
      yield UnConfigerState();
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ConfigerBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
