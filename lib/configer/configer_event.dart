import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutternews2/configer/index.dart';
import 'package:flutternews2/utils/constants.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigerEvent {
  Stream<ConfigerState> applyAsync(
      {ConfigerState currentState, ConfigerBloc bloc});
// Future<ConfigerState> applyAsync({ConfigerState configerState,ConfigerBloc bloc}){
//   return null;
}

class DarkModeEvent extends ConfigerEvent {
  final darkOn;

  DarkModeEvent(this.darkOn);

  @override
  String toString() => 'DarkModeEvent';

  @override
  Stream<ConfigerState> applyAsync(
      {ConfigerState currentState, ConfigerBloc bloc}) async* {
    try {
      bloc.darkModeOn = darkOn;
      Constants.perfs.setBool(Constants.darkModeperf, darkOn);
      yield InConfigerState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'DarkModeEvent', error: _, stackTrace: stackTrace);
      yield ErrorConfigerState(_?.toString());
    }
  }
}

class UnConfigerEvent extends ConfigerEvent {
  @override
  Stream<ConfigerState> applyAsync(
      {ConfigerState currentState, ConfigerBloc bloc}) async* {
    yield UnConfigerState();
  }
}

class LoadConfigerEvent extends ConfigerEvent {
  @override
  Stream<ConfigerState> applyAsync(
      {ConfigerState currentState, ConfigerBloc bloc}) async* {
    try {
      yield UnConfigerState();
      await Future.delayed(Duration(seconds: 1));
      yield InConfigerState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadConfigerEvent', error: _, stackTrace: stackTrace);
      yield ErrorConfigerState(_?.toString());
    }
  }
}
