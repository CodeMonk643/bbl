import 'package:bbl/colors.dart';
import 'package:bbl/screens/user/user_pass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSign extends StatefulWidget {
  const UserSign({Key? key}) : super(key: key);

  @override
  State<UserSign> createState() => _UserSignState();
}

class _UserSignState extends State<UserSign> {
  final formkey = GlobalKey<FormState>();
  var ph;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "Enter your\nPhone number",
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
                                onSaved: (value) {
                                  ph = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter valid phone number";
                                  }
                                  return null;
                                }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 295,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 287,
                          ),
                          TextButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  print("Phone: $ph");
                                  runApp(MaterialApp(
                                    home: Pass(),
                                    debugShowCheckedModeBanner: false,
                                    theme: ThemeData(
                                      primarySwatch: primSwat,
                                    ),
                                  ));
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
      ),
    );
  }
}
