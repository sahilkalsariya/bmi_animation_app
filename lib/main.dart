import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
     debugShowCheckedModeBanner: false,
     home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String a = "";
  double height = 0;
  double weight = 0;
  int age = 2;
  double convertMeter = 0;
  double calculateBMI = 0;
  String finalAns = "";
  final Duration initialDelay = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {

    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Color(0xff090E21),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              DelayedDisplay(
                fadeIn: true,
                delay: Duration(seconds: initialDelay.inSeconds + 1),
                child: AppBar(
                  title: const Text(
                    "BMI Calculator",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Color(0xff090E21),
                  elevation: 0,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DelayedDisplay(
                      delay: Duration(seconds: initialDelay.inSeconds + 1),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              a = "Female";
                            });
                          },
                          child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 150,
                              width: _w,
                              decoration: BoxDecoration(
                                color: const Color(0xff1D1E33),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: a == "Female"
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    "🚺",
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: DelayedDisplay(
                      delay: Duration(seconds: initialDelay.inSeconds + 2),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              a = "Male";
                            });
                          },
                          child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 150,
                              width: _w,
                              decoration: BoxDecoration(
                                color: const Color(0xff1D1E33),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: a == "Male"
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    "🚹",
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  Text("Male",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DelayedDisplay(
                delay: Duration(seconds: initialDelay.inSeconds + 3),
                child: SizedBox(
                  height: 170,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      // height: H,
                      width: _w,
                      decoration: BoxDecoration(
                        color: const Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "HEIGHT",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${height.toInt()}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(
                                  fontSize: 55,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SliderTheme(
                              data: const SliderThemeData(
                                trackHeight: 1,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8),
                                overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 5),
                                thumbColor: Color(0xffEB1555),
                                activeTrackColor: Color(0xff605463),
                                inactiveTrackColor: Color(0xff373743),
                              ),
                              child: Slider(
                                min: 0,
                                max: 200,
                                onChanged: (val) {
                                  setState(() {
                                    height = val;
                                  });
                                },
                                value: height,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: initialDelay.inSeconds + 4),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 75,
                    width: _w,
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1E33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: "${calculateBMI.ceilToDouble()}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const TextSpan(
                              text: " KG/ ",
                              style:
                              TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            const TextSpan(
                              text: "m2",
                              style:
                              TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        )),
                        Text(
                          finalAns,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text(
                    //       calculateBMI.toStringAsFixed(2),
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 30,
                    //       ),
                    //     ),
                    //     Text(
                    //       finalAns,
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 15,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: 220,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DelayedDisplay(
                        delay: Duration(seconds: initialDelay.inSeconds + 5),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 200,
                            width: _w,
                            decoration: BoxDecoration(
                              color: const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Weight",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "${weight.toInt()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 53,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            (weight > 0) ? weight-- : null;
                                          });
                                        },
                                        onDoubleTap: () {
                                          setState(() {
                                            (weight > 0) ? weight -= 10 : null;
                                          });
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff4C4F5E),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "−",
                                            style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        onDoubleTap: () {
                                          setState(() {
                                            (weight > 0) ? weight += 10 : null;
                                          });
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff4C4F5E),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                              fontSize: 32,
                                              color: Color(0xffF67FA4),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DelayedDisplay(
                        delay: Duration(seconds: initialDelay.inSeconds + 6),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 200,
                            width: _w,
                            decoration: BoxDecoration(
                              color: const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Age",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "$age",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 53,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            (age > 2) ? age-- : 2;
                                          });
                                        },
                                        onDoubleTap: () {
                                          setState(() {
                                            (age > 2) ? age -= 10 : 2;
                                          });
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff4C4F5E),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "−",
                                            style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                        onDoubleTap: () {
                                          setState(() {
                                            (age > 2) ? age += 10 : 2;
                                          });
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff4C4F5E),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                              fontSize: 32,
                                              color: Color(0xffF67FA4),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: initialDelay.inSeconds + 7),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        if (a == "Male" || a == "Female") {
                          if (age > 2) {
                            convertMeter = height / 100; // cm to meter
                            calculateBMI =
                                weight / (convertMeter * convertMeter);
                            if (calculateBMI < 18.5) {
                              finalAns = "Underweight";
                            } else if (calculateBMI >= 18.5 &&
                                calculateBMI < 25) {
                              finalAns = "Normal weight";
                            } else if (calculateBMI >= 25 &&
                                calculateBMI < 30) {
                              finalAns = "Overweight";
                            } else {
                              finalAns = "Obesity";
                            }
                          }
                        }
                      });
                    },
                    child: Container(
                      height: 60,
                      width: _w,
                      decoration: BoxDecoration(
                        color: const Color(0xffEB1555),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          //
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
