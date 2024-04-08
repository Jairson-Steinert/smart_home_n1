import 'package:flutter/material.dart';

// Este ValueNotifier é declarado globalmente para manter o valor da temperatura selecionada.
ValueNotifier<double> heatValueNotifier = ValueNotifier<double>(21.0);

class Heating extends StatefulWidget {
  const Heating({Key? key}) : super(key: key);

  @override
  State<Heating> createState() => _HeatingState();
}

class _HeatingState extends State<Heating> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(8),
      shadowColor: Colors.black12,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'AR-CONDICIONADO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            // Utiliza ValueListenableBuilder para reconstruir o Slider quando o valor muda.
            ValueListenableBuilder<double>(
              valueListenable: heatValueNotifier,
              builder: (context, value, child) {
                return Slider(
                  value: value,
                  onChanged: (newHeat) {
                    heatValueNotifier.value = newHeat;
                  },
                  min: 15,
                  max: 35,
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("15\u00b0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                  Text("25\u00b0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                  Text("35\u00b0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FanSpeed extends StatefulWidget {
  const FanSpeed({Key? key}) : super(key: key);

  @override
  State<FanSpeed> createState() => _FanSpeedState();
}

class _FanSpeedState extends State<FanSpeed> {
  double fan = 15;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(8),
      shadowColor: Colors.black12,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'VELOCIDADE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            Slider(
              value: fan,
              onChanged: (newFan) {
                setState(() {
                  fan = newFan;
                });
              },
              min: 0, // Definindo um valor mínimo para consistência
              max: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('BAIXA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                  Text('MÉDIA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                  Text('ALTA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
