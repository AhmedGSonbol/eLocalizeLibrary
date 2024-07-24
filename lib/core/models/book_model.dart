class BookModel
{
  final int? id;
  final String bookName;
  final String bookDescription;
  final String author;
  final String? imageLocalPath;
  final int totalCopies;
  late int availableCopies;

  BookModel({
    this.id,
    required this.bookName,
    required this.bookDescription,
    required this.author,
    this.imageLocalPath,
    required this.totalCopies,
    required this.availableCopies,
});


  // Named constructor to create an instance from a map
  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      bookName: map['bookName'],
      bookDescription: map['bookDescription'],
      author: map['author'],
      imageLocalPath: map['imageLocalPath'],
      totalCopies: map['totalCopies'],
      availableCopies: map['availableCopies'],
      id: map['id'],
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'bookName': bookName,
      'bookDescription': bookDescription,
      'author': author,
      'imageLocalPath': imageLocalPath,
      'totalCopies': totalCopies,
      'availableCopies': availableCopies,
    };
  }

}