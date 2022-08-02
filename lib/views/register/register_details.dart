import 'dart:async';
import 'dart:ui';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/views/login/pop_up.dart';
import 'package:flutter_application_9/views/register/set_password.dart';
import 'package:flutter_application_9/style.dart';
import 'package:flutter_application_9/views/login/success.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterDetailsPage extends StatefulWidget {
  const RegisterDetailsPage({super.key});

  @override
  State<RegisterDetailsPage> createState() => _RegisterDetailsPageState();
}

class _RegisterDetailsPageState extends State<RegisterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  "assets/images/close.svg",
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "serviceview.in/",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Corpfield",
                      style: TextStyle(
                        color: Color(0xff3157F6),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const DetailsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final countryPicker = const FlCountryCodePicker();
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "ORGANISATION NAME",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is Required";
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    nameController.text = value!;
                  });
                },
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffAAAAAA))),
                  suffix: Icon(
                    Icons.done,
                    color: Color(0xff2AC120),
                  ),
                ),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "CONTACT NUMBER",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: codeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is Required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(bottom: 0.0, top: 20.0),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffAAAAAA))),
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              //print("hai");
                              final code = await countryPicker.showPicker(
                                  context: context, isFullScreen: true);
                              //.then((value) => print("countrycode:$value"));
                              if (code != null) print(code.dialCode);
                              setState(() {
                                codeController.text = code!.dialCode;
                              });
                            },
                            child: Container(
                                child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SvgPicture.asset(
                                "assets/images/down-black.svg",
                                width: 10,
                                height: 10,
                              ),
                            )),
                          )),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.none,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is Required";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          phoneController.text = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(height: 0.7),
                        contentPadding:
                            const EdgeInsets.only(bottom: 15, top: 20.0),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffAAAAAA))),
                        suffix: Icon(
                          Icons.done,
                          color: Color(0xff2AC120),
                        ),
                      ),
                      //maxLength: 16,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "EMAIL",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is Required";
                  }
                  String pattern = r'\w+@\w+\.\w+';
                  if (!RegExp(pattern).hasMatch(value))
                    return 'Invalid E-mail Address format.';
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    emailController.text = value!;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffAAAAAA))),
                  suffix: InkWell(
                    child: Text(
                      "VERIFY",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3157F6),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff3157F6),
                        decorationThickness: 3.0,
                      ),
                    ),
                    onTap: () {
                      final snackBar = SnackBar(
                        content: Text(
                          "OTP sent to the registered mobile number",
                          style: kBodyText2,
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(seconds: 2, milliseconds: 500),
                        backgroundColor: Color(0xffF91C1C),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Timer(Duration(seconds: 3), () {
                        showBottomSheet(
                            context: context,
                            builder: ((context) {
                              return BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: OtpBottomSheet());
                            }));
                      });
                    },
                  ),
                ),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xffFFFFFF),
              side: BorderSide(color: Color(0xff00000029), width: 2),
              minimumSize: Size(370, 60),
            ),
            onPressed: (() {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SetPasswordPage())))
                    .then((value) {
                  if (value == true) {
                    setState(() {
                      enable = value;
                    });
                  }
                });
                print("Verified.");
              }
            }),
            child: ListTile(
              title: const Text(
                "Set Password",
                style: TextStyle(
                  color: Color(0xff3157F6),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: SvgPicture.asset("assets/images/lock.svg"),
              trailing: SvgPicture.asset("assets/images/arrow.svg"),
            ),
          ),
        ]),
        const SizedBox(
          height: 150,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xffFFFFFF),
                  backgroundColor: const Color(0xff3157F6),
                  minimumSize: const Size(370, 60),
                  textStyle: kBodyText,
                ),
                onPressed: (() {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const RegistrationSuccess())));
                    print("form submitted.");
                  }
                }),
                child: const Text("COMPLETE"),
              ),
            )
          ],
        ),
      ],
    );
  }

  // String? emailvalidator(value) {
  //   if (value == null) {
  //     return "Please Enter Email";
  //   }
  //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
  //     return "Enter Valid Email";
  //   }
  //   return null;
  // }
}
