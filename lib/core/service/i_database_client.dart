import 'package:mysql_client/mysql_client.dart';

abstract class IDatabaseClient {
  Future<MySQLConnection> databaseConnect();
}
