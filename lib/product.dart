// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int? id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  Product(
      {this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      this.rating});
      

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJson(),
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: (map['id'] ?? '') as int,
      title: (map['title'] ?? '') as String,
      price: (map['price'] ?? 0.0).toDouble(),
      description: (map['description'] ?? '') as String,
      category: (map['category'] ?? '') as String,
      image: (map['image'] ?? '') as String,
      rating: map['rating'] != null
          ? Rating.fromJson(map['rating'] as Map<String, dynamic>)
          : null,
    );
  }

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromJson(Map<String, dynamic> map) {
    return Rating(
      rate: (map['rate'] ?? 0.0).toDouble(),
      count: (map['count'] ?? 0) as int,
    );
  }

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }
}
