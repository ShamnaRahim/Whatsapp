import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/screens/chat_detailsscreen.dart';

class ChatTile extends StatefulWidget {
  ChatTile({required this.data});
  User data; //object of user class

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetail(
              details: widget.data,
            ),
          )),
      child: ListTile(
        title: Text(widget.data.name.toString()),
        subtitle: Row(
          children: [
            Icon(
              Icons.done_all,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                widget.data.message.toString(),
              ),
            )
          ],
        ),
        leading: CircleAvatar(
          // backgroundImage:
          backgroundImage: NetworkImage(
            //  widget.data.avatar =="" && widget.data.isGroup == true ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo':widget.data.avatar.toString(),
            widget.data.avatar == ''
                ? //to get the secnd class in statefull widget
                widget.data.isGroup == true
                    ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                    : 'https://www.meme-arsenal.com/memes/b6a18f0ffd345b22cd219ef0e73ea5fe.jpg'
                : widget.data.avatar.toString(),
          ),
          radius: 20,
        ),
        trailing: Text(widget.data.updatedAt.toString()),
      ),
    );
  }
}
