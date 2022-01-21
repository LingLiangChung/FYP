import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobnow_users/constants.dart';

import 'employer_home.dart';
import 'login_page.dart';
import '../../models/jobs_model.dart';

Widget registerPosition(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Position',
        style: TextStyle(
          color: kTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey,
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
            hintText: 'Employer',
            hintStyle: TextStyle(
              color: Colors.black87
            )
          )
        ),
      )
    ],
  );
}


class UserRegister extends StatefulWidget {
  const UserRegister({ Key? key }) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}
class _UserRegisterState extends State<UserRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController nricController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'Sign Up',
                    style: TextStyle(
                      color: kTextColor,
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
                          color: kTextColor,
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
                        color: kTextColor,
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
                        color: kTextColor,
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
                        color: kTextColor,
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
                        color: kTextColor,
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
                        color: kTextColor,
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
                      register();
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: kApproveColor
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
      var response = await http.post(Uri.parse("http://192.168.0.136:8000/api/employer_register"),
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register Successful")));
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => Login()));
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
            builder: (context) => Login(),
          )
      );
    },
    child: RichText(
      text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),
            TextSpan(
                text: 'Sign in',
                style: TextStyle(
                    color: Colors.black87,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
            )
          ]
      ),
    ),
  );
}
