import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_home_n1/controller.dart';
import 'package:smart_home_n1/constants.dart';

import 'controller.dart' show FanSpeed, Heating, heatValueNotifier;

class Temperature extends StatelessWidget {
  const Temperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: textColor,
                    ),
                  ),
                  Image.asset(
                    'images/menu.png',
                    height: 30,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ValueListenableBuilder<double>(
                      valueListenable: heatValueNotifier,
                      builder: (context, heat, child) {
                        double percentHeat = heat / 35; // Considerando 35 como o máximo
                        return CircularPercentIndicator(
                          radius: 110,
                          lineWidth: 20,
                          percent: percentHeat,
                          backgroundColor: const Color(0xFFEAE4FF),
                          progressColor: textColor,
                          center: Text(
                            "${heat.toStringAsFixed(1)}\u00b0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              fontSize: 40,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        'TEMPERATURA',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        generalAndServices(
                          title: 'GERAL',
                          isActive: true,
                        ),
                        generalAndServices(title: 'SERVIÇOS'),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Heating(),
                    const SizedBox(height: 20),
                    const FanSpeed(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        fan(title: 'FAN 1', isActice: true),
                        fan(
                          title: 'FAN 2',
                          isActice: true,
                        ),
                        fan(title: 'FAN 3'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column fan({
    required String title,
    bool isActice = false,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 15,
              shadowColor: Colors.black26,
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: isActice ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                    isActice ? "images/fan-2.png" : "images/fan-1.png"),
              ),
            ),
            Positioned(
              right: 0,
              top: 5,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: isActice ? Colors.amber : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActice ? Colors.black54 : Colors.black26,
          ),
        )
      ],
    );
  }

  Container generalAndServices({
    required String title,
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 42,
      ),
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryColor),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isActive ? Colors.white70 : Colors.grey,
        ),
      ),
    );
  }
}