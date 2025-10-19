// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompoundModel _$CompoundModelFromJson(Map<String, dynamic> json) =>
    CompoundModel(
      id: (json['id'] as num).toInt(),
      areaId: (json['area_id'] as num?)?.toInt(),
      developerId: (json['developer_id'] as num?)?.toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String?,
      updatedAt: json['updated_at'] as String?,
      imagePath: json['image_path'] as String?,
      nawyOrganizationId: (json['nawy_organization_id'] as num?)?.toInt(),
      hasOffers: json['has_offers'] as bool?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      sponsored: (json['sponsored'] as num?)?.toInt(),
      area: json['area'] == null
          ? null
          : AreaModel.fromJson(json['area'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompoundModelToJson(CompoundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area_id': instance.areaId,
      'developer_id': instance.developerId,
      'name': instance.name,
      'slug': instance.slug,
      'updated_at': instance.updatedAt,
      'image_path': instance.imagePath,
      'nawy_organization_id': instance.nawyOrganizationId,
      'has_offers': instance.hasOffers,
      'lat': instance.lat,
      'long': instance.long,
      'sponsored': instance.sponsored,
      'area': instance.area,
    };
