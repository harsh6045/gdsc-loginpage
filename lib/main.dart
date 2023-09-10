import 'package:flutter/material.dart';

import 'IntroPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailText = TextEditingController();
  var password = TextEditingController();
  bool isPasswordVisible = false;
  bool isWrongPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/bg3.jpg'),
            fit: BoxFit.fill,
          )),
          child: Center(
            child: Container(
              height: 500,
              width: 350,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 200),
                      child: Text(
                        "Username :",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailText,
                          decoration: InputDecoration(
                            hintText: 'Enter email address',
                            suffixIcon: IconButton(
                              icon:
                                  Icon(Icons.accessibility, color: Colors.grey),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 200),
                      child: Text(
                        "Password :",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: password,
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: Text("Click here to login!"),
                      onPressed: () {
                        if (emailText.text == 'abc@gmail.com') {
                          if (password.text != '123') {
                            _showIncorrectPasswordDialog(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IntroPage(),
                              ),
                            );
                          }
                        } else {
                          _showUserNotFoundDialog(context);
                        }
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Login with Google'),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("Didn't have account sign up"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showIncorrectPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Incorrect Password'),
        content: Text('The password you entered is incorrect.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

void _showUserNotFoundDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('User Not Found'),
        content: Text('No such user exists. Would you like to sign up?'),
        actions: <Widget>[
          TextButton(
            child: Text('No, thanks'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text('Sign Up'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Navigate to the sign-up page here
            },
          ),
        ],
      );
    },
  );
}
