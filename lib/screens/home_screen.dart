import 'package:flutter/material.dart';
import 'package:whatsapp/models/CallList.dart';
import 'package:whatsapp/screens/call_list.dart';
import 'package:whatsapp/screens/camera.dart';
import 'package:whatsapp/screens/chat_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //to provide animation
  late TabController _tb;

  @override
  void initState() {
    super.initState();
    _tb = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            const Tab(
              icon: Icon(
                Icons.camera_alt,
              ),
            ),
            const Tab(
              text: 'CHATS',
            ),
            const Tab(
              text: 'STATUS',
            ),
            const Tab(
              text: 'CALLS',
            ),
          ],
          controller: _tb,
        ),
        title: Text(
          'Whatsapp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          SizedBox(
            width: 30,
            child: PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('New group'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('New broadcast'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('Linked devices'),
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text('starred messages'),
                  value: 4,
                ),
                PopupMenuItem(
                  child: Text('Payments'),
                  value: 5,
                ),
                PopupMenuItem(
                  child: Text('Settings'),
                  value: 6,
                ),
              ];
            }),
          )
        ],
      ),
      body: TabBarView(
        children: [CameraScreen(),
         ChatList(),
          Text('Status'),
           Call()],
        controller: _tb,
      ),
    );
  }
}
