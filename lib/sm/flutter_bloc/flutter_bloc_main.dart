import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/sm/flutter_bloc/flutter_bloc_view.dart';

import 'bloc/counter_bloc.dart';

Widget flutterBlocMain() {
  return MaterialApp(
    home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc())
        ],
        child: FlutterBlocView()
    )
  );
}