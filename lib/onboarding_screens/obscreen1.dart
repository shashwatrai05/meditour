import 'package:flutter/material.dart';

class ObScreen1 extends StatefulWidget {
  const ObScreen1({super.key});

  @override
  State<ObScreen1> createState() => _ObScreen1State();
}

class _ObScreen1State extends State<ObScreen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,                                                      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
            image: NetworkImage(
              
                'https://img.freepik.com/free-vector/hand-drawn-doctor-cartoon-illustration_23-2150680327.jpg'),
            fit: BoxFit.contain),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Caring Beyond Cure: Nurturing Health and Harmony for a Vibrant Tomorrow',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}