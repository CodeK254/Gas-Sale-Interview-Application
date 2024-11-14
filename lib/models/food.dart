class FoodCategory {
  final int id;
  final String category;
  final String image;
  final String description;

  FoodCategory({
    required this.id,
    required this.category,
    required this.image,
    required this.description,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json){
    return FoodCategory(
      id: int.parse(json['idCategory']), 
      category: json['strCategory'], 
      image: json['strCategoryThumb'], 
      description: json['strCategoryDescription']
    );
  }

  Map<String, dynamic> toJson(FoodCategory category){
    return {
      'idCategory': category.id,
      'strCategory': category.category,
      'strCategoryThumb': category.image,
      'strCategoryDescription': category.description,
    };
  }
}