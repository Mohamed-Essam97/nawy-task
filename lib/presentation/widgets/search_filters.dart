import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy_search_app/core/theme/app_theme.dart';
import 'package:nawy_search_app/presentation/cubits/search_cubit.dart';
import 'package:nawy_search_app/presentation/cubits/search_state.dart';

class SearchFilters extends StatelessWidget {
  const SearchFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildSelectedFilters()]);
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

  Widget _buildSelectedFilters() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                if (state.selectedArea != null)
                  _SelectedFilter(
                    label: state.selectedArea!.name,
                    onDeleted: () =>
                        context.read<SearchCubit>().selectArea(null),
                  ),
                if (state.selectedCompound != null)
                  Padding(
                    padding: const EdgeInsets.only(left: AppTheme.spacingS),
                    child: _SelectedFilter(
                      label: state.selectedCompound!.name,
                      onDeleted: () =>
                          context.read<SearchCubit>().selectCompound(null),
                    ),
                  ),
                if (state.minBedrooms != null)
                  Padding(
                    padding: const EdgeInsets.only(left: AppTheme.spacingS),
                    child: _SelectedFilter(
                      label:
                          '${state.minBedrooms} - ${state.maxBedrooms} Bedrooms',
                      onDeleted: () => context
                          .read<SearchCubit>()
                          .selectBedroomRange(null, null),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
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

class _SelectedFilter extends StatelessWidget {
  final String label;
  final VoidCallback onDeleted;

  const _SelectedFilter({required this.label, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: AppTheme.bodyMedium.copyWith(color: AppTheme.textPrimary),
      ),
      onDeleted: onDeleted,
      deleteIconColor: AppTheme.textSecondary,
      backgroundColor: AppTheme.background,
      side: const BorderSide(color: AppTheme.divider),
    );
  }
}
