class AnalyticBarDataModel {
  String? label;
  int? shotsAttempted;
  int? shotsMade;

  double? get percentage => (shotsAttempted ?? 0) > 0
      ? (shotsMade ?? 0) / (shotsAttempted ?? 0) * 100
      : 0.0;

  AnalyticBarDataModel({
    this.label,
    this.shotsAttempted,
    this.shotsMade,
  });

  AnalyticBarDataModel.fromJson(Map<String, dynamic> json) {
    label = json['label'] as String? ?? '';
    shotsAttempted = json['shots_attempted'] as int? ?? 0;
    shotsMade = json['shots_made'] as int? ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['shots_attempted'] = shotsAttempted;
    data['shots_made'] = shotsMade;
    return data;
  }
}
