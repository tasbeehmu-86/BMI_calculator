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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("B M I",style: TextStyle(fontWeight: FontWeight.w900,color:Colors.green,fontSize: 40),)),
            SizedBox(
              width: 340,
              height: 30,
            ),
            Text("Name",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black ),),
            TextFormField(
              controller: nameController,

              validator: (value){
                if(value == null || value.isEmpty){
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
                  borderSide: BorderSide(color: Color(0x26B3B2EA)),
                ),
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(
              width: 340,
              height: 45,
            ),
            Text("Birth Date",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black ),),
            TextFormField(
              controller: birthDateController,
              readOnly: true,
              validator: (value){
                if(value == null || value.isEmpty){
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
                if(date != null){
                  setState(() {
                    birthDate = date;

                    birthDateController.text = "${date.day}/${date.month}/${date.year}";
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
                  borderSide: BorderSide(color: Color(0x26B3B2EA)),
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
                      height: 45,
                    ),
                    Text("Choose Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black ),),
                    SizedBox(
                      width: 340,
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectedGender = "Male";
                                  });
                                },
                                child: Container(
                                  width: 111,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFEBEDFC),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: selectedGender == "Male"
                                        ? Color(0XFF484783)
                                        : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                    child: Image.asset(
                                    'assets/photos/male.png'
                                   ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("Male", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),)
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = "female";
                                  });
                                },
                                child: Container(
                                  width: 111,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFEBEDFC),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: selectedGender == "female"
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
                    )
                  ],
                ),
              ),
            ),
            Text("Your Height(cm)",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black ),),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0XFFEBEDFC),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Color(0XFF484783), size: 30),
                    onPressed: () {
                      setState(() {
                        height--;
                      });
                    },
                  ),
                  SizedBox(width: 130),

                  Text("$height", style: TextStyle(fontSize: 24,color: Color(0XFF484783))),

                  SizedBox(width: 130),

                  IconButton(
                    icon: Icon(Icons.add, color: Color(0XFF484783), size: 30),
                    onPressed: () {
                      setState(() {
                        height++;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text("Your Weight(kg)",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black ),),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0XFFEBEDFC),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Color(0XFF484783), size: 30),
                    onPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                  SizedBox(width: 140),

                  Text("$weight", style: TextStyle(fontSize: 24,color: Color(0XFF484783))),

                  SizedBox(width: 140),

                  IconButton(
                    icon: Icon(Icons.add, color: Color(0XFF484783), size: 30),
                    onPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
          ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if(formKey.currentState!.validate()){
                print(nameController.text);
                print(birthDateController.text);
                print(selectedGender);
                print(height);
                print(weight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>calcresult(),));

              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF484783),
            ),
            child: const Text(
              "Calculate BMI",
              style: TextStyle(
                color: Color(0XFFFFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        )
      ),
    );
  }
}