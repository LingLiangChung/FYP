// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
//
// class CallApi {
//   final String url = "http://192.168.0.136:8000/api/";
//
//   postData(data, apiUrl) async{
//     var fullUrl = url+apiUrl;
//     return await http.post(
//       Uri.parse(fullUrl),
//       body: jsonEncode(data),
//       headers: setHeaders(),
//     );
//   }
//
//   setHeaders()=>{
//     'Content-type':'application/json',
//     'Accept':'application/json',
//   };
// }