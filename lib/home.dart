import 'package:flutter/material.dart';
import 'package:quadratic_calculator/help.dart';
import "package:quadratic_calculator/cal.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _aCtrl = TextEditingController();
  final TextEditingController _bCtrl = TextEditingController();
  final TextEditingController _cCtrl = TextEditingController();

  String output = "Analyzed result \nwill be displayed here";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quadratic Calculator", style: TextStyle(color: Colors.black)),
        leading: const Icon(Icons.calculate, color: Colors.black),
        actions: [
          IconButton(onPressed: help, icon: const Icon(Icons.help_outline, color:Colors.black))
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        //main scroll view
        child: SingleChildScrollView(

          //Main column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //input fields
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: TextFormField(
                  controller: _aCtrl,
                  decoration: const InputDecoration(labelText: "Please enter the value at a", hintText: "a : "),
                )
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: TextFormField(
                    controller: _bCtrl,
                    decoration: const InputDecoration(labelText: "Please enter the value at b", hintText: "b : "),
                  )
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: TextFormField(
                    controller: _cCtrl,
                    decoration: const InputDecoration(labelText: "Please enter the value at c", hintText: "c : "),
                  )
              ),
              const SizedBox(height: 20),
              /*
              //container containing input fields
              Container(
                height: MediaQuery.of(context).size.height/3.5,
                margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  ]
                ),
              ),*/

              //Button
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: examine,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lime),
                    foregroundColor: MaterialStateProperty.all(Colors.black)
                  ),
                  child: const Text("Examine"),
                ),
              ),

              //Output display
              Container(
                height: MediaQuery.of(context).size.height/2.5,
                alignment: Alignment.center,
                child: SelectableText(output)
              )
            ]
          )
        )
      )
    );
  }

  void examine(){
    double a = double.parse(_aCtrl.text);
    double b = double.parse(_bCtrl.text);
    double c = double.parse(_cCtrl.text);

    QuadCal cal = QuadCal();
    String out = cal.run(a, b, c);
    setState(() {
      output = out;
    });
  }

  void help(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HelpPage())
    );
  }
}
