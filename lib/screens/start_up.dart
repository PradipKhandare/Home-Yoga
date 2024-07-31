import 'package:flutter/material.dart';

class StartUp extends StatefulWidget {
  const StartUp({super.key});

  @override
  State<StartUp> createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.red,
                expandedHeight: 300,
                pinned: true,
                title: Text("AppBar"),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  centerTitle: false,
                  title: Text("Yoga", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  background: Image.network("https://media.istockphoto.com/id/481603934/photo/monk-in-maditation.jpg?s=612x612&w=0&k=20&c=J38O-Z1Fy0S5JAUGzL6tvFl7xAsjbU1kKA-lDE2ccHE=", fit: BoxFit.cover,),
                ),
                leading: Icon(Icons.backup_outlined),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_outlined),),
                ],
              ),
              SliverToBoxAdapter(
                child:  Column(
                  children: [
                    Container(
                      height: 200,
                      color: Colors.green,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                    ),
                    Container(
                      height: 200,
                      color: Colors.green,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
