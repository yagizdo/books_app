import 'package:books_app/core/service/database_client.dart';
import 'package:books_app/model/book.dart';
import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Books
  List<Book> booksList = [];

  // Sql Connection
  late MySQLConnection conn;

  // Db connect
  Future<void> connectToDB() async {
    conn = await DatabaseClient().databaseConnect();
    conn.connect();
  }

  Future<void> getBook() async {
    var result = await conn.execute("SELECT * FROM booksDB.books;");

    for (var book in result.rows) {
      setState(() {
        booksList.add(Book.fromJson(book.assoc()));
      });
    }
  }

  @override
  void initState() {
    connectToDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getBook();
          },
        ),
        body: ListView.builder(
          itemCount: booksList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(booksList[index].bookName!),
              subtitle: Text(booksList[index].bookWriter!),
            );
          },
        ));
  }
}
