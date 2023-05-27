import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo.shade900,
        appBar: AppBar(
          title: const Text('Rock Paper Scissors'),
          backgroundColor: Colors.indigo.shade800,
        ),
        body: const GamePage(),
      ),
    ),
  );
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> images = ['paper_btn', 'rock_btn', 'scisor_btn'];

  late String name;
  late String robot;

  @override
  void initState() {
    name = images[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    robot = images[Random().nextInt(3)];
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      name = images[Random().nextInt(3)];
                    });
                  },
                  child: Image.asset('images/$name.png'),
                ),
              ),
              const Text(
                "vs",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Expanded(
                child: Image.asset('images/$robot.png'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "You",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "System",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
// 1-create list of icons
List<IconData> icons = [
    Icons.handshake,
    Icons.library_add_check,
    Icons.library_add
  ];

//to draw icon and convert map to list
  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons
                .asMap()
                .entries
                .map(
                  (MapEntry map) => buildIcon(map.key),
                )
                .toList(),
          ),
//to build icon
  Widget buildIcon(int index) {
    return Container(
      height: 40,
      width: 40,
      child: Icon(
        icons[index],
        size: 50,
      ),
    );
  }


void check(){
  if (name == images[0] && robot == images[0]) {
    print("$icons[0]");
  }else if(name == images[0] && robot == images[1]){
    print("$icons[1]");
  } if(name == images[0] && robot == images[2]){
    print("$icons[2]");
  }if(name == images[1] && robot == images[1]){
    print("$icons[0]");
  }
}

 */
