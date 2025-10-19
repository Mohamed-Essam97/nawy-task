import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy_search_app/data/models/property_model.dart';
import 'package:nawy_search_app/presentation/cubits/search_cubit.dart';
import 'package:nawy_search_app/presentation/cubits/search_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
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
                    size: 64,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Properties you favorite will appear here',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: favoritedProperties.length,
            itemBuilder: (context, index) {
              final property = favoritedProperties[index];
              return FavoritePropertyCard(
                property: property,
                onFavoritePressed: () {
                  context.read<SearchCubit>().toggleFavorite(property.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class FavoritePropertyCard extends StatelessWidget {
  final PropertyModel property;
  final VoidCallback onFavoritePressed;

  const FavoritePropertyCard({
    super.key,
    required this.property,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  property.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 50),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: onFavoritePressed,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      property.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Delivery ${property.minReadyBy}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  'EGP ${property.minPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'EGP ${property.minInstallments.toStringAsFixed(2)}/month',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Icon(Icons.bed, size: 20),
                    const SizedBox(width: 4),
                    Text('${property.numberOfBedrooms}'),
                    const SizedBox(width: 16),
                    const Icon(Icons.bathtub_outlined, size: 20),
                    const SizedBox(width: 4),
                    Text('${property.numberOfBathrooms}'),
                    const SizedBox(width: 16),
                    const Icon(Icons.square_foot, size: 20),
                    const SizedBox(width: 4),
                    Text('${property.minUnitArea} m²'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
