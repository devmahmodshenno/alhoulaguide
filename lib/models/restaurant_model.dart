// lib/models/restaurant_model.dart
class RestaurantModel {
  final String restaurantId;
  final String restaurantAreaId;
  final String restaurantName;
  final String? restaurantDescription;
  final String restaurantPhone;
  final bool restaurantHasDelivery;
  final String? restaurantAddress;
  final String? restaurantImageUrl;
  final String? areaName; // يتوفر فقط لو جبناه عبر JOIN مع areas

  const RestaurantModel({
    required this.restaurantId,
    required this.restaurantAreaId,
    required this.restaurantName,
    required this.restaurantPhone,
    this.restaurantDescription,
    required this.restaurantHasDelivery,
    this.restaurantAddress,
    this.restaurantImageUrl,
    this.areaName,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurantId: json['restaurant_id'] as String,
      restaurantAreaId: json['restaurant_area_id'] as String,
      restaurantName: json['restaurant_name'] as String,
      restaurantDescription: json['restaurant_description'] as String?,
      restaurantPhone: json['restaurant_phone'] as String,
      restaurantHasDelivery: json['restaurant_has_delivery'] as bool? ?? false,
      restaurantAddress: json['restaurant_address'] as String?,
      restaurantImageUrl: json['restaurant_image_url'] as String?,
      // لو الاستعلام عمل JOIN مع areas، Supabase يرجعها كـ Map متداخل باسم الجدول
      areaName: json['areas'] != null ? json['areas']['name_area'] as String? : null,
    );
  }
}