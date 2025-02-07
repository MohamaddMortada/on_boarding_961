class Country {
  final String code;
  final String name;
  final String dialCode;

  Country({required this.code, required this.name, required this.dialCode});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          dialCode == other.dialCode);

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ dialCode.hashCode;
}
