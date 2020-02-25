import 'package:moor_flutter/moor_flutter.dart';

class Tag extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
}
