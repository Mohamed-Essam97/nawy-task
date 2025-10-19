import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy_search_app/core/theme/app_theme.dart';
import 'package:nawy_search_app/presentation/cubits/search_cubit.dart';
import 'package:nawy_search_app/presentation/cubits/search_state.dart';
import 'package:nawy_search_app/presentation/widgets/compound_card.dart';
import 'package:nawy_search_app/presentation/widgets/property_card.dart';
import 'package:nawy_search_app/presentation/widgets/search_filters.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Results'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(140.0),
            child: Column(
              children: [
                SearchFilters(),
                TabBar(
                  tabs: [
                    Tab(text: 'PROPERTIES'),
                    Tab(text: 'COMPOUNDS'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [_PropertiesTab(), _CompoundsTab()]),
      ),
    );
  }
}

class _PropertiesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.status == SearchStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == SearchStatus.error) {
          return Center(
            child: Text(
              state.errorMessage ?? 'An error occurred',
              style: AppTheme.bodyLarge.copyWith(color: Colors.red),
            ),
          );
        }

        if (state.searchResults.isEmpty) {
          return const Center(
            child: Text('No properties found', style: AppTheme.bodyLarge),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            // Determine if we're on a tablet/desktop
            final isWideScreen =
                constraints.maxWidth >= AppTheme.tabletBreakpoint;

            if (isWideScreen) {
              // Grid layout for tablet/desktop
              return GridView.builder(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: AppTheme.gridSpacing,
                  mainAxisSpacing: AppTheme.gridSpacing,
                ),
                itemCount: state.searchResults.length,
                itemBuilder: (context, index) {
                  final property = state.searchResults[index];
                  return PropertyCard(property: property);
                },
              );
            }

            // List layout for mobile
            return ListView.builder(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              itemCount: state.searchResults.length,
              itemBuilder: (context, index) {
                final property = state.searchResults[index];
                return PropertyCard(property: property);
              },
            );
          },
        );
      },
    );
  }
}

class _CompoundsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.status == SearchStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == SearchStatus.error) {
          return Center(
            child: Text(
              state.errorMessage ?? 'An error occurred',
              style: AppTheme.bodyLarge.copyWith(color: Colors.red),
            ),
          );
        }

        final compounds = state.searchResults
            .map((property) => property.compound)
            .toSet()
            .toList();

        if (compounds.isEmpty) {
          return const Center(
            child: Text('No compounds found', style: AppTheme.bodyLarge),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final isWideScreen =
                constraints.maxWidth >= AppTheme.tabletBreakpoint;

            if (isWideScreen) {
              return GridView.builder(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: AppTheme.gridSpacing,
                  mainAxisSpacing: AppTheme.gridSpacing,
                ),
                itemCount: compounds.length,
                itemBuilder: (context, index) {
                  final compound = compounds[index];
                  final compoundProperties = state.searchResults
                      .where((p) => p.compound.id == compound.id)
                      .toList();

                  return CompoundCard(
                    compound: compound,
                    propertiesCount: compoundProperties.length,
                    onTap: () => context.read<SearchCubit>().searchProperties(),
                  );
                },
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              itemCount: compounds.length,
              itemBuilder: (context, index) {
                final compound = compounds[index];
                final compoundProperties = state.searchResults
                    .where((p) => p.compound.id == compound.id)
                    .toList();

                return CompoundCard(
                  compound: compound,
                  propertiesCount: compoundProperties.length,
                  onTap: () => context.read<SearchCubit>().searchProperties(),
                );
              },
            );
          },
        );
      },
    );
  }
}
