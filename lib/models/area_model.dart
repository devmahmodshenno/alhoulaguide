// lib/models/area_model.dart
class AreaModel {
  final String areaId;
  final String nameArea;

  const AreaModel({
    required this.areaId,
    required this.nameArea,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      areaId: json['area_id'] as String,
      nameArea: json['name_area'] as String,
    );
  }
}