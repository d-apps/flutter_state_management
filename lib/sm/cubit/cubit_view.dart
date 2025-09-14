import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/sm/widgets/app_scaffold.dart';

import 'counter_cubit.dart';

class CubitView extends StatelessWidget {
  const CubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: AppScaffold(
        title: "Cubit",
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How have pushed the button this many times:"),
              BlocBuilder<CounterCubit, int>(
                builder: (BuildContext context, int count){
                  return Text('$count');
                },
              ),
              Builder(
                builder: (innerContext){
                  return ElevatedButton(
                      onPressed: () => innerContext.read<CounterCubit>().increment(),
                      child: Text("Tap")
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
