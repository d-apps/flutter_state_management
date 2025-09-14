import 'package:flutter/material.dart';
import 'package:flutter_state_management/sm/state_management_type.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Wrap(
            spacing: 10,
            children: StateManagementType.values.map((sm){
              return InkWell(
                onTap: (){
                  final page = sm.widget();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => page,
                    ),
                  );
                },
                child: Chip(
                  label: Text(sm.name, style: const TextStyle(color: Colors.white),),
                  backgroundColor: sm.color(),
                  padding: const EdgeInsets.all(8.0),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}



