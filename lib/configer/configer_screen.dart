import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews2/configer/index.dart';

import 'configer_bloc.dart';

class ConfigerScreen extends StatefulWidget {
  const ConfigerScreen({
    Key key,
    @required ConfigerBloc configerBloc,
  })  : _configerBloc = configerBloc,
        super(key: key);

  final ConfigerBloc _configerBloc;

  @override
  ConfigerScreenState createState() {
    return ConfigerScreenState();
  }
}

class ConfigerScreenState extends State<ConfigerScreen> {
  ConfigerScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigerBloc, ConfigerState>(
        bloc: widget._configerBloc,
        builder: (
          BuildContext context,
          ConfigerState currentState,
        ) {
          if (currentState is UnConfigerState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorConfigerState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
          if (currentState is InConfigerState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.toString()),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._configerBloc.add(LoadConfigerEvent());
  }
}
