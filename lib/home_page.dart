import 'package:flutter/material.dart';
// import 'random_fact_dialog.dart';


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
              child: SizedBox(
                width: 115, // Custom width
                height: 60, // Custom height
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  backgroundColor: Colors.transparent, // Transparent to show the custom container
                  elevation: 0, // Remove shadow from FloatingActionButton itself
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10), // Adjust padding if needed
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: Colors.black, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.9),
                          offset: const Offset(8, 8),
                          blurRadius: 0.1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Icon(
                          Icons.close_rounded,
                          color: Colors.black,
                          
                        ),

                        const SizedBox(width: 8), // Space between icon and text

                        Text(
                          'Close', 
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PressStart2p',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // About button in the top-left corner
            Positioned(
              top: 50,
              left: 30,
              child: SizedBox(
                width: 115, // Custom width
                height: 60, // Custom height
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  backgroundColor: Colors.transparent, // Transparent to show the custom container
                  elevation: 0, // Remove shadow from FloatingActionButton itself
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10), // Adjust padding if needed
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: Colors.black, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.9),
                          offset: const Offset(8, 8),
                          blurRadius: 0.1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center content
                      children: [
                        Icon(
                          Icons.info_outline, // Your desired icon
                          color: Colors.black,
                          
                        ),
                        const SizedBox(width: 8), // Space between icon and text
                        Text(
                          'About', // Your desired text
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PressStart2p',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )


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
