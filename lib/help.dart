import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Help"),
      ),
      body: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        alignment: Alignment.center,
        child: const SingleChildScrollView(
          child: Text(
            "Let the default quadratic expression be 'ax\u00b2+bx+c'\n"
                "Compare your quadratic equation with the default quadratic expression\n"
                "Enter the corresponding values of 'a', 'b' and 'c' of your equation\n\n"
                "Eg: Assume your equation is x\u00b2+2x-3,\n"
                "Then your values would be,\n"
                "a: 1\n"
                "b: 2\n"
                "c: -3"
          )
        )
      )
    );
  }
}
