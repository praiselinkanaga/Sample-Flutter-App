import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/models/countrycode.dart' as country;
import 'package:flutter_application_9/views/login/forget_password.dart';
import 'package:flutter_application_9/views/register/register_details.dart';
import 'package:flutter_application_9/screens.dart/country_select.dart';
import 'package:flutter_application_9/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../views/home/home.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final countryPicker = const FlCountryCodePicker();
  bool _secureText = true;
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                "CONTACT NUMBER",
                style: kBodyText1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: codeController,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffix: Icon(
                          Icons.done,
                          color: Color(0xff2AC120),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            //print("hai");
                            final code = await countryPicker.showPicker(
                                context: context);
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
                                "assets/images/down-white.svg",
                                width: 10,
                                height: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      style: kBodyText1,
                      keyboardType: TextInputType.none,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: contactNumberController,
                      validator: validatecontact,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffix: Icon(
                          Icons.done,
                          color: Color(0xff2AC120),
                        ),
                      ),
                      //maxLength: 16,

                      style: kBodyText1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "PASSWORD",
                style: kBodyText1,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                validator: validatepassword,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
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
                              ? "assets/images/hide-white.svg"
                              : "assets/images/unhide-white.svg",
                          width: 12,
                          height: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                style: kBodyText,
                keyboardType: TextInputType.text,
                obscureText: _secureText,
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ForgetPasswordPage()))),
                  child: const Text(
                    "FORGET PASSWORD?",
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
              ),
            ),
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
                  backgroundColor: const Color(0xff3157F6),
                  minimumSize: const Size(370, 60),
                  textStyle: kBodyText,
                ),
                onPressed: (() {
                  validate();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomePage())));
                }),
                child: const Text("LOGIN"),
              ),
            )
          ],
        ),
      ],
    );
  }

  // void setCountryData(CountryCode country, context) {
  //   setState(() {
  //     name = country.name;
  //     codeController.text = country.dialCode;
  //   });
  //   Navigator.pop(context);
  // }

  void validate() {
    if (formKey.currentState!.validate()) {
      debugPrint("Success");
    } else {
      debugPrint("Error");
    }
  }

  String? validatepassword(value) {
    if (value.isEmpty) {
      return "Password Required";
    } else if (value.length < 8) {
      return "Should be atleast 8 character";
    } else if (value.length > 15) {
      return "Should be between 8 to 15 character";
    } else {
      return null;
    }
  }

  String? validatecontact(value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 7) {
      return "Should be atleast 7 character";
    } else if (value.length > 15) {
      return "Should be between 10 to 15 character";
    } else {
      return null;
    }
  }
}
