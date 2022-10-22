// ignore_for_file: lines_longer_than_80_chars, prefer_single_quotes

import '../tables/packages.dart';
import '../tables/packages_versions.dart';

extension PackageVersionQueryExtensions on PackageVersion {
  String insertQuery() {
    final jsonPackageVersion = toJson(this);
    final keys = jsonPackageVersion.keys.join(',');
    final values = jsonPackageVersion.values.map((e) => "'$e'").join(',');

    return "INSERT INTO packages_versions ($keys) VALUES ($values)";
  }
}

extension PackagesQueryExtensions on Packages {
  String insertQuery() {
    final jsonPackageVersion = toJson(this);
    final keys = jsonPackageVersion.keys.join(',');
    final values = jsonPackageVersion.values.map((e) => "'$e'").join(',');

    return "INSERT INTO packages ($keys) VALUES ($values)";
  }
}
