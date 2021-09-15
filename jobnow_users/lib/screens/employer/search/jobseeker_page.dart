import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobnow_users/screens/employer/search/jobseeker_list_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(JobseekerList());
}

class JobseekerList extends StatelessWidget {
  static final String title = 'Filter & Search Jobseeker';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JobseekerListPage(),
    );
  }
}