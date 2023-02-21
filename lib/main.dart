import 'dart:async';

import 'package:clock_animation/animated_switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// global text style
TextStyle textStyle({double? fontSize, Color? color, FontWeight? fontWeight}) =>
    GoogleFonts.glegoo(
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? const Color.fromARGB(255, 158, 138, 193),
      fontSize: fontSize ?? 20,
    );

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime now = DateTime.now();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        setState(() {
          // to update new time with new time after adding a sec in current time
          now = now.add(Duration(seconds: 1));
        });
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Cloack animation',
            style: textStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimeWidget(
                time: DateFormat('HH').format(now),
              ),
              const SizedBox(
                height: 20,
              ),
              TimeWidget(
                time: DateFormat('mm').format(now),
              ),
              const SizedBox(
                height: 20,
              ),
              TimeWidget(
                time: DateFormat('ss').format(now),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
    required this.time,
  }) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.03),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // lets add some simple animation component
          Center(
            child: AnimatedSwitcherWidget(time: time),
          ),
          Center(
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 5,
                  color: Colors.black54,
                ),
                const Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.black54,
                  ),
                ),
                Container(
                  height: 20,
                  width: 5,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
