import 'package:flutter/material.dart';
import 'package:nawy_search_app/core/theme/app_theme.dart';

class SearchFilters extends StatelessWidget {
  const SearchFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildFilterChips()]);
  }

  Widget _buildFilterChips() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _FilterChip(
              label: 'City, Governorate',
              onSelected: (selected) {
                // TODO: Implement filter selection
              },
            ),
            const SizedBox(width: AppTheme.spacingS),
            _FilterChip(
              label: 'Compound name',
              onSelected: (selected) {
                // TODO: Implement filter selection
              },
            ),
            const SizedBox(width: AppTheme.spacingS),
            _FilterChip(
              label: 'Apartment',
              onSelected: (selected) {
                // TODO: Implement filter selection
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final ValueChanged<bool> onSelected;

  const _FilterChip({required this.label, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      onSelected: onSelected,
      selected: false,
      backgroundColor: AppTheme.primaryBlue,
      selectedColor: AppTheme.primaryBlue,
      labelStyle: const TextStyle(color: AppTheme.background),
      showCheckmark: false,
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
    );
  }
}
