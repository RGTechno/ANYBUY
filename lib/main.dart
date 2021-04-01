import 'package:anybuy/screens/Home_Screen.dart';
import 'package:anybuy/screens/Sarthak_Home.dart';
import 'package:anybuy/screens/auth/AuthHome_Screen.dart';
import 'package:anybuy/screens/auth/AuthMerch_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnyBuy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "ArchD",
      ),
      initialRoute: HomeScreen.id,
      routes: {
        AuthHome.id: (context) => AuthHome(),
        AuthMerchant.id: (context) => AuthMerchant(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
