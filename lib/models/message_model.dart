import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
    Message({
        this.message,
        this.time,
        this.isSend,
        this.isReaded
    });

    String? message;
    String? time;
    bool? isSend;
    bool? isReaded;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["Message"],
        time: json["Time"],
        isSend: json["IsSend"],
        isReaded: json["IsReaded"],
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Time": time,
        "IsSend": isSend,
        "isReaded": isReaded,
    };
}