// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertySearchResponse _$PropertySearchResponseFromJson(
        Map<String, dynamic> json) =>
    PropertySearchResponse(
      totalCompounds: (json['total_compounds'] as num).toInt(),
      totalProperties: (json['total_properties'] as num).toInt(),
      totalPropertyGroups: (json['total_property_groups'] as num).toInt(),
      propertyTypes: (json['property_types'] as List<dynamic>)
          .map((e) => PropertyTypeCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      values: (json['values'] as List<dynamic>)
          .map((e) => PropertyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      seoBacklinks: (json['seo_backlinks'] as List<dynamic>)
          .map((e) => SeoBacklink.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchTrackingMsg: json['search_tracking_msg'] as String?,
    );

Map<String, dynamic> _$PropertySearchResponseToJson(
        PropertySearchResponse instance) =>
    <String, dynamic>{
      'total_compounds': instance.totalCompounds,
      'total_properties': instance.totalProperties,
      'total_property_groups': instance.totalPropertyGroups,
      'property_types': instance.propertyTypes,
      'values': instance.values,
      'seo_backlinks': instance.seoBacklinks,
      'search_tracking_msg': instance.searchTrackingMsg,
    };

PropertyTypeCount _$PropertyTypeCountFromJson(Map<String, dynamic> json) =>
    PropertyTypeCount(
      id: (json['id'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$PropertyTypeCountToJson(PropertyTypeCount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
    };

SeoBacklink _$SeoBacklinkFromJson(Map<String, dynamic> json) => SeoBacklink(
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$SeoBacklinkToJson(SeoBacklink instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
    };

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      name: json['name'] as String,
      propertyType:
          PropertyType.fromJson(json['property_type'] as Map<String, dynamic>),
      compound:
          CompoundModel.fromJson(json['compound'] as Map<String, dynamic>),
      area: AreaModel.fromJson(json['area'] as Map<String, dynamic>),
      developer:
          DeveloperModel.fromJson(json['developer'] as Map<String, dynamic>),
      image: json['image'] as String,
      finishing: json['finishing'] as String,
      minUnitArea: (json['min_unit_area'] as num).toInt(),
      maxUnitArea: (json['max_unit_area'] as num).toInt(),
      minPrice: (json['min_price'] as num).toInt(),
      maxPrice: (json['max_price'] as num).toInt(),
      currency: json['currency'] as String,
      maxInstallmentYears: (json['max_installment_years'] as num).toInt(),
      maxInstallmentYearsMonths: json['max_installment_years_months'] as String,
      minInstallments: (json['min_installments'] as num).toInt(),
      minDownPayment: (json['min_down_payment'] as num).toInt(),
      numberOfBathrooms: (json['number_of_bathrooms'] as num).toInt(),
      numberOfBedrooms: (json['number_of_bedrooms'] as num).toInt(),
      minReadyBy: json['min_ready_by'] as String,
      sponsored: (json['sponsored'] as num).toInt(),
      newProperty: json['new_property'] as bool,
      company: json['company'],
      resale: json['resale'] as bool,
      financing: json['financing'] as bool,
      type: json['type'] as String,
      hasOffers: json['has_offers'] as bool,
      offerTitle: json['offer_title'] as String?,
      limitedTimeOffer: json['limited_time_offer'] as bool,
      isCash: json['is_cash'],
      installmentType: json['installment_type'],
      inQuickSearch: (json['in_quick_search'] as num).toInt(),
      recommended: json['recommended'],
      manualRanking: json['manual_ranking'],
      completenessScore: (json['completeness_score'] as num).toInt(),
      favorite: json['favorite'] as bool,
      rankingType: json['ranking_type'] as String?,
      recommendedFinancing: (json['recommended_financing'] as num?)?.toInt(),
      propertyRanking: (json['property_ranking'] as num?)?.toDouble(),
      compoundRanking: (json['compound_ranking'] as num?)?.toInt(),
      tags: json['tags'] as List<dynamic>,
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'property_type': instance.propertyType,
      'compound': instance.compound,
      'area': instance.area,
      'developer': instance.developer,
      'image': instance.image,
      'finishing': instance.finishing,
      'min_unit_area': instance.minUnitArea,
      'max_unit_area': instance.maxUnitArea,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'currency': instance.currency,
      'max_installment_years': instance.maxInstallmentYears,
      'max_installment_years_months': instance.maxInstallmentYearsMonths,
      'min_installments': instance.minInstallments,
      'min_down_payment': instance.minDownPayment,
      'number_of_bathrooms': instance.numberOfBathrooms,
      'number_of_bedrooms': instance.numberOfBedrooms,
      'min_ready_by': instance.minReadyBy,
      'sponsored': instance.sponsored,
      'new_property': instance.newProperty,
      'company': instance.company,
      'resale': instance.resale,
      'financing': instance.financing,
      'type': instance.type,
      'has_offers': instance.hasOffers,
      'offer_title': instance.offerTitle,
      'limited_time_offer': instance.limitedTimeOffer,
      'is_cash': instance.isCash,
      'installment_type': instance.installmentType,
      'in_quick_search': instance.inQuickSearch,
      'recommended': instance.recommended,
      'manual_ranking': instance.manualRanking,
      'completeness_score': instance.completenessScore,
      'favorite': instance.favorite,
      'ranking_type': instance.rankingType,
      'recommended_financing': instance.recommendedFinancing,
      'property_ranking': instance.propertyRanking,
      'compound_ranking': instance.compoundRanking,
      'tags': instance.tags,
    };

PropertyType _$PropertyTypeFromJson(Map<String, dynamic> json) => PropertyType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      manualRanking: (json['manual_ranking'] as num).toInt(),
    );

Map<String, dynamic> _$PropertyTypeToJson(PropertyType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'manual_ranking': instance.manualRanking,
    };

CompoundModel _$CompoundModelFromJson(Map<String, dynamic> json) =>
    CompoundModel(
      id: (json['id'] as num).toInt(),
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      sponsored: (json['sponsored'] as num).toInt(),
      nawyOrganizationId: (json['nawy_organization_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompoundModelToJson(CompoundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'slug': instance.slug,
      'sponsored': instance.sponsored,
      'nawy_organization_id': instance.nawyOrganizationId,
    };

DeveloperModel _$DeveloperModelFromJson(Map<String, dynamic> json) =>
    DeveloperModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      logoPath: json['logo_path'] as String,
    );

Map<String, dynamic> _$DeveloperModelToJson(DeveloperModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo_path': instance.logoPath,
    };
