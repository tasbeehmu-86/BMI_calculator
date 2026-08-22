import 'package:flutter/material.dart';
import 'package:bmi_aug/bmicalc.dart';

class result extends StatelessWidget {
  final String name;
  final int age;
  final String gender;
  final double bmi;
  final String height;
  final String weight;
  final String category;

  const result({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.bmi,
    required this.height,
    required this.weight,
    required this.category,
  });

  String getCategoryText() {
    if (category == "Underweight") {
      return "Your BMI indicates that you are underweight. It may be helpful to focus on a balanced diet that provides enough nutrients and calories to support a healthy weight.";
    } else if (category == "Normal") {
      return "Your BMI is within the normal range. Keep maintaining a balanced diet and regular physical activity to support your overall health.";
    } else if (category == "Overweight") {
      return "Your BMI indicates that you are overweight. Maintaining a balanced diet and regular physical activity can help you work toward a healthier weight.";
    } else {
      return "Your BMI indicates that you are in the obese range. A balanced diet, regular physical activity, and guidance from a healthcare professional can help you work toward a healthier weight.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6FF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff7876CD),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,30,0,0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "A $age years old $gender.",                              style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            ),

                            SizedBox(height: 25),

                            Center(
                              child: Text(
                                bmi.toStringAsFixed(1),                                style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              ),
                            ),

                            SizedBox(height: 5),

                            Center(
                              child: Text(
                                "BMI Calc",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      height,                                      style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Height",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(width: 20),

                                Container(
                                  width: 2,
                                  height: 75,
                                  color: Colors.white54,
                                ),

                                const SizedBox(width: 20),

                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      weight,                                      style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Weight",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Image.asset(
                        'assets/photos/body.png',
                        width: 200,
                        height: 350,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff01502E),
                ),
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(20,24,20,20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category,style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),),
                      SizedBox(height: 7,),
                      Text(  'Your BMI is ${bmi.toStringAsFixed(1)}',style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 10,),
                      Text(
                        getCategoryText(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const bmicalc(),
                      ),
                    );                  },
                  child: Container(
                    height:45,
                    width: 332,
                    decoration: BoxDecoration(
                        color: Color(0xff484783),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(child: Text("Calculate BMI Again",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),)),
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