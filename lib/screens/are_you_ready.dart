import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:yoga/screens/workout_details.dart';

class AreYouReady extends StatelessWidget {
  const AreYouReady({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height /2 -100,),
                Text(
                  "Are you ready?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Consumer<TimerModel>(builder: (context, myModel, child) {
                  return CircleAvatar(
                    radius: 60,
                    child: Text(
                      myModel.countdown.toString(),
                      style: TextStyle(fontSize: 48),
                    ),
                  );
                }),
                Spacer(),
                Divider(thickness: 2,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15,),
                    child: Text(
                      "Next: Anulom Vilom",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier {
  TimerModel(BuildContext context) {
    myTimer(context);
  }

  int countdown = 5;

  myTimer(BuildContext context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutDetails(),),);
      }
    });
  }
}
