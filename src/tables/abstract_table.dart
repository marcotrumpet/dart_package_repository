abstract class AbstractTable<T> {
  AbstractTable<T> fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T pv);
}
