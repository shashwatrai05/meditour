import 'package:flutter/material.dart';

class ObScreen2 extends StatefulWidget {
  const ObScreen2({super.key});

  @override
  State<ObScreen2> createState() => _ObScreen2State();
}

class _ObScreen2State extends State<ObScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
            image: NetworkImage(
                'https://mir-s3-cdn-cf.behance.net/projects/max_808/c925bb73013043.Y3JvcCwxMjAwLDkzOCwwLDEwMw.jpg'),
            fit: BoxFit.contain),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Empowering Wellness, Connecting Lives: Your Journey to Better Health Starts Here.',
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