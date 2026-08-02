class AppArea {
  final String areaId;
  final String areaName;
  final String imagePath;

  const AppArea({
    required this.areaId,
    required this.areaName,
    required this.imagePath,
  });
}

class AppAreas {
  static const List<AppArea> all = [
    AppArea(
      areaId: 'b6ec163c-32c3-4f2d-a1e1-beec077e5a36',
      areaName: 'تلدو',
      imagePath: 'images/area.jpeg',
    ),
    AppArea(
      areaId: 'ce212207-39cf-4052-9350-2891de788236',
      areaName: 'الطيبة الغربية',
      imagePath: 'images/area.jpeg',
    ),
    AppArea(
      areaId: 'd66788b3-cc24-4db9-ba39-8a00942c9d9d',
      areaName: 'كفرلاها',
      imagePath: 'images/area.jpeg',
    ),
    AppArea(
      areaId: '2e58b023-ee97-4b2f-ab25-f8aba643cc01',
      areaName: 'تلذهب',
      imagePath: 'images/area.jpeg',
    ),
  ];
}