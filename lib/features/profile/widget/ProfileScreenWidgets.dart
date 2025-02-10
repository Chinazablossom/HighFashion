

import 'package:flutter/material.dart';

import '../../../core/utils/constanst/colors.dart';

class ProfileScreenWidgets extends StatelessWidget {
  const ProfileScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  InkWell buildRowWidgets(Function() todo, IconData iconStart, String label, IconData iconEnd, bool isLightMode) {
    return InkWell(
      onTap: todo,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(iconStart, color: isLightMode ? lightWidgetColorBackground : Colors.white, size: 28),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 18),
                  )),
              Icon(iconEnd, color: isLightMode ? lightWidgetColorBackground : Colors.white, size: 28),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Flexible(
                child: Divider(
                  color: Colors.grey.withOpacity(0.5),
                  indent: 0,
                  endIndent: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}


