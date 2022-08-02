import 'package:flutter/material.dart';
import 'package:flutter_application_9/views/login/login.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../style.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _secureText = true;
  bool _secureText1 = true;
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
                  child: SvgPicture.asset("assets/images/close.svg")),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: 1),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NEW PASSWORD",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              letterSpacing: 1),
                        ),
                        TextFormField(
                          //controller: passwordController,
                          //validator: validatepassword,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffAAAAAA))),
                            suffixIcon: Container(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _secureText = !_secureText;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    _secureText
                                        ? "assets/images/hide-grey.svg"
                                        : "assets/images/unhide-grey.svg",
                                    width: 12,
                                    height: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.text,
                          //obscureText: _secureText,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "CONFIRM PASSWORD",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              letterSpacing: 1),
                        ),
                        TextFormField(
                          //controller: passwordController,
                          //validator: validatepassword,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffAAAAAA))),
                            suffixIcon: Container(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _secureText1 = !_secureText1;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    _secureText1
                                        ? "assets/images/hide-grey.svg"
                                        : "assets/images/unhide-grey.svg",
                                    width: 12,
                                    height: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 350,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff3157F6),
                      minimumSize: const Size(370, 60),
                      textStyle: kBodyText,
                    ),
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginPage())));
                    }),
                    child: const Text("RESET PASSWORD"),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
