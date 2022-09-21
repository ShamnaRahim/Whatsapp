import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/CallList.dart';

class CallTile extends StatefulWidget {
 
  CallTile({Key? key,required this.call }) : super(key: key);
  CallList call;

  @override
  State<CallTile> createState() => _CallTileState();
}

class _CallTileState extends State<CallTile> {
  
  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(widget.call.name.toString()),
      subtitle: Text(widget.call.callTime.toString()),
      leading: CircleAvatar(
        backgroundImage:NetworkImage(widget.call.avatar.toString()) ,
      ),
      trailing:widget.call.icon == 'Audio' ? 
      Icon(Icons.call_made_rounded) : Icon(Icons.video_call)
      ,
      
    );
    
  }
}