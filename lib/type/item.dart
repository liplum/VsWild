class Item {
  const Item(this.name, {this.tags = const {}});

  final Set<String> tags;
  final String name;
  static const empty = Item("empty");
}

class ItemStack {
  Item type = Item.empty;
  int amount = 0;
  Tags tags = Tags();

  isEmpty() => type == Item.empty || amount <= 0;
}

class Tags {
  var unnamed = <String>{};
  var named = <String, dynamic>{};
}
