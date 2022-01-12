import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'jobseeker_login.dart';

Widget registerPosition(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Position',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color(0xFFFFCDD2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2),
            ),
          ],
        ),
        height: 60,
        child: TextField(
            enabled: false,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black87
                ),
                hintText: 'Jobseeker',
                hintStyle: TextStyle(
                    color: Colors.black87
                )
            )
        ),
      )
    ],
  );
}


class JobseekerRegister extends StatefulWidget {
  const JobseekerRegister({ Key? key }) : super(key: key);

  @override
  _JobseekerRegisterState createState() => _JobseekerRegisterState();
}
class _JobseekerRegisterState extends State<JobseekerRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController nricController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    Color(0xFFAB47BC),
                    Color(0xFFE1BEE7),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 50),
                    // username
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    // email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    // phone num
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              controller: contactController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    // NRIC
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IC Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              controller: nricController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: Colors.black87
                                  ),
                                  hintText: 'IC Number',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    // Pass
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              controller: passController,
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    // Re-pass
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password Confirmation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              controller: repassController,
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    registerPosition(),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // register();
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => JobseekerLogin(),
                            )
                        );
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Color(0xFFAB47BC)
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    buildSignInBtn(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> register() async{
    if(nameController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        nricController.text.isNotEmpty &&
        repassController.text.isNotEmpty &&
        contactController.text.isNotEmpty
    ){
      var response = await http.post(Uri.parse("http://192.168.0.136:8000/api/jobseeker_register"),
          body: ({
            'name':nameController.text,
            'password':passController.text,
            'email':emailController.text,
            'nric':nricController.text,
            'password_confirmation':repassController.text,
            'contact_number': contactController.text
          }));
      print(response.body);
      if(response.statusCode==201){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => JobseekerLogin()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:
            Text("Invalid Credentials")));
      }
    }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Fields Not Allowed")));
    }
  }
}


Widget buildSignInBtn(BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobseekerLogin(),
          )
      );
    },
    child: RichText(
      text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),
            TextSpan(
                text: 'Sign in',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
            )
          ]
      ),
    ),
  );
}

