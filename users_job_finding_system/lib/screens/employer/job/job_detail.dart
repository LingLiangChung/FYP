import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:jobnow_users/screens/jobseeker/job_details.dart';
import 'package:jobnow_users/services/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'add_jobseeker.dart';

class JobsDetail extends StatefulWidget {
  final JobsModel job;
  JobsDetail({required this.job});

  @override
  State<JobsDetail> createState() => _JobsDetailState();
}

class _JobsDetailState extends State<JobsDetail> {

  TextEditingController txt = TextEditingController();
  final HttpService httpService = HttpService();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobContentController = TextEditingController();
  TextEditingController totalPaymentController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController jobStatusController = TextEditingController();
  final String jobsURL = "http://192.168.0.136:8000/api/all_jobs";
  
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   txt = TextEditingController(text: widget.job.jobTitle);
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   txt.dispose();
  //   super.dispose();
  // }

  Future passData(String title, String content, int payment, String sDate, String eDate, String sTime, String status, int id) async {
    var response = await http.post(Uri.parse("$jobsURL/$id"),
    body: {
      'job_title' : title,
      'job_content' : content,
      'total_payment' : payment,
      'startDate_at' : sDate,
      'endDate_at' : eDate,
      'startTime_at' : sTime,
      'job_status' : status,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: kAppbarColor,
          title: Text('Job Details', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                      // onSubmitted: (newValue){
                      //   setState(() {
                      //     txt = newValue as TextEditingController;
                      //   });
                      // },
                      controller: jobTitleController,
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
                            hintText: widget.job.jobTitle,
                            hintStyle: TextStyle(
                                color: Colors.black87
                            )
                        ),
                    ),
                    )
                    ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                      height: 60,
                      child: TextField(
                        controller: jobContentController,
                        minLines: 3,
                          maxLines: 5,
                          keyboardType: TextInputType.name,
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
                              hintText: widget.job.jobContent,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                        controller: totalPaymentController,
                          keyboardType: TextInputType.name,
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
                              hintText: widget.job.totalPayment.toString(),
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                        controller: startDateController,
                          keyboardType: TextInputType.name,
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
                              hintText: widget.job.startDateAt,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                        controller: endDateController,
                          keyboardType: TextInputType.name,
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
                              hintText: widget.job.endDateAt,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                        controller: startTimeController,
                          keyboardType: TextInputType.name,
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
                              hintText: widget.job.startTimeAt,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                          controller: jobStatusController,
                          keyboardType: TextInputType.name,
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
                              hintText: widget.job.startTimeAt,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddJobseeker(),
                          ),
                        );
                      },
                      child: Text('Add Jobseeker',
                          style: TextStyle(
                              color: Colors.black
                          )),
                      style: TextButton.styleFrom(
                          backgroundColor: kApproveColor
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: () {
                        // var title = jobTitleController.text;
                        // var content = jobContentController.text;
                        // var payment = int.parse(totalPaymentController.text);
                        // var sDate = startDateController.text;
                        // var eDate = endDateController.text;
                        // var sTime = startTimeController.text;
                        // var status = jobStatusController.text;
                        // var id = 1;
                        // var response = passData(title, content, payment, sDate, eDate, sTime, status, id);
                        //
                        // if(jobTitleController.text.isNotEmpty && jobContentController.text.isNotEmpty){
                        //   // if(response.statusCode==201){
                        //   //   sharedPreferences.setInt("userID", authReceiver.jobseeker!.id!);
                        //   // }
                        // }

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Job Information Edited")));
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EmployerHome(),

                          ),
                        );
                      },
                      child: Text('Edit',
                          style: TextStyle(
                              color: Colors.black87
                          )),
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFFF176)
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: () async {
                        await httpService.deleteJob(widget.job.id);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Job Deleted !")));
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EmployerHome(),
                          ),
                        );
                      },
                      child: Text('Delete',
                          style: TextStyle(
                              color: Colors.black
                          )),
                      style: TextButton.styleFrom(
                          backgroundColor: kRejectColor
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      backgroundColor: kBackgroundColor,
    );
  }
}

