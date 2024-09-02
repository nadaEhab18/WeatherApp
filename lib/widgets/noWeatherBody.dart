
import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("There is no weather 😔 \nStart searching now 🔍",
              style: TextStyle(
                fontSize: 25,
              ),)
          ],
        ),
      ),
    );
  }
}
