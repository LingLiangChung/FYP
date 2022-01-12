import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobnow_version_1/screens/admin/home/components/body.dart';
import 'package:jobnow_version_1/screens/loading/splash.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin>{
  var nameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 120,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Admin Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height: 60,
                    ),
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
                          )
                        ]
                      ),
                      height: 60,
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.black87
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black87,
                            ),
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              color: Colors.black38
                            )
                          ),
                        ),
                    ),
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
                          )
                        ]
                      ),
                      height: 60,
                      child: TextFormField(
                        controller: passController,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.black87
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black87,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.black38
                            )
                          ),
                        ),
                    ),
                    
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          login();
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
  Future<void> login() async {
    if(passController.text.isNotEmpty && nameController.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://192.168.0.136:8000/api/admin_login"),
          body: ({
            'name':nameController.text,
            'password':passController.text,
          }));
      if(response.statusCode==201){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => Splash()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:
            Text("Invalid Credentials")));

      }
    } else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Fields Not Allowed")));
    }
  }
}