import 'package:flutter/material.dart';
import 'package:nawy_search_app/core/theme/app_theme.dart';
import 'package:nawy_search_app/data/models/compound_model.dart';

class CompoundCard extends StatelessWidget {
  final CompoundModel compound;
  final int propertiesCount;
  final VoidCallback onTap;

  const CompoundCard({
    super.key,
    required this.compound,
    required this.propertiesCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
      ),
      elevation: AppTheme.cardElevation,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(compound.name, style: AppTheme.headingMedium),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                compound.area?.name ?? 'Location not available',
                style: AppTheme.bodyMedium,
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                '$propertiesCount Properties Available',
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
