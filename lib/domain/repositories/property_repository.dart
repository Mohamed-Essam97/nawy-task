import 'package:nawy_search_app/data/models/area_model.dart';
import 'package:nawy_search_app/data/models/compound_model.dart';
import 'package:nawy_search_app/data/models/filter_options_model.dart';
import 'package:nawy_search_app/data/models/property_model.dart'
    hide CompoundModel;

abstract class PropertyRepository {
  Future<List<CompoundModel>> getCompounds();
  Future<List<AreaModel>> getAreas();
  Future<FilterOptionsModel> getFilterOptions();
  Future<List<PropertyModel>> searchProperties({
    int? areaId,
    int? compoundId,
    double? minPrice,
    double? maxPrice,
    int? numberOfBedrooms,
  });
  Future<List<int>> getFavoritePropertyIds();
  Future<void> toggleFavoriteProperty(int propertyId);
}
