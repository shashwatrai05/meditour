import 'package:flutter/material.dart';
import 'package:meditour/NearbyHospitals.dart';
import 'package:meditour/model/list_hospital.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEDITOUR'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chair_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClickableCard(
  title: 'Find Hospitals',
  subtitle: 'Explore Healthcare Centers',
  feature: 'Nearby Locations',
  description: 'Discover nearby hospitals and healthcare centers for comprehensive medical care.',
  imageAsset: 'assets/hosp.png',
),
SizedBox(height: 16),
ClickableCard(
  title: 'Pharmacy Services',
  subtitle: 'Quality Medicines at Your Fingertips',
  feature: 'Affordable Medicine',
  description: 'Access a range of authentic medicines through our trusted pharmacy services.',
  imageAsset: 'assets/pharma.png',
),
SizedBox(height: 16),
ClickableCard(
  title: 'Expert Doctors',
  subtitle: 'Specialized Medical Professionals',
  feature: 'Healthcare Experts',
  description: 'Connect with the best doctors in various specialties for personalized healthcare solutions.',
  imageAsset: 'assets/doctor.png',
),

          ],
        ),
      ),
    );
  }
}

class ClickableCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String feature;
  final String description;
  final String imageAsset;

  ClickableCard({
    required this.title,
    required this.subtitle,
    required this.feature,
    required this.description,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          if (title == 'Find Hospitals') {
            // Only perform action for the first card
            // For example, navigate to a detailed view
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NearbyHospitals(hospitals: generateDummyHospitals()),
              ),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(height: 8),
            Container(
              height: 150,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imageAsset,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feature,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            description,
                            maxLines: 2,  // Display only one line
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}