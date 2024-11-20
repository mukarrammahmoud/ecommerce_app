// class MyCart {
//   MyCart({
//     required this.id,
//     required this.products,
//     required this.total,
//     required this.discountedTotal,
//     required this.userId,
//     required this.totalProducts,
//     required this.totalQuantity,
//   });

//   final int id;
//   final List<Product> products;
//   final double total;
//   final double discountedTotal;
//   final int userId;
//   final int totalProducts;
//   final int totalQuantity;

//   factory MyCart.fromJson(Map<String, dynamic> json) {
//     return MyCart(
//       id: json["id"] ?? 0,
//       products: json["products"] == null
//           ? []
//           : List<Product>.from(
//               json["products"]!.map((x) => Product.fromJson(x))),
//       total: json["total"] ?? 0.0,
//       discountedTotal: json["discountedTotal"] ?? 0.0,
//       userId: json["userId"] ?? 0,
//       totalProducts: json["totalProducts"] ?? 0,
//       totalQuantity: json["totalQuantity"] ?? 0,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "products": products.map((x) => x.toJson()).toList(),
//         "total": total,
//         "discountedTotal": discountedTotal,
//         "userId": userId,
//         "totalProducts": totalProducts,
//         "totalQuantity": totalQuantity,
//       };
// }

// class Product {
//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.total,
//     required this.discountPercentage,
//     required this.discountedTotal,
//     required this.thumbnail,
//   });

//   final int id;
//   final String title;
//   final double price;
//   final int quantity;
//   final double total;
//   final double discountPercentage;
//   final double discountedTotal;
//   final String thumbnail;

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json["id"] ?? 0,
//       title: json["title"] ?? "",
//       price: json["price"] ?? 0.0,
//       quantity: json["quantity"] ?? 0,
//       total: json["total"] ?? 0.0,
//       discountPercentage: json["discountPercentage"] ?? 0.0,
//       discountedTotal: json["discountedTotal"] ?? 0.0,
//       thumbnail: json["thumbnail"] ?? "",
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "quantity": quantity,
//         "total": total,
//         "discountPercentage": discountPercentage,
//         "discountedTotal": discountedTotal,
//         "thumbnail": thumbnail,
//       };
// }

class Cart {
  final int id;
  final List<Product> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  // تحويل JSON إلى كائن Cart
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      total: json['total'].toDouble(),
      discountedTotal: json['discountedTotal'].toDouble(),
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((product) => product.toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }
}

class Product {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  // تحويل JSON إلى كائن Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      total: json['total'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      discountedTotal: json['discountedTotal'].toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }
}
