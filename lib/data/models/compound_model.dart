import 'package:json_annotation/json_annotation.dart';
import 'package:nawy_search_app/data/models/area_model.dart';

part 'compound_model.g.dart';

@JsonSerializable()
class CompoundModel {
  final int id;
  @JsonKey(name: 'area_id')
  final int? areaId;
  @JsonKey(name: 'developer_id')
  final int? developerId;
  final String name;
  final String? slug;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @JsonKey(name: 'nawy_organization_id')
  final int? nawyOrganizationId;
  @JsonKey(name: 'has_offers')
  final bool? hasOffers;
  final double? lat;
  final double? long;
  final int? sponsored;
  final AreaModel? area;

  CompoundModel({
    required this.id,
    this.areaId,
    this.developerId,
    required this.name,
    this.slug,
    this.updatedAt,
    this.imagePath,
    this.nawyOrganizationId,
    this.hasOffers,
    this.lat,
    this.long,
    this.sponsored,
    this.area,
  });

  factory CompoundModel.fromJson(Map<String, dynamic> json) =>
      _$CompoundModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompoundModelToJson(this);
}
