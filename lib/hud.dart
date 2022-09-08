import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vs_wild/registry.dart';

import 'game/player.dart';
import 'type/action.dart' as act;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr()),
      ),
      body: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 180),
                    child: buildHud(context),
                  ),
                  Expanded(
                      child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 180),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ActionsPanel(
                        player: player,
                      ),
                    ),
                  )),
                ],
              ))),
    );
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

class ActionsPanel extends StatelessWidget {
  const ActionsPanel({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisCount: 4,
      children: ActionRegistry.all
          .map((e) => ActionButton(player: player, action: e))
          .toList(),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.player, required this.action});

  final Player player;
  final act.Action action;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          action.onAct(player);
        },
        child: Text(
          action.name,
          style: const TextStyle(fontSize: 18),
        ));
  }
}
