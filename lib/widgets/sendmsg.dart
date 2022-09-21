// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class SendMsg extends StatefulWidget {
//   const SendMsg({Key? key}) : super(key: key);
//   // String? send_txt;
//   // String? send_time;
//   // SendMsg()

 

// class _SendMsgState extends State<SendMsg> {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width - 10,
//           minWidth: 150,
//         ),
//         child: Card(
//           elevation: 1,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
//         ),
//       ),
//     );
//   }
// }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SendMessage extends StatefulWidget {
    
  String? send_txt;
  String? send_time;
  bool IsRead;
 SendMessage({required this.send_time,required this.send_txt,required this.IsRead});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 10,
          minWidth: 150,
        ),
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              color: Color(0xffdcf8c6),
              child: Stack(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 10,right: 26,top: 5,bottom: 18),
                  child: Text(
                    widget.send_txt!,
                    style: TextStyle(fontSize: 16,),
                  ),),
                  Positioned(
                    bottom: 4,
                    right: 10,

                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 6.0),
                        child: Text(widget.send_time!,style: TextStyle(color: Colors.grey),),),
                        SizedBox(
                          width: 6,
                        ),
                        //Icon(Icons.done_all,
                       // size: 20,

                       Icon(Icons.done_all,color: widget.IsRead? Colors.blue:Colors.grey,)
                        // widget.IsRead == true ?
                        // Icon(Icons.done_all,color: Colors.blue,size: 20,):Icon(Icons.done_all,size: 20,)
                      //  color: Colors.blue,)
                      ],
                    ))
                ],
              ),
        ),
      ),
    );
    
    
  }
}