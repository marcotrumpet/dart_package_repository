import 'abstract_table.dart';

class Packages implements AbstractTable {
  Packages({
    required this.name,
    this.isDiscontinued = false,
    this.replacedBy,
    required this.latestVersion,
    required this.packageId,
  });

  final String name;
  final bool isDiscontinued;
  final String? replacedBy;
  final String latestVersion;
  final String packageId;

  Packages fromJson(Map<String, dynamic> json) {
    return Packages(
      name: json['name'] as String,
      isDiscontinued: json['is_discontinued'] as bool,
      replacedBy: json['replacedBy'] as String,
      latestVersion: json['latest_version'] as String,
      packageId: json['package_id'] as String,
    );
  }

  Map<String, dynamic> toJson(Packages pv) {
    return {
      'name': pv.name,
      'is_discontinued': pv.isDiscontinued,
      if (pv.replacedBy != null) 'replacedBy': pv.replacedBy,
      'latest_version': pv.latestVersion,
      'package_id': pv.packageId,
    };
  }
}
