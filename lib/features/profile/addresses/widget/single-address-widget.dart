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
        color:  Colors.transparent,
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

List<SingleAddress> demoAddresses = [
  const SingleAddress(isSelected: true, userName: "John Doe", phoneNumber: "+1 (234) (5678)", address: "123 Main St, Anytown, CA 12345"),
  const SingleAddress(isSelected: false, userName: "Jenna Doe", phoneNumber: "+1 (901) (2345)", address: "456 Elm St, Othertown, NY 67890"),
  const SingleAddress(isSelected: false, userName: "Timmy Doe", phoneNumber: "+22 (901) (2345)", address: "42 Rue de la Paix, Paris, France 75002"),
];