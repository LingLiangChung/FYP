import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:jobnow_users/screens/jobseeker/jobseeker_home.dart';

Widget jobTitle(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Job Title',
        style: TextStyle(
          color: Colors.black,
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
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xff5ac18e)
            ),
            hintText: 'Job Title',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          )
        ),
      )
    ],
  );
}

Widget jobContent(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Job Content',
        style: TextStyle(
          color: Colors.black,
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
        height: 200,
        child: TextFormField(
          minLines: 2,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.text_fields,
              color: Color(0xff5ac18e)
            ),
            hintText: 'Job Content',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          )
        ),
      )
    ],
  );
}

Widget jobSalary(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Job Salary',
        style: TextStyle(
          color: Colors.black,
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
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.money,
              color: Color(0xff5ac18e)
            ),
            hintText: 'Job Salary',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          )
        ),
      )
    ],
  );
}

Widget jobEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Employer Email',
        style: TextStyle(
          color: Colors.black,
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
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff5ac18e)
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          )
        ),
      )
    ],
  );
}

Widget jobContact(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Employer Contact Number',
        style: TextStyle(
          color: Colors.black,
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
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.phone,
              color: Color(0xff5ac18e)
            ),
            hintText: 'Employer Contact Number',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          )
        ),
      )
    ],
  );
}

Widget jobDate(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Job Date',
        style: TextStyle(
          color: Colors.black,
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
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xff5ac18e)
            ),
            hintText: 'DD/MM/YYYY Eg. 02/02/1999',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          )
        ),
      )
    ],
  );
}

Widget jobTime(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Job Date',
        style: TextStyle(
          color: Colors.black,
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
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xff5ac18e)
            ),
            hintText: 'HH:MM to HH:MM Eg.04:00 to 05:00',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          )
        ),
      )
    ],
  );
}

Widget contactEmployerBtn(BuildContext context){
  return TextButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JobseekerHome(),
        )
      );
    },
    style: TextButton.styleFrom(
      primary: Colors.black,
      elevation: 5,
      backgroundColor: Colors.lightBlueAccent,
    ),
    child: Center(
      child: Text(
        "Take This Job",
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class JobDetails extends StatelessWidget {
  const JobDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Job Details'),
        centerTitle: true,
      ),
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    jobTitle(),
                    SizedBox(height: 10,),
                    jobContent(),
                    SizedBox(height: 10,),
                    jobSalary(),
                    SizedBox(height: 10,),
                    jobDate(),
                    SizedBox(height: 10,),
                    jobTime(),
                    SizedBox(height: 10,),
                    jobContact(),
                    SizedBox(height: 10,),
                    jobEmail(),
                    SizedBox(height: 10,),
                    contactEmployerBtn(context),
                  ], 
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}