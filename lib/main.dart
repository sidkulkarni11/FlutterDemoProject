import 'package:flutter/material.dart';
import 'package:flutter_demo_project/controller/BasicController.dart';
import 'package:provider/provider.dart'; // Ensure provider package is imported

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Basiccontroller()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic Tac Toe',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CountPage(), // Set the home widget to CountPage
      ),
    );
  }
}

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Page'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              for(int i = 0;
              i < context
                  .read<Basiccontroller>()
                  .ofName
                  .length;
              i++
              )...[
                Text(context.read<Basiccontroller>().ofName[i].name ?? "N/A"),
                Text(context.read<Basiccontroller>().ofName[i].age.toString())
              ],
              context.watch<Basiccontroller>().isVisble
                ? Offstage()
                : Container(
                width: 100,
                height: 100,
                color : Colors.red
              ),
              Text(
                context
                    .watch<Basiccontroller>()
                    .count
                    .toString(),
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(onPressed: () {
                context.read<Basiccontroller>().increaseCount();
                context.read<Basiccontroller>().toggle();
              }, child: Text("+"))
            ],
          ),
        ),
      ),
    );
  }
}
