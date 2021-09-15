import 'package:flutter/material.dart';

import '../../home_page.dart';


class ConfirmApply extends StatelessWidget {
  const ConfirmApply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB47BC),
        title: Text('Confirm Apply Job'),
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
                      crossAxisCount: 1,
                      children: [
                        payment(context),
                      ],
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
Widget payment(BuildContext context){
  return Card(
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
        Text('Are you sure to apply this job ?'),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobseekerHome(),
                  ),
                );
              },
              child: Text('Yes',
                  style: TextStyle(
                      color: Colors.white
                  )),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFAB47BC)
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobseekerHome(),
                  ),
                );
              },
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white
                  )),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red
              ),
            ),
          ],
        )

      ],
    ),
  );
}
