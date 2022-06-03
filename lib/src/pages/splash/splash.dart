import 'package:code_challenge/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rive/rive.dart';

import '../../utils/asset_route.dart';
import '../../utils/utils.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3209),
        () => Utils.moveToNextScreen(context, login));
    return const Scaffold(
      body: SafeArea(
        child: RiveAnimation.asset(
          splash,
          artboard: 'New Artboard',
          stateMachines: ['State Machine 1'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
