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
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {},
        child: Container(
         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10,),
            child: Text(
          "Start",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
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
              title: Text(
                "Yoga",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              background: Image.network(
                "https://media.istockphoto.com/id/481603934/photo/monk-in-maditation.jpg?s=612x612&w=0&k=20&c=J38O-Z1Fy0S5JAUGzL6tvFl7xAsjbU1kKA-lDE2ccHE=",
                fit: BoxFit.cover,
              ),
            ),
            leading: Icon(Icons.backup_outlined),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.white,),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "16 Minutes || 26 Workout",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                      itemBuilder: (context, index) => ListTile(
                            leading: Container(
                                margin: EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Image.network(
                                  "https://media.tenor.com/VKRUZC38BQkAAAAj/teamechtemamas-echtemamas.gif",
                                  fit: BoxFit.cover,
                                )),
                            title: Text(
                              "Yoga $index",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              (index % 2 == 0) ? "00:20" : "X20",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                      itemCount: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
