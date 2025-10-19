import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy_search_app/data/models/area_model.dart';
import 'package:nawy_search_app/data/models/compound_model.dart';
import 'package:nawy_search_app/domain/repositories/property_repository.dart';
import 'package:nawy_search_app/presentation/cubits/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final PropertyRepository _propertyRepository;

  SearchCubit(this._propertyRepository) : super(const SearchState());

  Future<void> loadInitialData() async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));

      final areas = await _propertyRepository.getAreas();
      final compounds = await _propertyRepository.getCompounds();
      final filterOptions = await _propertyRepository.getFilterOptions();
      final favoriteIds = await _propertyRepository.getFavoritePropertyIds();

      emit(
        state.copyWith(
          status: SearchStatus.success,
          areas: areas,
          compounds: compounds,
          filterOptions: filterOptions,
          favoritePropertyIds: favoriteIds,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: SearchStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> searchProperties() async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));

      final results = await _propertyRepository.searchProperties(
        areaId: state.selectedArea?.id,
        compoundId: state.selectedCompound?.id,
        minPrice: state.selectedMinPrice,
        maxPrice: state.selectedMaxPrice,
        numberOfBedrooms: state.maxBedrooms,
      );

      emit(
        state.copyWith(status: SearchStatus.success, searchResults: results),
      );
    } catch (e) {
      emit(
        state.copyWith(status: SearchStatus.error, errorMessage: e.toString()),
      );
    }
  }

  void selectArea(AreaModel? area) {
    emit(state.copyWith(selectedArea: area));
  }

  void selectCompound(CompoundModel? compound) {
    emit(state.copyWith(selectedCompound: compound));
  }

  void selectPriceRange(double? minPrice, double? maxPrice) {
    emit(
      state.copyWith(selectedMinPrice: minPrice, selectedMaxPrice: maxPrice),
    );
  }

  void selectBedroomRange(int? minBedrooms, int? maxBedrooms) {
    emit(state.copyWith(minBedrooms: minBedrooms, maxBedrooms: maxBedrooms));
  }

  Future<void> toggleFavorite(int propertyId) async {
    await _propertyRepository.toggleFavoriteProperty(propertyId);
    final favoriteIds = await _propertyRepository.getFavoritePropertyIds();
    emit(state.copyWith(favoritePropertyIds: favoriteIds));
  }

  void resetFilters() {
    emit(
      state.copyWith(
        selectedArea: null,
        selectedCompound: null,
        selectedMinPrice: null,
        selectedMaxPrice: null,
        minBedrooms: null,
        maxBedrooms: null,
      ),
    );
  }
}
