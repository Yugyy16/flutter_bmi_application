import 'package:flutter/material.dart';
import 'package:flutter_application_bmi/secondscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int heightslider = 160;
  double age = 25;
  double weight = 65;
  var malecolor = Colors.blue[900];
  var femalecolor = Colors.blue[900];

  void calculatebmi() {
    var heightinm = heightslider / 100;
    var bmi = weight / (heightinm * heightinm);
    print(bmi.round());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmiResult: bmi.round(),
        ),
      ),
    );
  }

  void selectedgender(bool gender) {
    if (gender) {
      setState(() {
        malecolor = Color.from(alpha: 1, red: 0, green: 0, blue: 100);
        femalecolor = Colors.blue[900];
      });
    } else {
      setState(() {
        femalecolor = Color.from(alpha: 1, red: 0, green: 0, blue: 100);
        malecolor = Colors.blue[900];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 26, 95, 151),
        appBar: AppBar(
          title: Text("B M I"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 10, 63, 106),
          elevation: 8,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: GestureDetector(
                      onTap: () {
                        selectedgender(true);
                      },
                      child: Container(
                        height: 180,
                        width: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: malecolor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: GestureDetector(
                      onTap: () {
                        selectedgender(false);
                      },
                      child: Container(
                        height: 180,
                        width: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: femalecolor,
                        ),
                        color: Colors.blue[1000],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue[900],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$heightslider ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40)),
                            Text("cm ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40))
                          ],
                        ),
                        Slider(
                            min: 120,
                            max: 220,
                            value: heightslider.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                heightslider = value.toInt();
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 160,
                      width: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue[900],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton.filled(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                              IconButton.filled(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 160,
                      width: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue[900],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton.filled(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                              IconButton.filled(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  calculatebmi();
                },
                child: Container(
                  margin: EdgeInsets.all(6),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
