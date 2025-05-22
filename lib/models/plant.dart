class Plant {
  final String image, title, country;
  final int price;
  final bool isFavorited, isFeatured;

  Plant({
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    this.isFavorited = false,
    this.isFeatured = false,
  });
}

// Contoh data dummy yang bisa digunakan di rekomendasi atau featured plants
List<Plant> recommendedPlants = [
  Plant(
    image: "assets/images/image_1.png",
    title: "Samantha",
    country: "Russia",
    price: 440,
    isFavorited: true,
  ),
  Plant(
    image: "assets/images/image_2.png",
    title: "Angelica",
    country: "Russia",
    price: 340,
    isFavorited: false,
  ),
  Plant(
    image: "assets/images/image_3.png",
    title: "Rosalina",
    country: "Russia",
    price: 420,
    isFavorited: true,
  ),
];

List<Plant> featuredPlants = [
  Plant(
    image: "assets/images/bottom_img_1.png",
    title: "Succulent",
    country: "USA",
    price: 250,
    isFeatured: true,
  ),
  Plant(
    image: "assets/images/bottom_img_2.png",
    title: "Cactus",
    country: "Mexico",
    price: 300,
    isFeatured: true,
  ),
];
