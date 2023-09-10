import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press here (if needed)
        // Return true to allow the back button press or false to prevent it
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Welcome Page"),
          automaticallyImplyLeading: false, // Remove the back arrow
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to the World...!"),
          ),
        ),
      ),
    );
  }
}
