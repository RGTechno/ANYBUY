import 'package:anybuy/provider/AuthData.dart';
import 'package:anybuy/screens/merchScreen.dart';
import 'package:provider/provider.dart';

import '../screens/UserHome.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthData>(context);
    if(authData.currentUserData["isMerchant"] == true){
      return MerchScreen();
    }
    return UserHome();
  }
}
