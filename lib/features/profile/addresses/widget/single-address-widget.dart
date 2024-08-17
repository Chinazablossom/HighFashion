import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/utils/constanst/colors.dart';
import '../../../../core/utils/helper-functions/helper-functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.isSelected,
    required this.userName,
    required this.phoneNumber,
    required this.address,
  });

  final bool isSelected;
  final String userName;
  final String phoneNumber;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isSelected
                ? isLightMode(context)
                ? lightWidgetColorBackground
                : Colors.white
                : Colors.grey,
            width: 2),
        color: isSelected
            ? darkWidgetColorBackground
            .withOpacity(isLightMode(context) ? 0.1 : 0.5)
            : Colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 8,
            top: 6,
            child: Icon(
              isSelected ? Iconsax.tick_circle : null,
              color: isSelected
                  ? isLightMode(context)
                  ? lightWidgetColorBackground
                  : Colors.white
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.call_copy,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(child: Text(phoneNumber)),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const Icon(Iconsax.location_copy, size: 18),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Text(address)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
