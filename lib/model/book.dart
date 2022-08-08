class Book {
  String? bookId;
  String? bookName;
  String? bookDetail;
  String? bookWriter;

  Book(this.bookId, this.bookName, this.bookDetail, this.bookWriter);

  Book.fromJson(Map<dynamic, dynamic> json) {
    bookId = json['book id'];
    bookName = json['book_name'];
    bookDetail = json['book detail'];
    bookWriter = json['book_writer'];
  }
}
