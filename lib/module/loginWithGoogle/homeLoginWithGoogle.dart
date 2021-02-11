import 'package:flutter/material.dart';
import 'package:flutter_samples/module/loginWithGoogle/provider/googleSignInProvider.dart';
import 'package:flutter_samples/module/loginWithGoogle/widget/loginScreen.dart';
import 'package:provider/provider.dart';


class HomeLoginWithGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: LoginScreen(),
        
        ),
    );
  }
}