import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobnow_users/screens/employer/chat/models/chat.dart';
import 'package:jobnow_users/screens/employer/chat/models/user.dart';

Future<List<User>> getAllUser(int loginUserId) async {
  String stringUrl = "http://192.168.0.136:8000/api/getAllUser";
  Uri url = Uri.parse(stringUrl);
  var response = await http.post(
    url,
    body: {
      'loggedInUserId' : loginUserId.toString(),
    },
    headers: {
      'Accept' : 'application/json',
    },
  );

  List<User> userList = [];
  if(response.statusCode == 200){
    var json = jsonDecode(response.body);
    userList = (json as List).map((e) => User.fromJson(e)).toList();

    return userList;
  }else{
    return userList;
  }
}

void sendMessage(int loginUserId, int receiverUserID, String textMessage) async {
  String stringUrl = "http://192.168.0.136:8000/api/chat/sendMessage";
  Uri url = Uri.parse(stringUrl);
  var response = await http.post(
    url,
    body: {
      'senderUserID' : loginUserId.toString(), // to set current logged in user
      'receiverUserID' : receiverUserID.toString(),
      'chatMessage' : textMessage,
    },
    headers: {
      'Accept' : 'application/json',
    },
  );

  print(response.body);
}

Future<List<Chat>> getChatUser(int loginUserId, int receiverUserID) async {
  String stringUrl = "http://192.168.0.136:8000/api/chat/getUserChat";
  Uri url = Uri.parse(stringUrl);
  var response = await http.post(
    url,
    body: {
      'senderUserID' : loginUserId.toString(), // to set current logged in user
      'receiverUserID' : receiverUserID.toString(),
    },
    headers: {
      'Accept' : 'application/json',
    },
  );

  List<Chat> chatList = [];
  if(response.statusCode == 200){
    var json = jsonDecode(response.body);
    chatList = (json as List).map((e) => Chat.fromJson(e)).toList();

    return chatList;
  }else{
    return chatList;
  }
}
