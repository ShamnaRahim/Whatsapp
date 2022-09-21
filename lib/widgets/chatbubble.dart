import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/message_model.dart';

class chatbubble extends StatefulWidget {
  chatbubble({required this.message});

  @override
  State<chatbubble> createState() => _chatbubbleState();
  Message message;
}

class _chatbubbleState extends State<chatbubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.message.isSend! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 10,
          minWidth: 150,
        ),
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 26, top: 5, bottom: 18),
                child: Text(
                  widget.message.message!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6.0),
                        child: Text(
                          widget.message.time!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      widget.message.isReaded!
                          ? Icon(
                              Icons.done_all,
                              color: Colors.blue,
                            )
                          : SizedBox()
                      //Icon(Icons.done_all,
                      //size: 20,
                      // color: Colors.blue,)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
