import '../game/player.dart';

abstract class Action {
  String name = "empty";
  bool isEnabled(Player player);
  onAct(Player player);
}
