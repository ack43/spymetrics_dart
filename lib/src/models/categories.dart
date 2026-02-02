// import 'package:json_annotation/json_annotation.dart';

// part 'categories.g.dart';

// @JsonSerializable(fieldRename: FieldRename.snake)
class CategoriesResponse {
  // @JsonKey(includeFromJson: false, includeToJson: false)
  final Map<String, dynamic>? categories;

  const CategoriesResponse({this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(categories: json as Map<String, dynamic>?);

  Map<String, dynamic> toJson() => categories ?? {};
}
