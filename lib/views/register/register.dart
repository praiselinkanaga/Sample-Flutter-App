import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_9/views/login/login.dart';
import 'package:flutter_application_9/views/register/register_details.dart';
import 'package:flutter_application_9/style.dart';
import 'package:flutter_application_9/widgets/background_image.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/leading.png',
            ),
          ),
        ),
        body: RegisterPageBody(),
      ),
    );
  }
}

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final domainNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          //key: scaffold_state,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Register",
                          style: kHeading,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "SELECT DOMAIN",
                          style: kBodyText1,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: domainNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Field is Required";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                domainNameController.text = value!;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: Text(
                                "serviceview.in/",
                                style: kBodyText2,
                              ),
                              suffix: Icon(
                                Icons.done,
                                color: Color(0xff2AC120),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            style: kBodyText1,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff3157F6),
                            minimumSize: Size(370, 60),
                            textStyle: kBodyText,
                          ),
                          onPressed: (() {
                            final snackBar = SnackBar(
                              content: Text(
                                "Yay! Your entered domain name is Available",
                                style: kBodyText2,
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 2, milliseconds: 500),
                              backgroundColor: Color(0xff2AC120),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Timer(Duration(seconds: 3), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const RegisterDetailsPage())));
                            });
                          }),
                          child: const Text(
                            "CHECK AVAILABILITY",
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: kBodyText1,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const LoginPage())));
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  decorationThickness: 2.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
