import 'package:flutter/material.dart';
import 'package:flutter_app_counterapp/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // ignore: prefer_const_constructors
      home: MyHomePage(),
      // home: MyDrafts(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  bool isSwitch = false;
  Color backgroundColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitch ? Colors.blue : Colors.blue,
      appBar: AppBar(
        title: const Text(
          'Тапшырма 1',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Container(
              height: 44,
              width: 325,
              decoration: BoxDecoration(
                color: const Color(0xff0D61AE).withOpacity(0.8),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "Сан: ${counter.toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Switch(
              activeColor: Colors.white,
              value: isSwitch,
              onChanged: (newbool) {
                setState(() {
                  isSwitch = !isSwitch;

                  isSwitch = newbool;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SecondPage(
                          switcher: isSwitch,
                          resultNumber: counter.toString(),
                        );
                      },
                    ),
                  );
                });
              }),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: (MainAxisAlignment.center),
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: rounderRactangleBorder(
                          const BorderRadius.all(Radius.circular(15))),
                      backgroundColor: const Color(0xff0D61AE),
                      elevation: 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 13)),
                  child: const Icon(
                    Icons.remove,
                    size: 30,
                  )),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  counter++;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    shape: rounderRactangleBorder(
                        const BorderRadius.all(Radius.circular(15))),
                    backgroundColor: const Color(0xff0D61AE),
                    elevation: 1,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 13)),
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              )
            ],
          ),
          // ignore: prefer_const_constructors
        ]),
      ),
    );
  }

  rounderRactangleBorder(BorderRadius borderRadius) {}
}
