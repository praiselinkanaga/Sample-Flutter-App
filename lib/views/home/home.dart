import 'package:flutter/material.dart';
import 'package:flutter_application_9/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: const [
            Text(
              "Hai",
              style: kHeading1,
            ),
          ],
        ),
      ),
    );
  }
}
