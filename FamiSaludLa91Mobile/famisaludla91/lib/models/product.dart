
class Producto {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  final int categoryId;
  final int stock;
  final int supplierId;

  Producto({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.stock,
    required this.supplierId,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      categoryId: json['category_id'],
      stock: json['stock'],
      supplierId: json['supplier_id'],
    );
  }

}



