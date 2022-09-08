class Environment {
  const Environment(this.name, {this.tags = const {}});
  final String name;
  final Set<EnvTag> tags;
  static const empty = Environment("empty");
}

class EnvTag {
  const EnvTag(this.name, {this.data});
  final String name;
  final dynamic data;
}

class EnvironmentEntry{
  Environment type = Environment.empty;
  Set<EnvTag> dynamicTags = {};
}