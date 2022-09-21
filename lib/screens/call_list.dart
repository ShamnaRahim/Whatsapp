import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/CallList.dart';
import 'package:whatsapp/widgets/call_tile.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  List<CallList> callList = [
    CallList(
      avatar:
          "https://th.bing.com/th/id/R.8df0774b0124e90c8d3c595acd16680a?rik=wdAjIz%2fPWzNwMQ&riu=http%3a%2f%2fwww.goodmorningimageshddownload.com%2fwp-content%2fuploads%2f2020%2f04%2fCute-Whatsapp-Dp-Images-2.jpg&ehk=q8hqKKIZlxLfN0Qe%2fKx3Iy6j1VnHQMH0HhshJ%2fBKAok%3d&risl=&pid=ImgRaw&r=0",
      name: 'Hafis',
      callTime: '2:30 PM',
      callType: 'Incoming',
      icon: 'Audio',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: callList.length,

        itemBuilder: (BuildContext context, int index) {
          return CallTile(call: callList[index]) ;
        },
      ),
    );
  }
}
