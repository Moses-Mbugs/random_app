import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRandomFactsExpanded = false;
  bool isMotivationExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      //app bar
      //  appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 199, 193, 193),
      //   title: Text(
      //     'The Random App',
      //     style: TextStyle(
      //       fontFamily: 'PressStart2P',
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),

      // the app bar isnt needed ..... for aesthetic

      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildExpandableButton(
                    title: 'Random Facts',
                    color: Colors.pinkAccent,
                    isExpanded: isRandomFactsExpanded,
                    subcategories: [
                      _buildSubButton('Animals', Colors.pinkAccent),
                      _buildSubButton('History', Colors.pinkAccent),
                      _buildSubButton('Random fact', Colors.pinkAccent),
                    ],
                    onTap: () {
                      setState(() {
                        isRandomFactsExpanded = !isRandomFactsExpanded;
                      });
                    },
                  ),

                  const SizedBox(height: 20),// space between the 2 buttons

                  _buildExpandableButton(
                    title: 'Motivation',
                    color: Colors.blueAccent,
                    isExpanded: isMotivationExpanded,
                    subcategories: [
                      _buildSubButton('Bible Motivation', Colors.blueAccent),
                      _buildSubButton('Philosophical Thoughts', Colors.blueAccent),
                      _buildSubButton('I need It ', Colors.blueAccent),
                    ],
                    onTap: () {
                      setState(() {
                        isMotivationExpanded = !isMotivationExpanded;
                      });
                    },
                  ),
                ],
              ),
            ),

            Positioned(
              top: 50,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Closes the app
                },
                backgroundColor: Colors.black,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.red.shade900,

                  // border radius
                  borderRadius:
                      BorderRadius.circular(2), 
                  border: Border.all(color: Colors.black, width: 3), 

                    // shadow
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.9), 
                        offset: const Offset(8, 8),
                        blurRadius: 0.1,
                      ),
                    ]
                )
                )
              ),
            ),

            // About button in the top-left corner
            Positioned(
              top: 50,
              left: 30,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                backgroundColor: Colors.black,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                  // border radius
                  borderRadius:
                      BorderRadius.circular(2), 
                  border: Border.all(color: Colors.black, width: 3), 
                    // shadow
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.9), 
                        offset: const Offset(8, 8),
                        blurRadius: 0.1,
                      ),
                    ]
                )
              ),
              )
            ),
          ]
        ),       
      ),
    );
  }
  
  

  Widget _buildExpandableButton({
    required String title,
    required Color color,
    required bool isExpanded,
    required List<Widget> subcategories,
    required VoidCallback onTap,
  }) 
  
  // this sections is for decorating the buttons .... neobrutalism
  {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: color,

              // border radius
              borderRadius:
                  BorderRadius.circular(2), 
              border: Border.all(color: Colors.black, width: 3), 

              // shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.9), 
                  offset: const Offset(8, 8),
                  blurRadius: 0.1,
                ),
              ],
            ),

            //text decoration
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'PressStart2P',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),

        // space between the mother button and tiny ones
        if (isExpanded)
          ...subcategories.map((sub) => Padding(
                padding: const EdgeInsets.only(top: 15),
                child: sub,
              )),
      ],
    );
  }


// this section is for the sub categories 
  Widget _buildSubButton(String title, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7, // the width of the tiny ones
      padding: const EdgeInsets.symmetric(vertical: 15), 
      decoration: BoxDecoration(
        color: color,

        //border radius 
        borderRadius: BorderRadius.circular(1), 
        border: Border.all(color: Colors.black, width: 2), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.9), 
            offset: const Offset(4, 4),
            blurRadius: 0.1,
          ),
        ],
      ),

      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'PressStart2p',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
