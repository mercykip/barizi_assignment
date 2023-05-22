import 'package:barizi_assignment/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/onboarding.png"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 400.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/Vector.png"),
            const Text(
              'Welcome to our store',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const Text(
              'Get your  groceries in as fast as one hour',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300, // <-- Your width
              height: 50, // <-- Your height
              child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/signin',
                    );
                  },
                  child: Text("Get Started".toUpperCase(),
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white))),
            ),
          ],
        ),
      ),
    ));
  }
}
