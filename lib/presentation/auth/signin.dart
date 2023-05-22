import 'package:barizi_assignment/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../utils/matrerial_color_conversion.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/signin.png"),
              const Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0),
                child: SizedBox(
                  width: 200,
                  child: Text(
                    textAlign: TextAlign.start,
                    "Get your groceries with nector",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28.0, bottom: 28),
                  child: IntlPhoneField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      counter: Offstage(),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(),
                      // ),
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {
                      // print(phone.completeNumber);
                    },
                  )),
              const Center(
                  child: Text(
                "Or connect with social media",
                style: TextStyle(color: socialMediaText),
              )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 300,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/home',
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: getButtonColor(googleBgColors),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/icons/google.png"),
                              const Text(
                                "Continue with Google",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 300,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/home',
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: getButtonColor(facebookBgColors),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  child:
                                      Image.asset("assets/icons/facebook.png")),
                              const Text(
                                "Continue with Facebook",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
