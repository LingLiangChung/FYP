import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/screens/employer/chat/screens/chat_page.dart';
import 'package:jobnow_users/screens/jobseeker/job_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'jobs/jobs.dart';
import 'jobseeker_login.dart';


Widget cardViewJob(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JobsPage(),
        )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.find_in_page,
            color: Colors.black,
            size: 100,
          ),
          Text('Find Job',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),              
    ),
  );
}

Widget cardWorkStatus(context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JobStatus(),
        )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book_online,
            color: Colors.black,
            size: 100,
          ),
          Text('Job Status Update',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),              
    ),
  );
}

Widget cardChat(context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChatPage(),
        )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            color: Colors.black,
            size: 100,
          ),
          Text('Conversation Room',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),              
    ),
  );
}

Widget cardLogout(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JobseekerLogin(),
        )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: Colors.black,
            size: 100,
          ),
          Text('Logout',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),              
    ),
  );
}

class JobseekerHome extends StatefulWidget {
  const JobseekerHome({ Key? key }) : super(key: key);

  @override
  State<JobseekerHome> createState() => _JobseekerHomeState();
}

class _JobseekerHomeState extends State<JobseekerHome> {

  int currentLoggedInUserID = 0;

  Future<void> getLoggedInUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userID = sharedPreferences.getInt("userID")!;

    setState(() {
      currentLoggedInUserID = userID;
    });

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DraggableHome(
        title: Text('Home'),
        headerExpandedHeight: .2,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: kAppbarColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ],
                  )
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 5,),
                    Text('Logout', style: TextStyle(fontSize: 18),),
                  ],
                ),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => JobseekerLogin(),
                      )
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: kBackgroundColor,
        headerWidget: Container(
          decoration: BoxDecoration(
            color: kAppbarColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Jobseeker',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),),
            ],
          ),
        ),
        body: [Container(
          width: size.width,
          height: size.height,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: cardViewJob(context),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: cardWorkStatus(context),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: cardChat(context),
              ),
            ],
          ),
        )]
    );
  }
}