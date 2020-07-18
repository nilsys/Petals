import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petal_bussiness/Provider/LoginProvider.dart';
import 'package:petal_bussiness/views/HomePage.dart';
import 'package:petal_bussiness/views/login/Login.dart';
import 'package:provider/provider.dart';

import 'Widgets/ConnectionError.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: MaterialApp(
        title: 'Petals Business',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (context, snapshot) {
            if (snapshot.data == null)
              return Login();
            else
              return HomePage();
          },
        ),
      ),
    );
  }
}
