import 'package:moor_flutter/moor_flutter.dart';

class UserTable extends Table {
  TextColumn get id => text()();

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get avatar => text().nullable()();

  TextColumn get token => text().nullable()();
}
