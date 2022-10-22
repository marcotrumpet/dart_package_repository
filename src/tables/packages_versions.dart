import 'abstract_table.dart';

class PackageVersion implements AbstractTable {
  PackageVersion({
    required this.packageId,
    required this.version,
    required this.archiveUrl,
    required this.retracted,
    required this.pubspec,
  });

  final String packageId;
  final String version;
  final String archiveUrl;
  final bool retracted;
  final String pubspec;

  PackageVersion fromJson(Map<String, dynamic> json) {
    return PackageVersion(
      packageId: json['package_id'] as String,
      version: json['version'] as String,
      archiveUrl: json['archive_url'] as String,
      retracted: json['retracted'] as bool,
      pubspec: json['pubspec'] as String,
    );
  }

  Map<String, dynamic> toJson(PackageVersion pv) {
    return {
      'package_id': pv.packageId,
      'version': pv.version,
      'archive_url': pv.archiveUrl,
      'retracted': pv.retracted,
      'pubspec': pv.pubspec,
    };
  }
}
