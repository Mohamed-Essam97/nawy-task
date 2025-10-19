import 'package:json_annotation/json_annotation.dart';
import 'package:nawy_search_app/data/models/area_model.dart';
import 'package:nawy_search_app/data/models/compound_model.dart';

part 'property_model.g.dart';

@JsonSerializable()
class PropertySearchResponse {
  @JsonKey(name: 'total_compounds')
  final int totalCompounds;
  @JsonKey(name: 'total_properties')
  final int totalProperties;
  @JsonKey(name: 'total_property_groups')
  final int totalPropertyGroups;
  @JsonKey(name: 'property_types')
  final List<PropertyTypeCount> propertyTypes;
  final List<PropertyModel> values;
  @JsonKey(name: 'seo_backlinks')
  final List<SeoBacklink> seoBacklinks;
  @JsonKey(name: 'search_tracking_msg')
  final String? searchTrackingMsg;

  PropertySearchResponse({
    required this.totalCompounds,
    required this.totalProperties,
    required this.totalPropertyGroups,
    required this.propertyTypes,
    required this.values,
    required this.seoBacklinks,
    this.searchTrackingMsg,
  });

  factory PropertySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertySearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PropertySearchResponseToJson(this);
}

@JsonSerializable()
class PropertyTypeCount {
  final int id;
  final int count;

  PropertyTypeCount({required this.id, required this.count});

  factory PropertyTypeCount.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeCountFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyTypeCountToJson(this);
}

@JsonSerializable()
class SeoBacklink {
  final String name;
  final String slug;

  SeoBacklink({required this.name, required this.slug});

  factory SeoBacklink.fromJson(Map<String, dynamic> json) =>
      _$SeoBacklinkFromJson(json);

  Map<String, dynamic> toJson() => _$SeoBacklinkToJson(this);
}

@JsonSerializable()
class PropertyModel {
  final int id;
  final String slug;
  final String name;
  @JsonKey(name: 'property_type')
  final PropertyType propertyType;
  final CompoundModel compound;
  final AreaModel area;
  final DeveloperModel developer;
  final String image;
  final String finishing;
  @JsonKey(name: 'min_unit_area')
  final int minUnitArea;
  @JsonKey(name: 'max_unit_area')
  final int maxUnitArea;
  @JsonKey(name: 'min_price')
  final int minPrice;
  @JsonKey(name: 'max_price')
  final int maxPrice;
  final String currency;
  @JsonKey(name: 'max_installment_years')
  final int maxInstallmentYears;
  @JsonKey(name: 'max_installment_years_months')
  final String maxInstallmentYearsMonths;
  @JsonKey(name: 'min_installments')
  final int minInstallments;
  @JsonKey(name: 'min_down_payment')
  final int minDownPayment;
  @JsonKey(name: 'number_of_bathrooms')
  final int numberOfBathrooms;
  @JsonKey(name: 'number_of_bedrooms')
  final int numberOfBedrooms;
  @JsonKey(name: 'min_ready_by')
  final String minReadyBy;
  final int sponsored;
  @JsonKey(name: 'new_property')
  final bool newProperty;
  final dynamic company;
  final bool resale;
  final bool financing;
  final String type;
  @JsonKey(name: 'has_offers')
  final bool hasOffers;
  @JsonKey(name: 'offer_title')
  final String? offerTitle;
  @JsonKey(name: 'limited_time_offer')
  final bool limitedTimeOffer;
  @JsonKey(name: 'is_cash')
  final dynamic isCash;
  @JsonKey(name: 'installment_type')
  final dynamic installmentType;
  @JsonKey(name: 'in_quick_search')
  final int inQuickSearch;
  final dynamic recommended;
  @JsonKey(name: 'manual_ranking')
  final dynamic manualRanking;
  @JsonKey(name: 'completeness_score')
  final int completenessScore;
  final bool favorite;
  @JsonKey(name: 'ranking_type')
  final String? rankingType;
  @JsonKey(name: 'recommended_financing')
  final int? recommendedFinancing;
  @JsonKey(name: 'property_ranking')
  final double? propertyRanking;
  @JsonKey(name: 'compound_ranking')
  final int? compoundRanking;
  final List<dynamic> tags;

  PropertyModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.propertyType,
    required this.compound,
    required this.area,
    required this.developer,
    required this.image,
    required this.finishing,
    required this.minUnitArea,
    required this.maxUnitArea,
    required this.minPrice,
    required this.maxPrice,
    required this.currency,
    required this.maxInstallmentYears,
    required this.maxInstallmentYearsMonths,
    required this.minInstallments,
    required this.minDownPayment,
    required this.numberOfBathrooms,
    required this.numberOfBedrooms,
    required this.minReadyBy,
    required this.sponsored,
    required this.newProperty,
    this.company,
    required this.resale,
    required this.financing,
    required this.type,
    required this.hasOffers,
    this.offerTitle,
    required this.limitedTimeOffer,
    this.isCash,
    this.installmentType,
    required this.inQuickSearch,
    this.recommended,
    this.manualRanking,
    required this.completenessScore,
    required this.favorite,
    this.rankingType,
    this.recommendedFinancing,
    this.propertyRanking,
    this.compoundRanking,
    required this.tags,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}

@JsonSerializable()
class PropertyType {
  final int id;
  final String name;
  @JsonKey(name: 'manual_ranking')
  final int manualRanking;

  PropertyType({
    required this.id,
    required this.name,
    required this.manualRanking,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyTypeToJson(this);
}

@JsonSerializable()
class DeveloperModel {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'logo_path')
  final String logoPath;

  DeveloperModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.logoPath,
  });

  factory DeveloperModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperModelToJson(this);
}
