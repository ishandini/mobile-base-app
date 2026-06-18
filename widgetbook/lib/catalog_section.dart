import 'package:flutter/material.dart';

/// Top-level category heading (e.g. "Buttons", "Inputs").
/// Add one per logical group in CatalogPage.
class CatalogSectionHeader extends StatelessWidget {
  const CatalogSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 2),
        ],
      ),
    );
  }
}

/// Small label rendered above each widget variant inside a section.
/// Example: CatalogVariantLabel('Disabled')
class CatalogVariantLabel extends StatelessWidget {
  const CatalogVariantLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade500,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
