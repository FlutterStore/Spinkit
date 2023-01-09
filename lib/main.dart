import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const kits = <Widget>[
    SpinKitRotatingCircle(color: Colors.brown),
    SpinKitRotatingPlain(color: Colors.green),
    SpinKitChasingDots(color: Colors.red),
    SpinKitPumpingHeart(color: Colors.yellow),
    SpinKitPulse(color: Colors.greenAccent),
    SpinKitDoubleBounce(color: Colors.red),
    SpinKitWave(color: Colors.amber, type: SpinKitWaveType.start),
    SpinKitWave(color: Colors.pink, type: SpinKitWaveType.end),
    SpinKitPianoWave(color: Colors.blue, type: SpinKitPianoWaveType.start),
    SpinKitPianoWave(color: Colors.blueGrey, type: SpinKitPianoWaveType.center),
    SpinKitPianoWave(color: Colors.cyan, type: SpinKitPianoWaveType.end),
    SpinKitThreeBounce(color: Colors.deepOrange),
    SpinKitThreeInOut(color: Colors.purpleAccent),
    SpinKitWanderingCubes(color: Colors.deepOrangeAccent),
    SpinKitWanderingCubes(color: Colors.indigo, shape: BoxShape.circle),
    SpinKitCircle(color: Colors.teal),
    SpinKitFadingFour(color: Colors.lightGreenAccent),
    SpinKitFadingFour(color: Colors.deepPurpleAccent, shape: BoxShape.rectangle),
    SpinKitFadingCube(color: Colors.lime),
    SpinKitCubeGrid(size: 20.0, color: Colors.amberAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: const Text('SpinKit', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.adaptiveCrossAxisCount,
            mainAxisSpacing: 50,
            childAspectRatio: 2,
            crossAxisSpacing: 30
          ),
          padding: const EdgeInsets.only(top: 32, bottom: 64),
          itemCount: kits.length,
          itemBuilder: (context, index) => kits[index]
        ),
      ),
    );
  }
}

extension on BuildContext {
  int get adaptiveCrossAxisCount {
    final width = MediaQuery.of(this).size.width;
    if (width > 1024) {
      return 8;
    } else if (width > 720 && width < 1024) {
      return 6;
    } else if (width > 480) {
      return 4;
    } else if (width > 320) {
      return 3;
    }
    return 1;
  }
}
