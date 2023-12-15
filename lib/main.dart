import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const TapPosition(),
    );
  }
}

class TapPosition extends StatefulWidget {
  const TapPosition({Key? key}) : super(key: key);

  @override
  State<TapPosition> createState() => _TapPositionState();
}

class _TapPositionState extends State<TapPosition> {
  Offset? _tapPosition;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (details) => _getTapPosition(details),
      child: Scaffold(
        appBar: AppBar(title: const Text('Tap Position'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.22,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2), blurRadius: 6)
                    ]),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'X: ${_tapPosition?.dx.toStringAsFixed(2) ?? "Tap Somewhere"}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Y: ${_tapPosition?.dy.toStringAsFixed(2) ?? "Tap Somewhere"}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getTapPosition(TapDownDetails details) async {
    final tapPosition = details.globalPosition;
    setState(() => _tapPosition = tapPosition);
  }
}
