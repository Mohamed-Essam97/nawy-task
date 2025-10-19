import 'package:json_annotation/json_annotation.dart';

part 'area_model.g.dart';

@JsonSerializable()
class AreaModel {
  final int id;
  final String name;
  final String? slug;
  @JsonKey(name: 'all_slugs')
  final AllSlugs? allSlugs;

  AreaModel({required this.id, required this.name, this.slug, this.allSlugs});

  factory AreaModel.fromJson(Map<String, dynamic> json) =>
      _$AreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}

@JsonSerializable()
class AllSlugs {
  final String en;
  final String ar;

  AllSlugs({required this.en, required this.ar});

  factory AllSlugs.fromJson(Map<String, dynamic> json) =>
      _$AllSlugsFromJson(json);

  Map<String, dynamic> toJson() => _$AllSlugsToJson(this);
}
