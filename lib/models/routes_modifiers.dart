class RoutesModifiers {
  bool? avoidTolls;
  bool? avoidHighways;
  bool? avoidFerries;

  RoutesModifiers(
      {this.avoidTolls = false,
      this.avoidHighways = false,
      this.avoidFerries = false});

  factory RoutesModifiers.fromJson(Map<String, dynamic> json) {
    return RoutesModifiers(
      avoidTolls: json['avoidTolls'] as bool?,
      avoidHighways: json['avoidHighways'] as bool?,
      avoidFerries: json['avoidFerries'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'avoidTolls': avoidTolls,
        'avoidHighways': avoidHighways,
        'avoidFerries': avoidFerries,
      };
}
