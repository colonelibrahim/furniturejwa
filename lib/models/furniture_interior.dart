part of 'models.dart';

enum FurnitureType { kursi, sofa, recommended, paket_interior }

class Furniture_interior extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FurnitureType> types;

  Furniture_interior(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  factory Furniture_interior.fromJson(Map<String, dynamic> data) =>
      Furniture_interior(
          id: data['id'],
          picturePath: data['picturePath'],
          name: data['name'],
          description: data['description'],
          ingredients: data['ingredients'],
          price: data['price'],
          rate: (data['rate'] as num).toDouble(),
          types: data['types'].toString().split(',').map((e) {
            switch (e) {
              case 'recommended':
                return FurnitureType.recommended;
                break;
              case 'sofa':
                return FurnitureType.sofa;
                break;
              case 'paket interior':
                return FurnitureType.paket_interior;
                break;
              default:
                return FurnitureType.kursi;
            }
          }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate, types];
}

List<Furniture_interior> mockInteriors = [
  Furniture_interior(
      id: 1,
      picturePath: 'assets/banner1.jpg',
      name: "Interior Kantor",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 4.9,
      types: [FurnitureType.recommended]),
  Furniture_interior(
      id: 2,
      picturePath: 'assets/banner2.png',
      name: "Ruang Keluarga",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 4.9,
      types: [FurnitureType.recommended]),
  Furniture_interior(
      id: 3,
      picturePath: 'assets/banner3.png',
      name: "Ruang Makan",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 4.9,
      types: [FurnitureType.recommended]),
  Furniture_interior(
      id: 4,
      picturePath: 'assets/banner4.png',
      name: "Interior Minimalist",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 4.9,
      types: [FurnitureType.recommended]),
  Furniture_interior(
      id: 5,
      picturePath: 'assets/banner5.png',
      name: "Dipan Kasur",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 4.9,
      types: [FurnitureType.recommended]),
  Furniture_interior(
      id: 6,
      picturePath: 'assets/Sofa_sudut.jpg',
      name: "Sofa Sudut",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 3.9,
      types: [FurnitureType.sofa]),
  Furniture_interior(
      id: 7,
      picturePath: 'assets/Kursi 1.jpg',
      name: "Sofa Sudut",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 3.9,
      types: [FurnitureType.kursi]),
  Furniture_interior(
      id: 8,
      picturePath: 'assets/Kursi 2.jpg',
      name: "Sofa Sudut",
      description:
          "Di dalam Design interior kantor tersebut terdiri dari furniture :",
      ingredients:
          "Kursi dan Meja Rapat, Kursi dan Meja Kerja, Kursi dan Meja Tamu, Backdrop kisi- kisi, Lemari rak Buku, dan Pemasangan Lantai Vinyl",
      price: 20000000,
      rate: 3.9,
      types: [FurnitureType.kursi]),
];
