// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) => AreaModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String?,
      allSlugs: json['all_slugs'] == null
          ? null
          : AllSlugs.fromJson(json['all_slugs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'all_slugs': instance.allSlugs,
    };

AllSlugs _$AllSlugsFromJson(Map<String, dynamic> json) => AllSlugs(
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$AllSlugsToJson(AllSlugs instance) => <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };
