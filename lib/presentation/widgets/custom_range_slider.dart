import 'package:flutter/material.dart';
import 'package:nawy_search_app/core/theme/app_theme.dart';

class CustomRangeSlider extends StatelessWidget {
  final String title;
  final double minValue;
  final double maxValue;
  final double currentMinValue;
  final double currentMaxValue;
  final int? divisions;
  final ValueChanged<RangeValues> onChanged;
  final String? subtitle;

  const CustomRangeSlider({
    super.key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.currentMinValue,
    required this.currentMaxValue,
    required this.onChanged,
    this.divisions,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTheme.headingMedium.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle ??
                  '${currentMinValue.toInt()} ~ ${currentMaxValue.toInt()}+ rooms',
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.primaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingM),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppTheme.primaryBlue,
            inactiveTrackColor: Colors.grey[200],
            thumbColor: Colors.white,
            overlayColor: AppTheme.primaryBlue.withOpacity(0.12),
            trackHeight: 4.0,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 8.0,
              elevation: 2.0,
            ),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 8.0,
              elevation: 2.0,
            ),
            rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
            activeTickMarkColor: AppTheme.primaryBlue,
            inactiveTickMarkColor: Colors.grey[300],
          ),
          child: RangeSlider(
            values: RangeValues(currentMinValue, currentMaxValue),
            min: minValue,
            max: maxValue,
            divisions: divisions ?? (maxValue - minValue).toInt(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
