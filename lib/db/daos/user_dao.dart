import 'package:moor_flutter/moor_flutter.dart';

import 'package:knctu/db/db.dart';

import 'package:knctu/db/tables/user_table.dart';
import 'package:knctu/db/tables/tag_table.dart';

part 'user_dao.g.dart';

@UseDao(tables: [UserTable, Tag])
class UserDao extends DatabaseAccessor<AppDB> with _$UserDaoMixin {
  UserDao(AppDB db) : super(db);

  Future<UserTableData> getLoggedInUser() =>
      (select(userTable)..where((row) => isNotNull(row.token))).getSingle();

  Future<int> insertUser(Insertable<UserTableData> user) =>
      into(userTable).insert(user, orReplace: true);
}
