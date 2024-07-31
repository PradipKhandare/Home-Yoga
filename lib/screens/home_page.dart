import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indian Yoga App"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("1"),
                      Text("Streak"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("1"),
                      Text("Streak"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("1"),
                      Text("Streak"),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Yoga For All'),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 5,),
                      child: Container(
                        height: 150,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 5,),
                      child: Container(
                        height: 150,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 5,),
                      child: Container(
                        height: 150,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Yoga For Students'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,),
                      child: Container(
                        height: 150,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 5,),
                      child: Container(
                        height: 150,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,),
                      child: Container(
                        height: 150,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
