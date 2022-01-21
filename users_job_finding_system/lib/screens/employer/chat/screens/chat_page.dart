import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/screens/employer/chat/controller/chatController.dart';
import 'package:jobnow_users/screens/employer/chat/models/user.dart';
import 'package:jobnow_users/screens/employer/chat/widgets/conversation_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  Future<List<User>>? futureUserList;
  int currentLoggedInUserID = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInUserData().then((value) {
      getUser();
    });
  }

  Future<void> getLoggedInUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userID = sharedPreferences.getInt("userID")!;

    setState(() {
      currentLoggedInUserID = userID;
    });

  }

  Future<void> getUser() async {
    List<User> userList = await getAllUser(currentLoggedInUserID);
    setState(() {
      futureUserList = Future.value(userList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kAppbarColor,
        title: Text('Chat Room', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: FutureBuilder<List<User>>(
                future: futureUserList,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                        return ConversationList(userID: snapshot.data![index].id!, username: snapshot.data![index].name!, email: snapshot.data![index].email!,);
                      },
                    );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),backgroundColor: kBackgroundColor,
    );
  }
}
