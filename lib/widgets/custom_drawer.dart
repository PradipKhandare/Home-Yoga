import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://media.istockphoto.com/id/1178946445/photo/small-indian-girl-practicing-yoga-or-meditation-with-closed-eyes-sitting-isolated-in.jpg?s=612x612&w=0&k=20&c=PeQEANPqHWmislwewIRWQOmess-uB8oGgTC1JJMMRUs="),
              ),
            ),
          ),
          ListTile(
            title: Text("Reset Progress", style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.restart_alt_sharp, size: 25,),
          ),
          ListTile(
            title: Text("Share with friends", style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.share, size: 25,),
          ),
          ListTile(
            title: Text("Rate us", style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.star, size: 25,),
          ),
          ListTile(
            title: Text("Feedback", style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.feedback, size: 25,),
          ),
          ListTile(
            title: Text("Privacy policy", style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.security, size: 25,),
          ),
          Divider(thickness: 2, endIndent: 30, indent: 30,),
          Text("Version 2.3.0", style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
