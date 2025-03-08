import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade800),
      ),
      home: const MyHomePage(title: 'BMI Calculator App'),
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

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
                ),

                SizedBox(height: 21,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight (in Kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in fts)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16,),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!= "" && ft!= "" && inch!= ""){

                    //BMI Calc

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt * 12) + iInch;

                    var tCm = tInch * 2.54;
                    var tM = tCm / 100;

                    var bmi = iWt / (tM * tM);

                    var msg = "";

                    if(bmi > 25){
                      msg = "You are Overweight!";
                      bgColor = Colors.orange.shade200;
                    } else if(bmi > 18.5){
                      msg = "You are Healthy!";
                      bgColor = Colors.green.shade200;
                    } else {
                      msg = "You are Underweight!";
                      bgColor = Colors.red.shade200;
                    }

                    setState(() {
                      result = "$msg \nYour BMI is ${bmi.toStringAsFixed(3)}";
                    });

                  } else {
                    setState(() {
                      result = "Please fill all the required Blanks!!";
                      bgColor = Colors.blue.shade50;
                    });

                  }

                }, child: Text('Calculate')),

                SizedBox(height: 21,),

                Text(result, style: TextStyle(fontSize: 19),),

              ],
            ),
          ),
        ),
      )

    );
  }
}
