import 'dart:convert';
import 'dart:ffi';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.avatar,
        this.name,
        this.isGroup,
        this.updatedAt,
        this.message,
    });

    String? avatar;
    String? name;
    bool? isGroup;
    String? updatedAt;
    String? message;

    factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json["avatar"],
        name: json["name"],
        isGroup: json["IsGroup"],
        updatedAt: json["UpdatedAt"],
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "IsGroup": isGroup,
        "UpdatedAt": updatedAt,
        "Message": message,
    };
}
