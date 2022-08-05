import 'package:books_app/core/service/i_database_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mysql_client/src/mysql_client/connection.dart';

class DatabaseClient implements IDatabaseClient {
  String host = dotenv.get('HOST');
  int port = dotenv.get('PORT') as int;
  String username = dotenv.get('USERNAME');
  String password = dotenv.get('PASSWORD');
  @override
  Future<MySQLConnection> databaseConnect() async {
    final conn = await MySQLConnection.createConnection(
        host: host,
        port: port,
        userName: username,
        password: password,
        databaseName: 'booksDB');

    return conn;
  }
}
