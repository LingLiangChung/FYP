import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/models/employer_model.dart';
import 'package:jobnow_users/screens/employer/chat_room.dart';
import 'package:jobnow_users/screens/employer/job/check_job_status.dart';
import 'package:jobnow_users/screens/employer/job/manage_jobs.dart';
import 'package:jobnow_users/screens/employer/search_jobseeker/jobseekers.dart';
import 'login_page.dart';
import 'job/create_job.dart';

class NavigationItem {

  String title;

  NavigationItem(this.title);

}
List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem("Jobs"),
    NavigationItem("Applications"),
  ];
}

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
          builder: (context) => EmployerChatRoom(),
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
  List<NavigationItem> navigationItems = getNavigationItemList();

  late NavigationItem selectedItem;

  late Widget currentWidgetView;

  late final EmployerModel employer;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
      currentWidgetView = EmployerHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kBackgroundColor
                ]
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
            children: [
              Container(
                height: 64,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 16,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Employer',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    cardCreateJob(context),
                    cardManageJobs(context),
                    cardWorkStatus(context),
                    cardSearch(context),
                    cardChat(context),
                    cardLogout(context)
                  ],
                ),
              ),
            ],
          ),
            ),
        ),
      ],
      ),
      backgroundColor: kBackgroundColor,
      // bottomNavigationBar: Container(
      //   height: 80,
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30),
      //       topRight: Radius.circular(30),
      //     ),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: buildNavigationItems(),
      //   ),
      // ),
    );
  }

  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (item.title){
            case "Jobs": currentWidgetView = ManageJob(); break;
            case "Applications": currentWidgetView = EmployerChatRoom(); break;
          }
          selectedItem = item;
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: selectedItem == item ? 1.0 : 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            selectedItem == item
            ? Column(
              children: <Widget>[

                const SizedBox(
                  height: 4,
                ),

                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
            : Container(),
          ],
        ),
      ),
    );
  }
}