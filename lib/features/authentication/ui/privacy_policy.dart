import 'package:flutter/material.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(fontFamily: interExtraBold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cancellation Policy",
                style: TextStyle(
                    fontFamily: interBlack,
                    color: isLightMode(context)
                        ? lightWidgetColorBackground
                        : darkWidgetColorBackground)),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in scelerisque sem. Mauris \n"
              "volutpat, dolor id interdum ullamcorper, risus dolor egestas lectus, sit amet mattis purus\n"
              "dui nec risus. Maecenas non sodales nisi, vel dictum dolor. Class aptent taciti sociosqu ad\n"
              "litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse blandit eleifend\n"
              "diam, vel rutrum tellus vulputate quis. Aliquam eget libero aliquet, imperdiet nisl a,"
              "ornare ex. Sed rhoncus est ut libero porta lobortis. Fusce in dictum tellus.",
            ),
            const SizedBox(
              height: 12,
            ),
            Text("Terms & Conditions",
                style: TextStyle(
                    fontFamily: interBlack,
                    color: isLightMode(context)
                        ? lightWidgetColorBackground
                        : darkWidgetColorBackground)),
            const SizedBox(
              height: 4,
            ),
            const Text(
                " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in scelerisque sem. Mauris"
                "volutpat, dolor id interdum ullamcorper, risus dolor egestas lectus, sit amet mattis purus"
                "dui nec risus. Maecenas non sodales nisi, vel dictum dolor. Class aptent taciti sociosqu ad"
                "litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse blandit eleifend"
                "diam, vel rutrum tellus vulputate quis. Aliquam eget libero aliquet, imperdiet nisl a,"
                "ornare ex. Sed rhoncus est ut libero porta lobortis. Fusce in dictum tellus.\n\n"
                "Suspendisse interdum ornare ante. Aliquam nec cursus lorem. Morbi id magna felis. Vivamus"
                "egestas, est a condimentum egestas, turpis nisl iaculis ipsum, in dictum tellus dolor sed"
                "neque. Morbi tellus erat, dapibus ut sem a, iaculis tincidunt dui. Interdum et malesuada"
                "fames ac ante ipsum primis in faucibus. Curabitur et eros porttitor, ultricies urna vitae,"
                "molestie nibh. Phasellus at commodo eros, non aliquet metus. Sed maximus nisl nec dolor"
                "bibendum, vel congue leo egestas.\n\n"
                "Sed interdum tortor nibh, in sagittis risus mollis quis. Curabitur mi odio, condimentum sit"
                "amet auctor at, mollis non turpis. Nullam pretium libero vestibulum, finibus orci vel,"
                "molestie quam. Fusce blandit tincidunt nulla, quis sollicitudin libero facilisis et. Integer"
                "interdum nunc ligula, et fermentum metus hendrerit id. Vestibulum lectus felis, dictum at"
                "lacinia sit amet, tristique id quam. Cras eu consequat dui. Suspendisse sodales nunc ligula,"
                "in lobortis sem porta sed. Integer id ultrices magna, in luctus elit. Sed a pellentesque"
                "est.\n\n"
                "Aenean nunc velit, lacinia sed dolor sed, ultrices viverra nulla. Etiam a venenatis nibh."
                "Morbi laoreet, tortor sed facilisis varius, nibh orci rhoncus nulla, id elementum leo dui"
                "non lorem. Nam mollis ipsum quis auctor varius. Quisque elementum eu libero sed commodo. In"
                "eros nisl, imperdiet vel imperdiet et, scelerisque a mauris. Pellentesque varius ex nunc,"
                "quis imperdiet eros placerat ac. Duis finibus orci et est auctor tincidunt. Sed non viverra"
                "ipsum. Nunc quis augue egestas, cursus lorem at, molestie sem. Morbi a consectetur ipsum, a"
                "placerat diam. Etiam vulputate dignissim convallis. Integer faucibus mauris sit amet finibus"
                "convallis.\n\n"
                "Phasellus in aliquet mi. Pellentesque habitant morbi tristique senectus et netus et"
                "malesuada fames ac turpis egestas. In volutpat arcu ut felis sagittis, in finibus massa"
                "gravida. Pellentesque id tellus orci. Integer dictum, lorem sed efficitur ullamcorper,"
                "libero justo consectetur ipsum, in mollis nisl ex sed nisl. Donec maximus ullamcorper"
                "sodales. Praesent bibendum rhoncus tellus nec feugiat. In a ornare nulla. Donec rhoncus"
                "libero vel nunc consequat, quis tincidunt nisl eleifend. Cras bibendum enim a justo luctus"
                "vestibulum. Fusce dictum libero quis erat maximus, vitae volutpat diam dignissim."),
          ],
        ),
      ),
    );
  }
}
