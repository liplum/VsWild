import 'package:vs_wild/game/player.dart';
import 'package:vs_wild/registry.dart';
import 'package:vs_wild/type/action.dart';

init() {
  ActionRegistry.all.add(Move());
}

class Move extends Action {
  @override
  bool isEnabled(Player player) {
    return true;
  }

  @override
  onAct(Player player) {
    player.info.energy -= 10;
  }
}
