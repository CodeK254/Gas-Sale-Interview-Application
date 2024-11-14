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
      name: json['name'], 
      imageUrl: json['image_url'],
      currency: json['currency'],
      price: json['price']
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