import 'package:flutter/material.dart';
import 'package:flutter_exercise_3/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //変数の頭の_は、この変数がこのクラスの内部でしか使えないということを意味する。
  int _counter = 0;
  bool _isToggleOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(

          //条件式?値1:値2で、if(条件式){return 値1;}else{return 値2;}と同じ意味。
          child: Icon(_isToggleOn?Icons.toggle_on_outlined:Icons.toggle_off_outlined, color: Colors.white, size: 40,),
          onPressed: (){

            //問４： _isToggleOnの値を逆にすれば良い。
            setState(() {
              _isToggleOn = !_isToggleOn;
            });
          },
        ),
        title: Text('タイトル', style: titleStyle,),
      ),

      //問５： _isToggleOnの値に応じて、色を変化させる。
      backgroundColor: _isToggleOn?Colors.white:Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){

                    //問２： _counterの値を１減らして、画面を更新。
                    setState(() {
                      _counter--;
                    });
                  },
                  child: const Icon(Icons.remove),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                  ),
                ),
                const SizedBox(width: 20,),

                //問３： _counterの値を０にして、画面を更新。
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _counter=0;
                    });
                  },
                  child: const Text('Reset', style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                  ),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {

                      //問２： _counterの値を１増やして、画面を更新。
                      _counter++;
                    });
                  },
                  child: const Icon(Icons.add),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
