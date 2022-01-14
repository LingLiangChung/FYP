import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobnow_version_1/screens/admin/home/components/admin_login.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/jobs.dart';
import 'package:jobnow_version_1/screens/admin/home/components/user/jobseeker.dart';
import 'employer/employers.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                child:
                    CircleAvatar(
                      radius: 99,
                      backgroundColor: Colors.grey,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(6, 9, 9, 9),
                        child: ClipOval(
                          child: Icon(
                              Icons.person,
                            size: 150,
                            color: Colors.black,
                          )
                        ),
                      ),
                    ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius: new BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          'Welcome Admin',
                            style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 200,
                child:
                Center(
                  child: TextButton(
                    child: Text('Logout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      decoration: TextDecoration.underline
                    ),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AdminLogin(),
                          )
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
      ),
      backgroundColor: Color(0xFFEFEBE9),
      bottomNavigationBar: Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              //display jobs that need verify
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobsPage(),
                  )
              );
            },
            child: Ink(
              height: 60,
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                color: Color(0xFF424242),
              ),
              child: Icon(Icons.work, color: Colors.white,),
            ),
          ),
          InkWell(
            onTap: (){
              //display jobs that need verify
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobseekerPage(),
                  )
              );
            },
            child: Ink(
              height: 60,
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                color: Color(0xFF424242),
              ),
              child: Icon(Icons.supervised_user_circle, color: Colors.white,),
            ),
          ),
          InkWell(
            onTap: (){
              //display jobs that need verify
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmployerPage(),
                  )
              );
            },
            child: Ink(
              height: 60,
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                color: Color(0xFF424242),
              ),
              child: Icon(Icons.supervised_user_circle_outlined, color: Colors.white,),
            ),
          ),

        ],
      ),
    );
  }
}
AppBar buildAppBar(){
  return AppBar(
    elevation: 4,
    title: Text('Admin Page', style: TextStyle(fontSize: 24),),
    centerTitle: true,
    backgroundColor: Color(0xFF424242),
    automaticallyImplyLeading: false,
  );
}
