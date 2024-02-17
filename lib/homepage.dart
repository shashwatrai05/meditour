import 'package:flutter/material.dart';
import 'package:meditour/detail_screen.dart';
import './model/hospital.dart'; // Import your Hospital model

class HomeScreen extends StatelessWidget {
  final List<Hospital> hospitals; // Replace with your list of hospitals

  HomeScreen({required this.hospitals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: const Text('Meditour Hospitals'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: hospitals.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to detailed screen when the card is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(hospital: hospitals[index]),
                  ),
                );
              },
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      hospitals[index].imagePath,
                      height: 90.0,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            hospitals[index].name,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(
          hospitals[index].description,
          maxLines: 1,  // Display only one line
          overflow: TextOverflow.ellipsis,  // Add ellipsis if text overflows
        ),
        Text(
          hospitals[index].address,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
