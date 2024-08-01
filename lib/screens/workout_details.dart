import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/screens/are_you_ready.dart';

import 'break_screen.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelWorkout>(
      create: (context) => TimerModelWorkout(context),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://indiasomeday.com/wp-content/uploads/2020/07/Yoga-Teacher_Photo-Credit-Indian-yogi-Yogi-madhav.jpg",
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              "Anulom Vilom",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 35,
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 80,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "00",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " : ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<TimerModelWorkout>(
                    builder: (context, myModel, child) {
                      return Text(
                        myModel.countdown.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15,),
                child: Text(
                  "Pause",
                  style: TextStyle(fontSize: 20, color: Colors.white,),
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){}, child: Text("Previous", style: TextStyle(fontSize: 16),),),
                  TextButton(onPressed: (){}, child: Text("Next", style: TextStyle(fontSize: 16)),),
                ],
              ),
            ),

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
    );
  }
}

class TimerModelWorkout with ChangeNotifier {
  TimerModelWorkout(BuildContext context){
    myTimer(context);
  }
  int countdown = 30;

  myTimer(BuildContext context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context) => BreakScreen(),),);
      }
    });
  }
}
