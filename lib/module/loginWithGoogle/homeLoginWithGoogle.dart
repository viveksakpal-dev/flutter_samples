import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_samples/module/loginWithGoogle/provider/googleSignInProvider.dart';
import 'package:flutter_samples/module/loginWithGoogle/widget/backGroundPainter.dart';
import 'package:flutter_samples/module/loginWithGoogle/widget/loginWithGoogleButton.dart';
import 'package:flutter_samples/module/loginWithGoogle/widget/signUpWIthGoogle.dart';
import 'package:provider/provider.dart';


class HomeLoginWithGoogle extends StatelessWidget {
  @override
Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return LoginWithGoogleButton();
              } else {
                return SignUpWithGoogle();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}