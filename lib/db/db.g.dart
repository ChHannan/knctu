// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserTableData extends DataClass implements Insertable<UserTableData> {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String token;
  UserTableData(
      {@required this.id,
      @required this.name,
      @required this.email,
      this.avatar,
      this.token});
  factory UserTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return UserTableData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      avatar:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      token:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}token']),
    );
  }
  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return UserTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      avatar: serializer.fromJson<String>(json['avatar']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'avatar': serializer.toJson<String>(avatar),
      'token': serializer.toJson<String>(token),
    };
  }

  @override
  UserTableCompanion createCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
    );
  }

  UserTableData copyWith(
          {String id,
          String name,
          String email,
          String avatar,
          String token}) =>
      UserTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        avatar: avatar ?? this.avatar,
        token: token ?? this.token,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('avatar: $avatar, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(email.hashCode, $mrjc(avatar.hashCode, token.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.avatar == this.avatar &&
          other.token == this.token);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> avatar;
  final Value<String> token;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.avatar = const Value.absent(),
    this.token = const Value.absent(),
  });
  UserTableCompanion.insert({
    @required String id,
    @required String name,
    @required String email,
    this.avatar = const Value.absent(),
    this.token = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        email = Value(email);
  UserTableCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> email,
      Value<String> avatar,
      Value<String> token}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      token: token ?? this.token,
    );
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  GeneratedTextColumn _avatar;
  @override
  GeneratedTextColumn get avatar => _avatar ??= _constructAvatar();
  GeneratedTextColumn _constructAvatar() {
    return GeneratedTextColumn(
      'avatar',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  GeneratedTextColumn _token;
  @override
  GeneratedTextColumn get token => _token ??= _constructToken();
  GeneratedTextColumn _constructToken() {
    return GeneratedTextColumn(
      'token',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, email, avatar, token];
  @override
  $UserTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_table';
  @override
  final String actualTableName = 'user_table';
  @override
  VerificationContext validateIntegrity(UserTableCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.avatar.present) {
      context.handle(
          _avatarMeta, avatar.isAcceptableValue(d.avatar.value, _avatarMeta));
    } else if (avatar.isRequired && isInserting) {
      context.missing(_avatarMeta);
    }
    if (d.token.present) {
      context.handle(
          _tokenMeta, token.isAcceptableValue(d.token.value, _tokenMeta));
    } else if (token.isRequired && isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UserTableCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.avatar.present) {
      map['avatar'] = Variable<String, StringType>(d.avatar.value);
    }
    if (d.token.present) {
      map['token'] = Variable<String, StringType>(d.token.value);
    }
    return map;
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(_db, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final String id;
  final String name;
  TagData({@required this.id, @required this.name});
  factory TagData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return TagData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TagData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  @override
  TagCompanion createCompanion(bool nullToAbsent) {
    return TagCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  TagData copyWith({String id, String name}) => TagData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.name == this.name);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<String> id;
  final Value<String> name;
  const TagCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagCompanion.insert({
    @required String id,
    @required String name,
  })  : id = Value(id),
        name = Value(name);
  TagCompanion copyWith({Value<String> id, Value<String> name}) {
    return TagCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TagTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $TagTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tag';
  @override
  final String actualTableName = 'tag';
  @override
  VerificationContext validateIntegrity(TagCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TagData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TagData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TagCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    return map;
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(_db, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UserTableTable _userTable;
  $UserTableTable get userTable => _userTable ??= $UserTableTable(this);
  $TagTable _tag;
  $TagTable get tag => _tag ??= $TagTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as AppDB);
  @override
  List<TableInfo> get allTables => [userTable, tag];
}
