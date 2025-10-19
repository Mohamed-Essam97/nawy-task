import 'package:json_annotation/json_annotation.dart';

part 'filter_options_model.g.dart';

@JsonSerializable()
class FilterOptionsModel {
  final List<String> finishings;
  @JsonKey(name: 'min_bedrooms')
  final int minBedrooms;
  @JsonKey(name: 'max_bedrooms')
  final int maxBedrooms;
  @JsonKey(name: 'min_bathrooms')
  final int minBathrooms;
  @JsonKey(name: 'max_bathrooms')
  final int maxBathrooms;
  @JsonKey(name: 'min_unit_area')
  final int minUnitArea;
  @JsonKey(name: 'max_unit_area')
  final int maxUnitArea;
  @JsonKey(name: 'min_price')
  final int minPrice;
  @JsonKey(name: 'max_price')
  final int maxPrice;
  @JsonKey(name: 'price_list')
  final List<int> priceList;
  @JsonKey(name: 'min_price_list')
  final List<int> minPriceList;
  @JsonKey(name: 'max_price_list')
  final List<int> maxPriceList;
  @JsonKey(name: 'min_installment_years')
  final int minInstallmentYears;
  @JsonKey(name: 'max_installment_years')
  final int maxInstallmentYears;
  @JsonKey(name: 'installment_years_list')
  final List<int> installmentYearsList;
  @JsonKey(name: 'min_down_payment')
  final int minDownPayment;
  @JsonKey(name: 'max_down_payment')
  final int maxDownPayment;
  @JsonKey(name: 'down_payment_list')
  final List<int> downPaymentList;
  @JsonKey(name: 'min_installments')
  final int minInstallments;
  @JsonKey(name: 'max_installments')
  final int maxInstallments;
  @JsonKey(name: 'installments_list')
  final List<int> installmentsList;
  @JsonKey(name: 'max_ready_by')
  final String maxReadyBy;
  final List<Amenity> amenities;
  final List<dynamic> tags;
  @JsonKey(name: 'property_types')
  final List<PropertyType> propertyTypes;
  final List<Sorting> sortings;
  @JsonKey(name: 'sale_types')
  final List<String> saleTypes;

  FilterOptionsModel({
    required this.finishings,
    required this.minBedrooms,
    required this.maxBedrooms,
    required this.minBathrooms,
    required this.maxBathrooms,
    required this.minUnitArea,
    required this.maxUnitArea,
    required this.minPrice,
    required this.maxPrice,
    required this.priceList,
    required this.minPriceList,
    required this.maxPriceList,
    required this.minInstallmentYears,
    required this.maxInstallmentYears,
    required this.installmentYearsList,
    required this.minDownPayment,
    required this.maxDownPayment,
    required this.downPaymentList,
    required this.minInstallments,
    required this.maxInstallments,
    required this.installmentsList,
    required this.maxReadyBy,
    required this.amenities,
    required this.tags,
    required this.propertyTypes,
    required this.sortings,
    required this.saleTypes,
  });

  factory FilterOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterOptionsModelToJson(this);
}

@JsonSerializable()
class Amenity {
  final int id;
  final String name;
  @JsonKey(name: 'image_path')
  final String? imagePath;

  Amenity({required this.id, required this.name, this.imagePath});

  factory Amenity.fromJson(Map<String, dynamic> json) =>
      _$AmenityFromJson(json);

  Map<String, dynamic> toJson() => _$AmenityToJson(this);
}

@JsonSerializable()
class PropertyType {
  final int id;
  final String name;
  final Icon icon;
  @JsonKey(name: 'has_land_area')
  final bool hasLandArea;
  @JsonKey(name: 'has_mandatory_garden_area')
  final bool hasMandatoryGardenArea;

  PropertyType({
    required this.id,
    required this.name,
    required this.icon,
    required this.hasLandArea,
    required this.hasMandatoryGardenArea,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyTypeToJson(this);
}

@JsonSerializable()
class Icon {
  final String url;

  Icon({required this.url});

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

  Map<String, dynamic> toJson() => _$IconToJson(this);
}

@JsonSerializable()
class Sorting {
  final String key;
  final String value;
  final String direction;

  Sorting({required this.key, required this.value, required this.direction});

  factory Sorting.fromJson(Map<String, dynamic> json) =>
      _$SortingFromJson(json);

  Map<String, dynamic> toJson() => _$SortingToJson(this);
}
