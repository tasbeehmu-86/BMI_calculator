import 'package:flutter/material.dart';

class calcresult extends StatelessWidget {
  const calcresult ({super.key});

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
                            const Text(
                              "Samy Call",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "A 23 years old male.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),

                             SizedBox(height: 25),

                             Center(
                               child: Text(
                                "16.5",
                                style: TextStyle(
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
                                    const Text(
                                      "180 cm",
                                      style: TextStyle(
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
                                    const Text(
                                      "70 kg",
                                      style: TextStyle(
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
                height: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff01502E),
                ),
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(20,24,20,20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Under Weight',style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),),
                      SizedBox(height: 7,),
                      Text('Your BMI is less than 18.5',style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 0,
                      ),),
                      SizedBox(height: 7,),
                      Text('Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est.',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 0,
                      ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => calcresult(),));
                  },
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