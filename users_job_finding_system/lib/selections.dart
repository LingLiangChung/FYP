import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/screens/employer/register_page.dart';
import 'package:jobnow_users/screens/jobseeker/jobseeker_register.dart';

class SelectPosition extends StatelessWidget {
  const SelectPosition({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kBackgroundColor,
                    kBackgroundColor,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 180,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, what you want to be ?',
                      style: TextStyle(
                      color: kTextColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 80),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserRegister(),
                            )
                          );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      backgroundColor: kAppbarColor,
                      ),
                      child:  Text(
                        'Employer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('OR',
                      style: TextStyle(
                          color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => JobseekerRegister(),
                          )
                        );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      backgroundColor: kAppbarColor
                      ),
                      child:  Text(
                        'Jobseeker',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}