import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy_search_app/data/models/area_model.dart';
import 'package:nawy_search_app/data/models/compound_model.dart';
import 'package:nawy_search_app/presentation/cubits/search_cubit.dart';
import 'package:nawy_search_app/presentation/cubits/search_state.dart';
import 'package:nawy_search_app/presentation/screens/search_results_screen.dart';
import 'package:nawy_search_app/presentation/widgets/custom_range_slider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<SearchCubit>().resetFilters();
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.status == SearchStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == SearchStatus.error) {
            return Center(
              child: Text(state.errorMessage ?? 'An error occurred'),
            );
          }

          if (state.filterOptions == null) {
            return const Center(child: Text('No filter options available'));
          }

          final minBedrooms = state.filterOptions!.minBedrooms.toDouble();
          final maxBedrooms = state.filterOptions!.maxBedrooms.toDouble();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Search input field with suggestions
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const [];
                    }
                    final query = textEditingValue.text.toLowerCase();

                    // Combine all searchable items
                    final suggestions = [
                      ...state.areas.map((area) => area.name),
                      ...state.compounds.map((compound) => compound.name),
                      // Add developer names if available in your models
                    ];

                    return suggestions.where(
                      (suggestion) => suggestion.toLowerCase().contains(query),
                    );
                  },
                  onSelected: (String selection) {
                    // Find matching area
                    final area = state.areas.firstWhere(
                      (area) => area.name == selection,
                      orElse: () {
                        return AreaModel(id: 0, name: '');
                      },
                    );
                    context.read<SearchCubit>().selectArea(area);
                    return;
                  },
                  fieldViewBuilder:
                      (
                        BuildContext context,
                        TextEditingController textEditingController,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted,
                      ) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: 'Search by Area, Compound, or Developer',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: textEditingController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      textEditingController.clear();
                                      context
                                          .read<SearchCubit>()
                                          .resetFilters();
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onSubmitted: (String value) {
                            if (value.isNotEmpty) {
                              // Handle direct search without selection
                              final area = state.areas.firstWhere(
                                (area) => area.name.toLowerCase().contains(
                                  value.toLowerCase(),
                                ),
                                orElse: () {
                                  return AreaModel(id: 0, name: '');
                                },
                              );
                              context.read<SearchCubit>().selectArea(area);

                              final compound = state.compounds.firstWhere(
                                (compound) => compound.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()),
                                orElse: () {
                                  return CompoundModel(id: 0, name: '');
                                },
                              );
                              context.read<SearchCubit>().selectCompound(
                                compound,
                              );
                            }
                          },
                        );
                      },
                ),
                const SizedBox(height: 16.0),

                // Price range slider
                CustomRangeSlider(
                  title: 'Price Range',
                  minValue: state.filterOptions!.minPriceList.first.toDouble(),
                  maxValue: state.filterOptions!.maxPriceList.last.toDouble(),
                  currentMinValue:
                      state.selectedMinPrice ??
                      state.filterOptions!.minPriceList.first.toDouble(),
                  currentMaxValue:
                      state.selectedMaxPrice ??
                      state.filterOptions!.maxPriceList.last.toDouble(),
                  divisions: state.filterOptions!.maxPriceList.length - 1,
                  subtitle:
                      '${state.selectedMinPrice?.toInt() ?? state.filterOptions!.minPriceList.first} ~ ${state.selectedMaxPrice?.toInt() ?? state.filterOptions!.maxPriceList.last} EGP',
                  onChanged: (values) {
                    context.read<SearchCubit>().selectPriceRange(
                      values.start,
                      values.end,
                    );
                  },
                ),
                const SizedBox(height: 16.0),

                // Number of rooms
                CustomRangeSlider(
                  title: 'Rooms',
                  minValue: minBedrooms,
                  maxValue: maxBedrooms,
                  currentMinValue: state.minBedrooms?.toDouble() ?? minBedrooms,
                  currentMaxValue: state.maxBedrooms?.toDouble() ?? maxBedrooms,
                  onChanged: (values) {
                    context.read<SearchCubit>().selectBedroomRange(
                      values.start.toInt(),
                      values.end.toInt(),
                    );
                  },
                ),
                const SizedBox(height: 24.0),

                // Search button
                BlocListener<SearchCubit, SearchState>(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (state.status == SearchStatus.success &&
                        state.searchResults.isNotEmpty) {
                      final cubit = context.read<SearchCubit>();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: cubit,
                            child: const SearchResultsScreen(),
                          ),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.status == SearchStatus.loading
                            ? null
                            : () {
                                context.read<SearchCubit>().searchProperties();
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: state.status == SearchStatus.loading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : const Text(
                                'Show Results',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
