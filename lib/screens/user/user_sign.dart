import 'dart:convert';

import 'package:bbl/colors.dart';
import 'package:bbl/screens/user/schedule.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bbl/services/auth_model.dart';
import 'package:bbl/services/success_model.dart';

class UserSign extends StatefulWidget {
  const UserSign({Key? key}) : super(key: key);

  @override
  State<UserSign> createState() => _UserSignState();
}

class _UserSignState extends State<UserSign> {
  // Future<bool> onBackPressed() {
  //   return showDialog(context: context, builder: (context)=> AlertDialog(
  //     title: Text("Do you want to exit the app?"),
  //     actions: [
  //       TextButton(onPressed: () {
  //         Navigator.pop(context, false);
  //       }, child: Text("NO"))
  //     ],
  //   ));
  // }
  final formkey = GlobalKey<FormState>();
  final url = "http://8442-122-161-67-51.ngrok.io/api/user/login";

  void postData() async {
    try {
      final response = await post(Uri.parse(url),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(
              <String, String>{"phone": ph, "password": pass.toString()}));

      print(response.body);
      final resp = jsonDecode(response.body);
      // print(resp["success"]);
      // print(SuccessLog[0]);
      // print(resp["authtoken"]);
      if (resp["success"] == SuccessLog[0].success) {
        runApp(MaterialApp(
            home: Schedule(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: primSwat)));
        // print(auth_token.authtoken);
        auth_token.add(
          auth(authtoken: resp["authtoken"]),
        );
        for (var item in auth_token) {
          print(item.authtoken);
        }
      } else {
        print("Error! Please Enter correct details");
      }
    } catch (er) {}
  }

  var ph, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        "Enter your\ndetails",
                        style: GoogleFonts.montserrat(fontSize: 40),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter your phone number"),
                              onChanged: (value) {
                                ph = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Phone number cannot be empty";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter your password"),
                              obscureText: true,
                              onSaved: (value) {
                                pass = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                return null;
                              }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 177,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: 170),
                        TextButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                // print(ph);
                                postData();
                              }
                            },
                            child: Text(
                              "NEXT",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
