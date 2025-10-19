import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy_search_app/core/theme/app_theme.dart';
import 'package:nawy_search_app/core/utils/number_formatter.dart';
import 'package:nawy_search_app/data/models/property_model.dart';
import 'package:nawy_search_app/presentation/cubits/search_cubit.dart';
import 'package:nawy_search_app/presentation/cubits/search_state.dart';
import 'package:nawy_search_app/presentation/widgets/cached_image.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;
  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      clipBehavior: Clip.antiAlias,
      color: AppTheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
      ),
      elevation: AppTheme.cardElevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildImageSection(), _buildContentSection(context)],
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedImage(imageUrl: property.image, fit: BoxFit.cover),
        ),
        _buildFavoriteButton(),
        _buildDeveloperLogo(),
      ],
    );
  }

  Widget _buildFavoriteButton() {
    return Positioned(
      top: AppTheme.spacingS,
      right: AppTheme.spacingS,
      child: BlocBuilder<SearchCubit, SearchState>(
        buildWhen: (previous, current) =>
            previous.favoritePropertyIds != current.favoritePropertyIds,
        builder: (context, state) {
          final isFavorite = state.favoritePropertyIds.contains(property.id);
          return CircleAvatar(
            backgroundColor: AppTheme.background,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : AppTheme.textSecondary,
                size: AppTheme.iconSizeM,
              ),
              onPressed: () {
                context.read<SearchCubit>().toggleFavorite(property.id);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildDeveloperLogo() {
    return Positioned(
      top: 0,
      left: AppTheme.spacingM,
      child: CachedImage(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(AppTheme.radiusS),
        ),
        imageUrl: property.developer.logoPath,
        width: AppTheme.iconSizeL * 2,
        height: AppTheme.iconSizeL * 2,
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: AppTheme.spacingS),
          _buildPriceInfo(context),
          const SizedBox(height: AppTheme.spacingS),
          _buildLocation(context),
          const SizedBox(height: AppTheme.spacingM),
          _buildPropertyDetails(),
          const SizedBox(height: AppTheme.spacingM),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(property.propertyType.name, style: AppTheme.headingMedium),
        Text("Delivery ${property.minReadyBy}", style: AppTheme.bodyMedium),
      ],
    );
  }

  Widget _buildPriceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${property.currency} ${NumberFormatter.formatPrice(property.maxPrice)}',
          style: AppTheme.priceStyle,
        ),
        const SizedBox(height: AppTheme.spacingS),
        Text(
          '${property.currency} ${NumberFormatter.formatPrice(property.minInstallments)} / month over ${property.maxInstallmentYears} years',
          style: AppTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildLocation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${property.area.name} - ${property.compound.name}',
          style: AppTheme.bodyLarge,
        ),
        Text(
          '${property.area.name}, ${property.compound.name}',
          style: AppTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildPropertyDetails() {
    return Row(
      children: [
        _buildDetailItem(
          'assets/icons/bed.svg',
          property.numberOfBedrooms.toString(),
        ),
        const SizedBox(width: AppTheme.spacingL),
        _buildDetailItem(
          'assets/icons/bathtub.svg',
          property.numberOfBathrooms.toString(),
        ),
        const SizedBox(width: AppTheme.spacingL),
        _buildDetailItem(
          'assets/icons/square_foot.svg',
          '${property.minUnitArea} - ${property.maxUnitArea} m²',
        ),
      ],
    );
  }

  Widget _buildDetailItem(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppTheme.iconSizeM,
          height: AppTheme.iconSizeM,
          colorFilter: const ColorFilter.mode(
            AppTheme.secondaryBlue,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: AppTheme.spacingS),
        Text(text, style: AppTheme.bodyMedium),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/zoom.svg',
            width: AppTheme.iconSizeS,
            height: AppTheme.iconSizeS,
          ),
          label: 'Zoom',
        ),
        _ActionButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.phone, size: AppTheme.iconSizeS),
          label: 'Call',
        ),
        _ActionButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/whatsapp.svg',
            width: AppTheme.iconSizeS,
            height: AppTheme.iconSizeS,
          ),
          label: 'Whatsapp',
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String label;

  const _ActionButton.icon({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: AppTheme.outlinedButtonStyle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: AppTheme.spacingS),
          Text(label),
        ],
      ),
    );
  }
}
