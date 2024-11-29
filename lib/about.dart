import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'About',
          style: TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Neobrutalism App',
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'This is a simple app showcasing Neobrutalism design principles.'
                ' The app includes expandable buttons for displaying random facts and motivations.'
                ' Designed with bold colors, sharp edges, and strong contrasts.',
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Close button in the top-right corner
            // Positioned(
            //   top: 20,
            //   right: 20,
            //   child: FloatingActionButton(
            //     onPressed: () {
            //       Navigator.of(context).pop(); // Closes the app
            //     },
            //     backgroundColor: Colors.black,
            //     child: Icon(Icons.close, color: Colors.white),
            //   ),
            // ),

            // // About button in the top-left corner
            // Positioned(
            //   top: 20,
            //   left: 20,
            //   child: FloatingActionButton(
            //     onPressed: () {
            //       // Navigate to the About page (you can create the About page later)
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => AboutPage()),
            //       );
            //     },
            //     backgroundColor: Colors.black,
            //     child: Icon(Icons.info, color: Colors.white),
            //   ),
            // ),