import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy_search_app/core/theme/app_theme.dart';
import 'package:nawy_search_app/presentation/cubits/search_cubit.dart';
import 'package:nawy_search_app/presentation/cubits/search_state.dart';
import 'package:nawy_search_app/presentation/widgets/property_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          // Get favorited properties
          final favoritedProperties = state.searchResults
              .where(
                (property) => state.favoritePropertyIds.contains(property.id),
              )
              .toList();

          if (favoritedProperties.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: AppTheme.iconSizeL * 2,
                    color: AppTheme.primaryBlue.withOpacity(0.5),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text('No favorites yet', style: AppTheme.headingLarge),
                  const SizedBox(height: AppTheme.spacingS),
                  Text(
                    'Properties you favorite will appear here',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
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
                    childAspectRatio: 1.2,
                    crossAxisSpacing: AppTheme.gridSpacing,
                    mainAxisSpacing: AppTheme.gridSpacing,
                  ),
                  itemCount: favoritedProperties.length,
                  itemBuilder: (context, index) {
                    final property = favoritedProperties[index];
                    return PropertyCard(property: property);
                  },
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                itemCount: favoritedProperties.length,
                itemBuilder: (context, index) {
                  final property = favoritedProperties[index];
                  return PropertyCard(property: property);
                },
              );
            },
          );
        },
      ),
    );
  }
}
