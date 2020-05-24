import 'package:equatable/equatable.dart';

abstract class ConfigerState extends Equatable {
  final List propss;

  ConfigerState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnConfigerState extends ConfigerState {
  UnConfigerState();

  @override
  String toString() => 'UnConfigerState';
}

/// Initialized
class InConfigerState extends ConfigerState {
  @override
  String toString() => 'InConfigerState';
}

class ErrorConfigerState extends ConfigerState {
  final String errorMessage;

  ErrorConfigerState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorConfigerState';
}
