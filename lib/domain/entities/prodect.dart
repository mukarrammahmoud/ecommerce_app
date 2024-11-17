class Prodects {
    Prodects({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    final num? id;
    final String? title;
    final num? price;
    final String? description;
    final String? category;
    final String? image;
    final Rating? rating;

   

}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final num? rate;
    final num? count;


}
