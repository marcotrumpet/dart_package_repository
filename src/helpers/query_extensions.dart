// ignore_for_file: lines_longer_than_80_chars, prefer_single_quotes

import '../tables/abstract_table.dart';

extension PackageVersionQueryExtensions on AbstractTable<dynamic> {
  String insertQuery(String tableName) {
    final jsonPackageVersion = toJson(this);
    final keys = jsonPackageVersion.keys.join(',');
    final paramsKeys = jsonPackageVersion.keys.map((e) => '@$e').join(',');

    return "INSERT INTO $tableName ($keys) VALUES ($paramsKeys)";
  }

  Map<String, dynamic> getQueryParamValues() {
    final jsonPackageVersion = toJson(this);
    final paramsKeys = jsonPackageVersion.keys.map((e) => e);

    final values = paramsKeys.map((e) => {e: jsonPackageVersion[e]}).reduce(
      (value, element) {
        value.addAll(element);
        return value;
      },
    );

    return values;
  }
}
