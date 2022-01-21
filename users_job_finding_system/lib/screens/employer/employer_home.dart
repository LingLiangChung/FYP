import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/screens/employer/job/check_job_status.dart';
import 'package:jobnow_users/screens/employer/job/manage_jobs.dart';
import 'package:jobnow_users/screens/employer/search_jobseeker/jobseekers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat/screens/chat_page.dart';
import 'login_page.dart';
import 'job/create_job.dart';

Widget cardCreateJob(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CreateJob(),
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
            Icons.library_add_outlined,
            size: 100,
          ),
          Text('Create Job',
          style: TextStyle(
            fontSize: 16,
              fontWeight: FontWeight.bold,
          ),),
        ],
      ),              
    ),
  );
}

Widget cardManageJobs(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ManageJob(),
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
            Icons.work,
            color: Colors.black,
            size: 100,
          ),
          Text('Manage Jobs',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),              
    ),
  );
}

Widget cardWorkStatus(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CheckJobStatus(),
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
          Text('Check Job Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),              
    ),
  );
}

Widget cardSearch(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JobseekerPage(),
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
            Icons.search,
            color: Colors.black,
            size: 100,
          ),
          Text('Search Jobseekers',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),              
    ),
  );
}

Widget cardChat(BuildContext context){
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
          builder: (context) => Login(),
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

class EmployerHome extends StatefulWidget {
  @override
  State<EmployerHome> createState() => _EmployerHomeState();
}

class _EmployerHomeState extends State<EmployerHome> {

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
    Size size = MediaQuery.of(context).size;
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
                        builder: (context) => Login(),
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
              Text('Welcome Employer',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),),
            ],
          ),
        ),
        body: [
          Container(
            width: size.width,
            height: size.height,
              child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: cardCreateJob(context),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: cardManageJobs(context),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: cardWorkStatus(context),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: cardSearch(context),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: cardChat(context),
                    ),
                  ]
              )
          )
        ]);

    //   Scaffold(
    //   appBar: AppBar(
    //       title: Text('Welcome Employer'),
    //     backgroundColor: kAppbarColor,
    //     toolbarHeight: 80,
    //   ),
    //   backgroundColor: kBackgroundColor,
    //   drawer: Drawer(
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: [
    //         DrawerHeader(
    //             decoration: BoxDecoration(
    //               color: kAppbarColor,
    //             ),
    //           child: Text('Drawer'),
    //         ),
    //         ListTile(
    //           title: Text('User'),
    //           onTap: (){
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           title: Text('Logout'),
    //           onTap: (){
    //             Navigator.of(context).push(
    //                 MaterialPageRoute(
    //                   builder: (context) => Login(),
    //                 )
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    //   body: Stack(
    //     children: [
    //       SafeArea(
    //         child: Padding(
    //           padding: EdgeInsets.all(16.0),
    //           child: Column(
    //         children: [
    //           Expanded(
    //             child: GridView.count(
    //               mainAxisSpacing: 10,
    //               crossAxisSpacing: 10,
    //               crossAxisCount: 2,
    //               children: [
    //                 cardCreateJob(context),
    //                 cardManageJobs(context),
    //                 cardWorkStatus(context),
    //                 cardSearch(context),
    //                 cardChat(context),
    //                 cardLogout(context)
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //         ),
    //     ),
    //   ],
    //   ),
    // );
  }
}