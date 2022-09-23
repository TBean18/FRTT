import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frtt_app/providers/trainingDataProvider.dart';
import 'package:provider/provider.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TrainingDataProvider(
              data: TrainingData(date: DateTime.now(), method: [])),
        )
      ],
      child: Scaffold(
        body: Center(
          child: Container(
            child: ElevatedButton(
              child: Text("Log Training Data"),
              onPressed: () {
                Provider.of<TrainingDataProvider>(context).data;
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
