import 'package:dio/dio.dart';
import 'package:nawy_search_app/core/services/preferences_service.dart';
import 'package:nawy_search_app/data/models/area_model.dart';
import 'package:nawy_search_app/data/models/compound_model.dart';
import 'package:nawy_search_app/data/models/filter_options_model.dart';
import 'package:nawy_search_app/data/models/property_model.dart'
    hide CompoundModel;
import 'package:nawy_search_app/domain/repositories/property_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  final Dio _dio;
  static const String _favoritesKey = 'favorite_property_ids';
  static const String _baseUrl =
      "https://hiring-tasks.github.io/mobile-app-apis";

  PropertyRepositoryImpl() : _dio = Dio() {
    _initializeDio();
  }

  void _initializeDio() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  @override
  Future<List<CompoundModel>> getCompounds() async {
    try {
      final response = await _dio.get('$_baseUrl/compounds.json');
      return (response.data as List)
          .map((json) => CompoundModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Failed to fetch compounds: $e');
      return [];
    }
  }

  @override
  Future<List<AreaModel>> getAreas() async {
    try {
      final response = await _dio.get('$_baseUrl/areas.json');
      return (response.data as List)
          .map((json) => AreaModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Failed to fetch areas: $e');
      return [];
    }
  }

  @override
  Future<FilterOptionsModel> getFilterOptions() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/properties-get-filter-options.json',
      );
      return FilterOptionsModel.fromJson(response.data);
    } catch (e) {
      print('Failed to fetch filter options: $e');
      throw Exception('Failed to fetch filter options');
    }
  }

  @override
  Future<List<PropertyModel>> searchProperties({
    int? areaId,
    int? compoundId,
    double? minPrice,
    double? maxPrice,
    int? numberOfBedrooms,
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/properties-search.json',
        queryParameters: {
          if (areaId != null) 'area_id': areaId,
          if (compoundId != null) 'compound_id': compoundId,
          if (minPrice != null) 'min_price': minPrice,
          if (maxPrice != null) 'max_price': maxPrice,
          if (numberOfBedrooms != null) 'bedrooms': numberOfBedrooms,
        },
      );

      // Extract the 'values' array from the response
      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> properties = responseData['values'] ?? [];

      return properties.map((json) => PropertyModel.fromJson(json)).toList();
    } catch (e) {
      print('Failed to search properties: $e');
      return [];
    }
  }

  @override
  Future<List<int>> getFavoritePropertyIds() async {
    final favorites = PreferencesService.getStringList(_favoritesKey);
    return favorites.map((id) => int.parse(id)).toList();
  }

  @override
  Future<void> toggleFavoriteProperty(int propertyId) async {
    final favorites = await getFavoritePropertyIds();
    if (favorites.contains(propertyId)) {
      favorites.remove(propertyId);
    } else {
      favorites.add(propertyId);
    }
    await PreferencesService.setStringList(
      _favoritesKey,
      favorites.map((id) => id.toString()).toList(),
    );
  }
}
