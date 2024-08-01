import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreakScreen extends StatelessWidget {
  const BreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelWorkout>(
      create: (context) => TimerModelWorkout(context),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://img.freepik.com/free-photo/stylish-guy-gym-relaxing-floor-eating-healthy-food_78826-2736.jpg?size=626&ext=jpg&ga=GA1.1.2040517772.1698325858&semt=ais_hybrid"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Break Time",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Consumer<TimerModelWorkout>(
                builder: (context, myModel, child) {
                  return Text(
                    myModel.countdown.toString(),
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 24,
                  ),
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Previous",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Next",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Next: Anulom Vilom",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerModelWorkout with ChangeNotifier {
  TimerModelWorkout(BuildContext context) {
    myTimer(context);
  }

  int countdown = 20;

  myTimer(BuildContext context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BreakScreen(),
          ),
        );
      }
    });
  }
}
