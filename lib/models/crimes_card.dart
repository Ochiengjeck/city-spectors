import 'package:flutter/material.dart';

class CrimesCard extends StatelessWidget {
  final String image;
  final String description;
  const CrimesCard({super.key, required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: ClipOval(
              child: Container(
                height: 60,
                width: 60,
                color: Colors.yellow,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Text(description)
        ],
      ),
    );
  }
}
