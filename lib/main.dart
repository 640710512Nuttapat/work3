import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> myList = ['_ ', '_ ', '_ ', '_ ', '_ ', '_ '];
  int i=0;
  void buttonPressed(String a) {
    setState(() {
      if(a!='X'&&a!='Clear'&&i<6){
        myList[i] = a;
        i++;
      }else if(a=='X'){
      myList = ['_ ', '_ ', '_ ', '_ ', '_ ', '_ '];
      i=0;
      }else if (a=='Clear'){
        myList[i-1]='_ ';
        i--;
      }
});
  }

  Widget myButton(String a, String b) {
  return Expanded(
    
      child: OutlinedButton(
        onPressed: () {
          buttonPressed(a);
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(4.0), side: (a == 'X' || a == 'Clear') ? BorderSide.none : null,shape:ContinuousRectangleBorder(),
        ),
        child: Text('$a\n''$b', style: TextStyle(fontSize: 15), textAlign: TextAlign.center)) ,);
      
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
              Icon(Icons.security, color: Color.fromARGB(255, 0, 0, 0), size: 70,),
              SizedBox(height: 20.0,),
              Text('PIN LOGIN',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50.0,),
              Text(
                '${myList[0]}${myList[1]}${myList[2]} ${myList[3]}${myList[4]}${myList[5]}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [  
                 SizedBox(width: 70.0), myButton('1', 'one'),SizedBox(width: 40.0,), myButton('2', 'two'),SizedBox(width: 40.0,), myButton('3', 'three'),SizedBox(width: 70.0,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                 SizedBox(width: 70.0,height:70,), myButton('4', 'four'),SizedBox(width: 40.0,), myButton('5', 'five'),SizedBox(width: 40.0,), myButton('6', 'six'),SizedBox(width: 70.0,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               SizedBox(width: 70.0,),myButton('7', 'seven'),SizedBox(width: 40.0,), myButton('8', 'eight'),SizedBox(width: 40.0,), myButton('9', 'nine'),SizedBox(width: 70.0,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SizedBox(width: 70.0,height:70,), myButton('X', ''),SizedBox(width: 40.0,), myButton('0', 'zero'),SizedBox(width: 40.0,), myButton('Clear', ''),SizedBox(width: 70.0,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}