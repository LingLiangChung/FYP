import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:url_launcher/url_launcher.dart';

import 'confirm_payment.dart';

final String phoneNum = "123456789";

launchEmail() async {
  launch("mailto:jobseeker@gmail.com?subject=Job Application Approve&body=I am approve your job application%20plugin");
}
launchURL() async {
  launch("https://www.paypal.com/my/home");
  // const url = 'https://www.paypal.com/my/home';
  // if(await canLaunch(url)){
  //   await launch(url);
  // }else throw "Could not launch $url";
}

Widget cardPaypal(BuildContext context){
  return InkWell(
    onTap: (){
      launchURL();
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
            Icons.payment,
            color: Colors.black,
            size: 100,
          ),
          Text('Paypal'),
        ],
      ),
    ),
  );
}

Widget cardCash(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmPay(),
        ),
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
            Icons.money,
            color: Colors.black,
            size: 100,
          ),
          Text('Cash'),
        ],
      ),
    ),
  );
}


class MakePayment extends StatelessWidget {
  const MakePayment({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB47BC),
        title: Text('Pay Salary'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        cardPaypal(context),
                        cardCash(context),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmployerHome(),
                        ),
                      );
                    },
                    child: Text('Back to home',
                        style: TextStyle(
                            color: Colors.white
                        )),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFAB47BC),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}