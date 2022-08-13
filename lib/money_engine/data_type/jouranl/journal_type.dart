class JournalType {
  final String type;
  const JournalType(this.type);

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) => other is JournalType && type == other.type;
}
