import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {

  int _remainingSeconds = 25 * 60;
  final TextEditingController hours = TextEditingController();
  final TextEditingController minutes = TextEditingController();
  final TextEditingController seconds = TextEditingController();
  bool _isRunning = false;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _remainingSeconds = (int.parse(hours.text) * 3600) + (int.parse(minutes.text) * 60) + (int.parse(seconds.text) % 60);
    });
  }
  @override
  void initState() {
    hours.text = (_remainingSeconds/3600).toStringAsFixed(0);
    minutes.text = (_remainingSeconds/60).toStringAsFixed(0);
    seconds.text = (_remainingSeconds%60).toStringAsFixed(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String remaininghours = _remainingSeconds~/3600>=10 ? (_remainingSeconds~/3600).toStringAsFixed(0) : '0${(_remainingSeconds~/3600).toStringAsFixed(0)}';
    String remainminutes = ((_remainingSeconds%3600)~/60)>=10 ? ((_remainingSeconds%3600)~/60).toStringAsFixed(0) : '0${((_remainingSeconds%3600)~/60).toStringAsFixed(0)}';
    String remainseconds = ((_remainingSeconds%3600)%60) >= 10 ? ((_remainingSeconds%3600)%60).toStringAsFixed(0) : '0${((_remainingSeconds%3600)%60).toStringAsFixed(0)}';
    // print(remaininghours);
    // print(remainminutes);
    // print(remainseconds);
    // String seconds = ;
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$remaininghours : $remainminutes : $remainseconds',
            style: GoogleFonts.lexend(
              fontSize: 40
            ),),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _isRunning ? (){
                _stopTimer();
                setState(() {
                  _isRunning = false;
                });
              } : (){
                setState(() {
                  // print(hours.text);
                  // print(minutes.text);
                  // print(seconds.text);
                  _remainingSeconds = (int.parse(hours.text) * 3600) + (int.parse(minutes.text) * 60) + (int.parse(seconds.text) % 60);

                  _isRunning = true;
                });
                _startTimer();
              },
              child: Text(_isRunning ? "Stop" : "Start",
              style: GoogleFonts.lexend(
                fontSize: 20
              ),),
            ),
            ElevatedButton(
              onPressed: _resetTimer,
              child: Text('Reset',
              style: GoogleFonts.lexend(
                fontSize: 20
              ),),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // initialValue: 'Hello',
                    controller: hours,
                    decoration: InputDecoration(
                      hintText: 'Hours',
                      hintStyle: GoogleFonts.lexend()
                    ),
                  ),
                ),
                const Text(':'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // initialValue: (_remainingSeconds/60).toStringAsFixed(0),
                    controller: minutes,
                    decoration: InputDecoration(
                        hintText: 'Minutes',
                        hintStyle: GoogleFonts.lexend()
                    ),
                  ),
                ),
                const Text(':'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // initialValue: (_remainingSeconds%60).toStringAsFixed(0),
                    controller: seconds,
                    decoration: InputDecoration(
                        hintText: 'Seconds',
                        hintStyle: GoogleFonts.lexend()
                    ),

                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}