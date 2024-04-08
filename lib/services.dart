import 'package:flutter/material.dart';
import 'package:smart_home_n1/temperature.dart';
import 'package:smart_home_n1/constants.dart';

import 'constants.dart';
import 'temperature.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardItems(title: 'ENERGIA', image: 'images/energy.png'),
            cardItems(
              onTab: (){   Navigator.push(context, MaterialPageRoute(builder: (context)=>Temperature()));},
           
              title: 'TEMPERATURA',
              image: 'images/temperature.png',
              color: primaryColor,
              fontColor: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 25,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardItems(title: 'ÁGUA', image: 'images/water.png'),
            cardItems(
              title: 'ENTRETENIMENTO',
              image: 'images/entertainment.png',
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector cardItems({
    required title,
    required String image,
    VoidCallback? onTab,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Material(
        elevation: 15,
        shadowColor: Colors.white38,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: 180,
          padding: const EdgeInsets.symmetric(vertical: 35),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
