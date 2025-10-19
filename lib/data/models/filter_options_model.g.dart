// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterOptionsModel _$FilterOptionsModelFromJson(Map<String, dynamic> json) =>
    FilterOptionsModel(
      finishings: (json['finishings'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      minBedrooms: (json['min_bedrooms'] as num).toInt(),
      maxBedrooms: (json['max_bedrooms'] as num).toInt(),
      minBathrooms: (json['min_bathrooms'] as num).toInt(),
      maxBathrooms: (json['max_bathrooms'] as num).toInt(),
      minUnitArea: (json['min_unit_area'] as num).toInt(),
      maxUnitArea: (json['max_unit_area'] as num).toInt(),
      minPrice: (json['min_price'] as num).toInt(),
      maxPrice: (json['max_price'] as num).toInt(),
      priceList: (json['price_list'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      minPriceList: (json['min_price_list'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      maxPriceList: (json['max_price_list'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      minInstallmentYears: (json['min_installment_years'] as num).toInt(),
      maxInstallmentYears: (json['max_installment_years'] as num).toInt(),
      installmentYearsList: (json['installment_years_list'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      minDownPayment: (json['min_down_payment'] as num).toInt(),
      maxDownPayment: (json['max_down_payment'] as num).toInt(),
      downPaymentList: (json['down_payment_list'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      minInstallments: (json['min_installments'] as num).toInt(),
      maxInstallments: (json['max_installments'] as num).toInt(),
      installmentsList: (json['installments_list'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      maxReadyBy: json['max_ready_by'] as String,
      amenities: (json['amenities'] as List<dynamic>)
          .map((e) => Amenity.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: json['tags'] as List<dynamic>,
      propertyTypes: (json['property_types'] as List<dynamic>)
          .map((e) => PropertyType.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortings: (json['sortings'] as List<dynamic>)
          .map((e) => Sorting.fromJson(e as Map<String, dynamic>))
          .toList(),
      saleTypes: (json['sale_types'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FilterOptionsModelToJson(FilterOptionsModel instance) =>
    <String, dynamic>{
      'finishings': instance.finishings,
      'min_bedrooms': instance.minBedrooms,
      'max_bedrooms': instance.maxBedrooms,
      'min_bathrooms': instance.minBathrooms,
      'max_bathrooms': instance.maxBathrooms,
      'min_unit_area': instance.minUnitArea,
      'max_unit_area': instance.maxUnitArea,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'price_list': instance.priceList,
      'min_price_list': instance.minPriceList,
      'max_price_list': instance.maxPriceList,
      'min_installment_years': instance.minInstallmentYears,
      'max_installment_years': instance.maxInstallmentYears,
      'installment_years_list': instance.installmentYearsList,
      'min_down_payment': instance.minDownPayment,
      'max_down_payment': instance.maxDownPayment,
      'down_payment_list': instance.downPaymentList,
      'min_installments': instance.minInstallments,
      'max_installments': instance.maxInstallments,
      'installments_list': instance.installmentsList,
      'max_ready_by': instance.maxReadyBy,
      'amenities': instance.amenities,
      'tags': instance.tags,
      'property_types': instance.propertyTypes,
      'sortings': instance.sortings,
      'sale_types': instance.saleTypes,
    };

Amenity _$AmenityFromJson(Map<String, dynamic> json) => Amenity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imagePath: json['image_path'] as String?,
    );

Map<String, dynamic> _$AmenityToJson(Amenity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_path': instance.imagePath,
    };

PropertyType _$PropertyTypeFromJson(Map<String, dynamic> json) => PropertyType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: Icon.fromJson(json['icon'] as Map<String, dynamic>),
      hasLandArea: json['has_land_area'] as bool,
      hasMandatoryGardenArea: json['has_mandatory_garden_area'] as bool,
    );

Map<String, dynamic> _$PropertyTypeToJson(PropertyType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'has_land_area': instance.hasLandArea,
      'has_mandatory_garden_area': instance.hasMandatoryGardenArea,
    };

Icon _$IconFromJson(Map<String, dynamic> json) => Icon(
      url: json['url'] as String,
    );

Map<String, dynamic> _$IconToJson(Icon instance) => <String, dynamic>{
      'url': instance.url,
    };

Sorting _$SortingFromJson(Map<String, dynamic> json) => Sorting(
      key: json['key'] as String,
      value: json['value'] as String,
      direction: json['direction'] as String,
    );

Map<String, dynamic> _$SortingToJson(Sorting instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'direction': instance.direction,
    };
