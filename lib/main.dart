import 'package:flutter/material.dart';
import 'package:frtt_app/providers/trainingDataProvider.dart';
import 'package:frtt_app/trainingPage.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final currentTrainingData;

  const MyApp({super.key, this.currentTrainingData});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TrainingDataProvider(),
        )
      ],
      child: MaterialApp(
        home: StartPage(),
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FRTT"),
      ),
      body: Container(
        child: Calendar(),
      ),
      bottomNavigationBar: NavigatonBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.plus_one,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}

class NavigatonBar extends StatefulWidget {
  const NavigatonBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigatonBar> createState() => _NavigatonBarState();
}

class _NavigatonBarState extends State<NavigatonBar> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Setting",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: "Training",
        )
      ],
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
        switch (value) {
          case 3:
            break;
          default:
        }
      },
    );
  }

  Future<void> _navigateAndReturnTrainingData(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TrainingPage(),
        ));

    if (!mounted) return;
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        firstDay: DateTime.utc(2010),
        lastDay: DateTime.utc(2030),
        eventLoader: (day) => _getEventsForDay(day),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: ((selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }),
      ),
    );
  }

  List _getEventsForDay(DateTime day) {
    // return events[day] ?? [];
  }
}
