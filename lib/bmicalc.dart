import 'package:bmi_aug/result.dart';
import 'package:flutter/material.dart';

class bmicalc extends StatefulWidget {
  const bmicalc({super.key});

  @override
  State<bmicalc> createState() => _bmicalcState();
}

class _bmicalcState extends State<bmicalc> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();

  String? selectedGender;

  DateTime? birthDate;

  int height = 160;
  int weight = 60;

  double calculateBMI() {
    double heightInMeters = height / 100;

    double bmi = weight / (heightInMeters * heightInMeters);

    return bmi;
  }

  String calculateCategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  int calculateAge(DateTime birthDate) {
    final today = DateTime.now();

    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month &&
            today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: formKey,

          child: Padding(
            padding: const EdgeInsets.all(8.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Center(
                  child: Text(
                    "B M I",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.green,
                      fontSize: 40,
                    ),
                  ),
                ),

                SizedBox(
                  width: 340,
                  height: 20,
                ),

                Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                TextFormField(
                  controller: nameController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }

                    return null;
                  },

                  decoration: InputDecoration(
                    fillColor: Color(0x26B3B2EA),
                    filled: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                      borderSide: BorderSide(
                        color: Color(0x26B3B2EA),
                      ),
                    ),

                    hintText: 'Enter your name',
                  ),
                ),

                SizedBox(
                  width: 340,
                  height: 40,
                ),

                Text(
                  "Birth Date",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                TextFormField(
                  controller: birthDateController,

                  readOnly: true,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select your birth date";
                    }

                    return null;
                  },

                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,

                      firstDate: DateTime(1900),

                      lastDate: DateTime.now(),

                      initialDate: DateTime(2000),
                    );

                    if (date != null) {
                      setState(() {
                        birthDate = date;

                        birthDateController.text =
                        "${date.day}/${date.month}/${date.year}";
                      });
                    }
                  },

                  decoration: InputDecoration(
                    fillColor: Color(0x26B3B2EA),
                    filled: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                      borderSide: BorderSide(
                        color: Color(0x26B3B2EA),
                      ),
                    ),

                    hintText: 'Enter your Birth Date',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        SizedBox(
                          width: 340,
                          height: 20,
                        ),

                        Text(
                          "Choose Gender",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(
                          width: 340,
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,

                            children: [

                              Column(
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = "Male";
                                      });
                                    },

                                    child: Container(
                                      width: 111,
                                      height: 100,

                                      decoration: BoxDecoration(
                                        color: Color(0XFFEBEDFC),

                                        borderRadius:
                                        BorderRadius.circular(15),

                                        border: Border.all(
                                          color:
                                          selectedGender == "Male"
                                              ? Color(0XFF484783)
                                              : Colors.transparent,

                                          width: 3,
                                        ),
                                      ),

                                      child: Image.asset(
                                        'assets/photos/male.png',
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = "Female";
                                      });
                                    },

                                    child: Container(
                                      width: 111,
                                      height: 100,

                                      decoration: BoxDecoration(
                                        color: Color(0XFFEBEDFC),

                                        borderRadius:
                                        BorderRadius.circular(15),

                                        border: Border.all(
                                          color:
                                          selectedGender == "Female"
                                              ? Color(0XFF484783)
                                              : Colors.transparent,

                                          width: 3,
                                        ),
                                      ),

                                      child: Image.asset(
                                        'assets/photos/female.png',
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  const Text(
                                    "Female",

                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Text(
                  "Your Height(cm)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 50,

                  decoration: BoxDecoration(
                    color: Color(0XFFEBEDFC),

                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    children: [

                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Color(0XFF484783),
                          size: 30,
                        ),

                        onPressed: () {
                          setState(() {
                            if (height > 1) {
                              height--;
                            }
                          });
                        },
                      ),

                      SizedBox(width: 130),

                      Text(
                        "$height",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0XFF484783),
                        ),
                      ),

                      SizedBox(width: 130),

                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Color(0XFF484783),
                          size: 30,
                        ),

                        onPressed: () {
                          setState(() {
                            height++;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "Your Weight(kg)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 50,

                  decoration: BoxDecoration(
                    color: Color(0XFFEBEDFC),

                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    children: [

                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Color(0XFF484783),
                          size: 30,
                        ),

                        onPressed: () {
                          setState(() {
                            if (weight > 1) {
                              weight--;
                            }
                          });
                        },
                      ),

                      SizedBox(width: 140),

                      Text(
                        "$weight",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0XFF484783),
                        ),
                      ),

                      SizedBox(width: 140),

                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Color(0XFF484783),
                          size: 30,
                        ),

                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),

        child: SizedBox(
          width: double.infinity,
          height: 50,

          child: ElevatedButton(

            onPressed: () async {

              if (formKey.currentState!.validate()) {

                if (selectedGender == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please select your gender",
                      ),
                    ),
                  );

                  return;
                }

                if (birthDate == null) {
                  return;
                }

                double bmi = calculateBMI();

                String category = calculateCategory(bmi);

                int age = calculateAge(birthDate!);

                print(nameController.text);
                print(birthDateController.text);
                print(selectedGender);
                print(age);
                print(height);
                print(weight);
                print(bmi);
                print(category);

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => result(
                      name: nameController.text,

                      age: age,

                      gender: selectedGender!,

                      bmi: bmi,

                      height: "$height cm",

                      weight: "$weight kg",

                      category: category,
                    ),
                  ),
                );
              }
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF484783),
            ),

            child: Text(
              "Calculate BMI",

              style: TextStyle(
                color: Color(0XFFFFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}