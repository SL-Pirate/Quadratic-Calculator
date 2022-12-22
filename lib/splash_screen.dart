import 'package:flutter/material.dart';
import 'package:quadratic_calculator/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goHome(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Image.asset("gfx/fx.png")
    );
  }
}

void goHome(BuildContext context){
  Future.delayed(const Duration(seconds: 2), (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
  });
}
