import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:http/http.dart' as http;

class CreateJob extends StatefulWidget {
  const CreateJob({ Key? key }) : super(key: key);

  @override
  _CreateJobState createState() => _CreateJobState();
}


class _CreateJobState extends State<CreateJob>{
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController jobStatusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text('Create Job'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kBackgroundColor,
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Title',
                          style: TextStyle(
                            color: Colors.black87,
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
                                offset: Offset(2,3),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                            controller: titleController,
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.work,
                                  color: Colors.black87
                              ),
                              hintText: 'Job Title',
                              hintStyle: TextStyle(
                                  color: Colors.black38
                              )
                            )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Content',
                          style: TextStyle(
                            color: Colors.black87,
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
                                offset: Offset(2,3),
                              ),
                            ],
                          ),
                          height: 90,
                          child: TextField(
                            maxLines: 10,
                              controller: contentController,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.text_fields,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Job Content',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Salary',
                          style: TextStyle(
                            color: Colors.black87,
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
                                offset: Offset(2,3),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              keyboardType: TextInputType.number,
                              controller: salaryController,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.attach_money,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Job Salary',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Start Date',
                          style: TextStyle(
                            color: Colors.black87,
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
                                offset: Offset(2,3),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              keyboardType: TextInputType.name,
                              controller: startDateController,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.date_range_outlined,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Eg. 09/09/2021',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job End Date',
                          style: TextStyle(
                            color: Colors.black87,
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
                                offset: Offset(2,3),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              keyboardType: TextInputType.name,
                              controller: endDateController,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.date_range_outlined,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Eg. 09/09/2021',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Start Time',
                          style: TextStyle(
                            color: Colors.black87,
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
                                offset: Offset(2,3),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              keyboardType: TextInputType.name,
                              controller: startTimeController,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.timelapse,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Eg.04:00',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Status',
                          style: TextStyle(
                            color: Colors.black87,
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
                                offset: Offset(2,3),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                              keyboardType: TextInputType.text,
                              controller: jobStatusController,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.timelapse,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Pending',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    TextButton(
                      onPressed: () async {
                        createJob();
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        elevation: 5,
                        backgroundColor: kApproveColor,
                      ),
                      child: Center(
                        child: Text(
                          "Create",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ], 
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> createJob() async {
    if(titleController.text.isNotEmpty &&
        contentController.text.isNotEmpty &&
        salaryController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        startTimeController.text.isNotEmpty &&
        jobStatusController.text.isNotEmpty
    ){
      var response = await http.post(Uri.parse("http://192.168.0.136:8000/api/createJob"),
          body: ({
            'job_title':titleController.text,
            'job_content':contentController.text,
            'total_payment':salaryController.text,
            'startDate_at':startDateController.text,
            'endDate_at':endDateController.text,
            'startTime_at':startTimeController.text,
            'job_status':jobStatusController.text
          }));
      print(response.body);
      if(response.statusCode==201){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => EmployerHome()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:
            Text("Invalid Credentials")));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Fields Not Allowed")));
    }
  }
}