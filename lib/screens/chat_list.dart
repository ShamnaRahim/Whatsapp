import 'package:flutter/material.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/widgets/chat_tile.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<User> chatlist = [
    User(
        avatar: "",
       // avatar: '../../Assets/Images/haFIS.jpg',
        name: "Hafis",
        isGroup: false,
        updatedAt: '10:00 am',
        message: 'good mrng'),
    User(
        avatar: "",
        name: "Naseeba",
        isGroup: false,
        updatedAt: '10:00 am',
        message: 'hello'),
    User(
        avatar:
            "https://greatloveart.com/wp-content/uploads/2021/06/Best-whatsapp-dp-5.jpg",
        name: "shamna",
        isGroup: false,
        updatedAt: '10:00 am',
        message: 'gud mrng'),
    User(
        avatar: "",
        name: "Flutter",
        isGroup: true,
        updatedAt: '10:00 am',
        message: 'gud mrng'),
    User(
        avatar:
            "https://greatloveart.com/wp-content/uploads/2021/06/Best-whatsapp-dp-5.jpg",
        name: "Flutter G1",
        isGroup: true,
        updatedAt: '10:00 am',
        message: 'gud mrng'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child:const SizedBox(
            height: 150,
            child: Icon(
              Icons.chat,
            )),
      ),
      body: ListView.builder(
        itemCount: chatlist.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatTile(data: chatlist[index]);
        },
      ),
    );
  }
}
