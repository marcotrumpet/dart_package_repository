// ignore_for_file: lines_longer_than_80_chars, prefer_single_quotes

import '../tables/abstract_table.dart';

extension PackageVersionQueryExtensions on AbstractTable<dynamic> {
  String insertQuery(String tableName) {
    final jsonPackageVersion = toJson(this);
    final keys = jsonPackageVersion.keys.join(',');
    final values = jsonPackageVersion.values.map((e) => "'$e'").join(',');

    return "INSERT INTO $tableName ($keys) VALUES ($values)";
  }
}
