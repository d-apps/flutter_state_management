import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/sm/flutter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_state_management/sm/flutter_bloc/bloc/counter_event.dart';
import 'package:flutter_state_management/sm/flutter_bloc/bloc/counter_state.dart';
import 'package:flutter_state_management/sm/widgets/app_scaffold.dart';

class FlutterBlocView extends StatelessWidget {

  const FlutterBlocView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CounterBloc(),
      child: AppScaffold(
        title: "Flutter Bloc",
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state){
                  return Text('${state.count}');
                },
              ),
              Builder(
                builder: (innerContext){
                  final counterBloc = innerContext.read<CounterBloc>();
                  return Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => counterBloc.add(CounterIncrementEvent()),
                          child: Text("Tap +")
                      ),
                      ElevatedButton(
                          onPressed: () => counterBloc.add(CounterDecrementEvent()),
                          child: Text("Tap -")
                      ),
                      ElevatedButton(
                          onPressed: () => counterBloc.add(CounterResetEvent()),
                          child: Text("Reset")
                      )
                    ],
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
