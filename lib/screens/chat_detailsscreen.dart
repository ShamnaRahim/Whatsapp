import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/message_model.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/widgets/chatbubble.dart';
import 'package:whatsapp/widgets/sendmsg.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({Key? key, required this.details}) : super(key: key);
  User details;
  TextEditingController _msg_ctrlr = TextEditingController();

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  bool show_send = false;
  bool show_emoji = false;
  FocusNode focusnode =FocusNode(); //creating object for the classs focus node.

  List<Message> message_list = [
    Message(message: 'hello',time: '10:0',isSend: true,isReaded: true),
    Message(message: 'hai',time: '10:0',isSend: false,isReaded: false),
    Message(message: 'hai',time: '10:0',isSend: true,isReaded: true),
    Message(message: 'hai',time: '10:0',isSend: false,isReaded: false),
  ];    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leadingWidth: 80,
        titleSpacing: 0,
        leading: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: const Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              width: 3,
            ),
            // IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back),),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.details.avatar == ''
                    ? widget.details.isGroup == true
                        ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                        : 'https://www.meme-arsenal.com/memes/b6a18f0ffd345b22cd219ef0e73ea5fe.jpg'
                    : widget.details.avatar.toString(),
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.details.name.toString()),
            Text(
              'last seen ${widget.details.updatedAt.toString()}',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.video_call_rounded,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.call_end_rounded),
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text('View Contact')),
                PopupMenuItem(child: Text('Media,Links and docs')),
                PopupMenuItem(child: Text('search')),
                PopupMenuItem(child: Text('Mute notification')),
                PopupMenuItem(child: Text('Wallpaper')),
                PopupMenuItem(child: Text('More'))
              ];
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://th.bing.com/th/id/R.97c785aa9bd8dd3d153a67f1cdf2177d?rik=lCgDqeYwhe85eQ&riu=http%3a%2f%2fwallpapersdsc.net%2fwp-content%2fuploads%2f2016%2f09%2fWhite-Flower-HD-Background.jpg&ehk=RCAkiXfpsbMLISRyY6k3wLWDa7iljKKGbYPyjRKZkso%3d&risl=&pid=ImgRaw&r=0',
            ),
          ),
        ),
        child: Stack(
          children: [
            // ListView(
            //   children: [
            //     SendMessage(
            //       send_time: '3:0 pm',
            //       send_txt: 'hello',
            //       IsRead: true,
            //     ),
            //     SendMessage(
            //       send_time: '4:0pm',
            //       send_txt: 'good evng',
            //       IsRead: false,
            //     ),
            //     RecieveMsg(recieve_msg: 'hy', recieve_time: '3.6pm')
            //   ],
            // ),
            ListView.builder(itemCount: message_list.length,
              itemBuilder: (context, index) =>
                //  RecieveMsg(recieve_msg: 'hai', recieve_time: '10:00'),
                chatbubble(message: message_list[index])
            ),

            //itemCount: 10,
            //itemBuilder: (BuildContext context, int index) {
            // return Text('hello');
            // },

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Flexible(
                        child: TextField(
                          controller:widget._msg_ctrlr,
                      onTap: () {
                        //print('-------------------------------------');
                        // print(show_emoji);
                        if (show_emoji) {
                          focusnode.unfocus();
                        }
                      },
                      focusNode: focusnode,
                      onChanged: (value) {
                        print(value.length);
                        if (value.length > 0) {
                          setState(() {
                            show_send = true;
                          });
                        } else {
                          setState(() {
                            show_send = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        prefixIconColor: Colors.grey,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        hintText: 'message',
                        suffixIcon: showIcons(),
                        prefixIcon: IconButton(
                          onPressed: () {
                            focusnode.unfocus();
                            setState(() {
                              show_emoji = !show_emoji;
                            });
                            if (!show_emoji) {
                              focusnode.requestFocus();
                            }
                          },
                          icon: Icon(
                            show_emoji
                                ? (Icons.keyboard)
                                : Icons.emoji_emotions_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
                    //  FloatingActionButton(onPressed: (){},child: Icon(Icons.mic),)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: (){
                          print(widget._msg_ctrlr.text);
                         setState(() {
                            message_list.add(Message(message: widget._msg_ctrlr.text,isReaded: false,isSend: true,time: '2:00'));
                         });
                         widget._msg_ctrlr.clear();
                          print(message_list);

                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Icon(show_send ? Icons.send : Icons.mic),
                        ),
                      ),
                    )
                  ],
                ),
                show_emoji ? selectemoji() : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row showIcons() {
    if (show_send) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (builder) => menu());
                },
                icon: Icon(Icons.attach_file)),
          ]);
    } else {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => menu());
            },
            icon: Icon(Icons.attach_file)),
        SizedBox(
          width: 5,
        ),
        Icon(Icons.camera_alt)
      ]);
    }
  }

  Container menu() {
    return Container(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                      Icon(Icons.insert_drive_file), 'document', Colors.indigo),
                  iconWidget(Icon(Icons.camera_alt), 'Camera', Colors.pink),
                  iconWidget(
                      Icon(Icons.insert_photo), 'Gallery', Colors.purple),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(Icon(Icons.headset), 'Audio', Colors.orange),
                  iconWidget(Icon(Icons.location_pin), 'Location', Colors.teal),
                  iconWidget(Icon(Icons.contact_phone), 'Contact', Colors.blue)
                ],
              )
            ],
          ),
        ),
      ),
      height: 270,
      color: Colors.transparent,
    );
  }

  GestureDetector iconWidget(Icon icon, String text, Color color) {
    return GestureDetector(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: icon,
            radius: 30,
          ),
          Text(text)
        ],
      ),
    );
  }

  Widget selectemoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        widget._msg_ctrlr.text += emoji.emoji;
      },
    );
  }
}



 // List<Widget> showicons( bool wid ){
  //   List<Widget> iconlist = [];
  //   if(wid )
  //   {
  //     iconlist.add(Icon(Icons.attach_file));
  //   }
  //   else {
  //     iconlist.add(Icon(Icons.attach_file,color: Colors.black,));
  //     iconlist.add(Icon(Icons.camera_alt,color: Colors.black,));
  //   }
  //   return iconlist;

  // }