class BmiModel {
  final String status;
  final dynamic error;
  final BmiData data;

  BmiModel({
    required this.status,
    required this.error,
    required this.data,
  });

  factory BmiModel.fromJson(Map<String, dynamic> json) {
    return BmiModel(
      status: json['status'],
      error: json['error'],
      data: BmiData.fromJson(json['data']),
    );
  }
}

class BmiData {
  final String height;
  final String weight;
  final double bmi;
  final dynamic bmiPrime;
  final String category;
  final dynamic risk;
  final dynamic summary;
  final IdealWeightRange idealWeightRange;
  final dynamic weightToChange;

  BmiData({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.bmiPrime,
    required this.category,
    required this.risk,
    required this.summary,
    required this.idealWeightRange,
    required this.weightToChange,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num).toDouble(),
      bmiPrime: json['bmiPrime'],
      category: json['category'],
      risk: json['risk'],
      summary: json['summary'],
      idealWeightRange:
      IdealWeightRange.fromJson(json['idealWeightRange']),
      weightToChange: json['weightToChange'],
    );
  }
}

class IdealWeightRange {
  final double min;
  final double max;
  final String unit;

  IdealWeightRange({
    required this.min,
    required this.max,
    required this.unit,
  });

  factory IdealWeightRange.fromJson(Map<String, dynamic> json) {
    return IdealWeightRange(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      unit: json['unit'],
    );
  }
}