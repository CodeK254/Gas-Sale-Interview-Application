import 'package:gas_sale/utils/formating/format_name.dart';

class CylinderModel {
  final int id;
  final double price;
  final String imageUrl;
  final String name;
  final String currency;

  CylinderModel({
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.currency,
  });

  factory CylinderModel.fromJson(Map<String, dynamic> json){
    return CylinderModel(
      id: int.parse(json['id']), 
      name: formatName(json['name']), 
      imageUrl: "https://www.shutterstock.com/image-illustration/collection-gas-cylinders-various-colors-600nw-2186712775.jpg",
      currency: "KES",
      price: double.parse(json['price'])
    );
  }

  Map<String, dynamic> toJson(CylinderModel cylinder){
    return {
      'id': cylinder.id,
      'name': cylinder.name,
      'image_url': cylinder.imageUrl,
      'currency': cylinder.currency,
      'price': cylinder.price,
    };
  }
}

extension CylonderExtensions on CylinderModel{
  String get toMapString => toJson(this).toString();
}