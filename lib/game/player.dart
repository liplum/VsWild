import 'package:easy_localization/easy_localization.dart';

import 'backpack.dart';

class Info {
  int health = 100;
  int food = 100;
  int water = 100;
  int energy = 100;

  toMap() => {
    "hud.health".tr(): health.toDouble(),
    "hud.food".tr(): food.toDouble(),
    "hud.water".tr(): water.toDouble(),
    "hud.energy".tr(): energy.toDouble(),
  };
}

class Player {
  final info = Info();
  final backpack = Backpack();
}