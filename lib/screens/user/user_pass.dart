import 'package:bbl/screens/user/schedule.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bbl/colors.dart';

class Pass extends StatefulWidget {
  const Pass({ Key? key }) : super(key: key);

  @override
  State<Pass> createState() => _PassState();
}

class _PassState extends State<Pass> {
  final formkey = GlobalKey<FormState>();
  var pass;
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
                          "Enter your\nPassword",
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
                                    labelText: "Enter your password"),
                                onSaved: (value) {
                                  pass = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is not valid";
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
                                  print("Password: $pass");
                                  runApp(MaterialApp(
                                    home: Schedule(),
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
