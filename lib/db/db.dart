import 'package:moor_flutter/moor_flutter.dart';

import 'package:knctu/db/tables/user_table.dart';
import 'package:knctu/db/tables/tag_table.dart';

import 'package:knctu/db/daos/user_dao.dart';

part 'db.g.dart';


@UseMoor(tables: [UserTable, Tag],
daos: [UserDao])
class AppDB extends _$AppDB {
  AppDB()
      : super((FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite3', logStatements: true)));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) {
          return migrator.createAllTables();
        },
        onUpgrade: (migrator, to, from) async {},
      );
}
