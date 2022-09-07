import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pie_chart/pie_chart.dart';

class Info {
  int health = 100;
  int food = 100;
  int water = 100;
  int energy = 100;
  double temperature = 37;

  toMap() => {
        "hud.health".tr(): health.toDouble(),
        "hud.food".tr(): food.toDouble(),
        "hud.water".tr(): water.toDouble(),
        "hud.energy".tr(): energy.toDouble(),
      };
}

class Player {
  final info = Info();
}

class Tile extends StatelessWidget {
  final double pad;
  final bool isIcon;

  const Tile({super.key, this.pad = 1, this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Hud(),
    );
  }
}

class Hud extends StatefulWidget {
  const Hud({Key? key}) : super(key: key);

  @override
  State<Hud> createState() => _HudState();
}

const hudBarColors = [
  Colors.redAccent, // health
  Colors.orangeAccent, // food
  Colors.blue, // water
  Colors.yellowAccent, // energy
];

const hudBarDarkColors = [
  Color(0xBFC62828), // health
  Color(0xBFE65100), // food
  Color(0xBF304FFE), // water
  Color(0xBFFFD600), // energy
];

class _HudState extends State<Hud> {
  final player = Player();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [buildHud(context)],
        ));
  }

  buildHud(BuildContext context) {
    return PieChart(
      dataMap: player.info.toMap(),
      chartType: ChartType.ring,
      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
      colorList: Theme.of(context).brightness == Brightness.dark
          ? hudBarDarkColors
          : hudBarColors,
      ringStrokeWidth: 35,
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: false,
      ),
      legendOptions: const LegendOptions(
          legendTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      )),
      totalValue: 400,
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
