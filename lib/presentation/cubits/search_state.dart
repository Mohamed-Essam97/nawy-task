import 'package:equatable/equatable.dart';
import 'package:nawy_search_app/data/models/area_model.dart';
import 'package:nawy_search_app/data/models/compound_model.dart';
import 'package:nawy_search_app/data/models/filter_options_model.dart';
import 'package:nawy_search_app/data/models/property_model.dart'
    hide CompoundModel;

enum SearchStatus { initial, loading, success, error }

class SearchState extends Equatable {
  final SearchStatus status;
  final List<AreaModel> areas;
  final List<CompoundModel> compounds;
  final FilterOptionsModel? filterOptions;
  final List<PropertyModel> searchResults;
  final String? errorMessage;
  final List<int> favoritePropertyIds;

  // Selected filters
  final AreaModel? selectedArea;
  final CompoundModel? selectedCompound;
  final double? selectedMinPrice;
  final double? selectedMaxPrice;
  final int? minBedrooms;
  final int? maxBedrooms;

  const SearchState({
    this.status = SearchStatus.initial,
    this.areas = const [],
    this.compounds = const [],
    this.filterOptions,
    this.searchResults = const [],
    this.errorMessage,
    this.favoritePropertyIds = const [],
    this.selectedArea,
    this.selectedCompound,
    this.selectedMinPrice,
    this.selectedMaxPrice,
    this.minBedrooms,
    this.maxBedrooms,
  });

  SearchState copyWith({
    SearchStatus? status,
    List<AreaModel>? areas,
    List<CompoundModel>? compounds,
    FilterOptionsModel? filterOptions,
    List<PropertyModel>? searchResults,
    String? errorMessage,
    List<int>? favoritePropertyIds,
    AreaModel? selectedArea,
    CompoundModel? selectedCompound,
    double? selectedMinPrice,
    double? selectedMaxPrice,
    int? minBedrooms,
    int? maxBedrooms,
  }) {
    return SearchState(
      status: status ?? this.status,
      areas: areas ?? this.areas,
      compounds: compounds ?? this.compounds,
      filterOptions: filterOptions ?? this.filterOptions,
      searchResults: searchResults ?? this.searchResults,
      errorMessage: errorMessage,
      favoritePropertyIds: favoritePropertyIds ?? this.favoritePropertyIds,
      selectedArea: selectedArea ?? this.selectedArea,
      selectedCompound: selectedCompound ?? this.selectedCompound,
      selectedMinPrice: selectedMinPrice ?? this.selectedMinPrice,
      selectedMaxPrice: selectedMaxPrice ?? this.selectedMaxPrice,
      minBedrooms: minBedrooms ?? this.minBedrooms,
      maxBedrooms: maxBedrooms ?? this.maxBedrooms,
    );
  }

  @override
  List<Object?> get props => [
    status,
    areas,
    compounds,
    filterOptions,
    searchResults,
    errorMessage,
    favoritePropertyIds,
    selectedArea,
    selectedCompound,
    selectedMinPrice,
    selectedMaxPrice,
    minBedrooms,
    maxBedrooms,
  ];
}
