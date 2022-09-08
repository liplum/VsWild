class Environment {
  const Environment(this.name, {this.tags = const {}});
  final String name;
  final Set<EnvTag> tags;
}

class EnvTag {
  const EnvTag(this.name, {this.data});
  final String name;
  final dynamic data;
}
