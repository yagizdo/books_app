import 'package:books_app/core/service/database_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late var conn;
  Future<void> connectToDB() async {
    conn = await DatabaseClient().databaseConnect();
    conn.connect();
  }

  Future<void> getUser() async {
    var result = await conn.execute("SELECT book_name FROM booksDB.books;");
    print(result.runtimeType);

    for (final row in result.rows) {
      print(row.assoc());
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
          getUser();
        },
      ),
      body: Center(
        child: Text(
          'Home View',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }
}
