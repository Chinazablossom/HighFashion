import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../core/models/product_model.dart';
import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/constanst/colors.dart';
import '../wishlist/controller/wishlist_controller.dart';

class ReuseableWidgets {
  GestureDetector largeAppBtn(
      String label, Function() todo, Color color, Color txtColor) {
    return GestureDetector(
      onTap: todo,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(label,
                style: TextStyle(
                    fontFamily: interExtraBold,
                    color: txtColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  GestureDetector largeAppIconBtn(
      bool isLightMode, IconData icon, Function() todo) {
    return GestureDetector(
      onTap: todo,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: lightWidgetColorBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Icon(
          icon,
          color: Colors.white,
        )),
      ),
    );
  }

  Stack buildAppScreenBackGround({
    required String headerImg,
    required double? bgTopPos,
    required double? bgLeftPos,
    required double? bgRightPos,
    required double? bgBottomPos,
    required Widget child,
    required Widget childOp,
  }) {
    return Stack(children: [
      ReuseableWidgets().buildHeader(headerImg, null),
      Positioned(
          top: bgTopPos,
          left: bgLeftPos,
          right: bgRightPos,
          bottom: bgBottomPos,
          child: Container(
            child: child,
          )),
      childOp
    ]);
  }

  Container buildHeader(String imgPath, Widget? child) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
      child: child,
    );
  }

  Container imgContainer(
      double height, double width, double radius, String imgPath) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: lightWidgetColorBackground,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
            image: AssetImage(
              imgPath,
            ),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover),
      ),
    );
  }

  Container iconContainer(
      double height, double width, IconData icon, bool isLightMode) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isLightMode
            ? lightWidgetColorBackground
            : darkWidgetColorBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Column pageView(
    bool isLightMode,
    String? title,
    String? highlightedTxt,
    String? body,
    String? imgPath,
    int pageNum,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 430,
          width: double.infinity,
          child: Image.asset(imgPath!),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: title,
              style: TextStyle(
                  fontFamily: interExtraBold,
                  fontSize: 24,
                  color: isLightMode ? Colors.black : Colors.white),
            ),
            TextSpan(
              text: highlightedTxt,
              style: TextStyle(
                fontFamily: interExtraBold,
                fontSize: 24,
                color: isLightMode
                    ? lightWidgetColorBackground
                    : darkWidgetColorBackground,
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          body!,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Container buildBackgroundContainer(
    Color containerColor,
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
    Widget? child,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight))),
      child: child,
    );
  }

  SearchBar buildSearchBar(
      Function()? onTap, Function()? onChange, bool isLightMode) {
    return SearchBar(
      backgroundColor: MaterialStatePropertyAll<Color>(isLightMode
          ? lightBackground.withOpacity(0.9)
          : const Color(0xff1d1c1f)),
      hintText: "Search...",
      hintStyle: MaterialStatePropertyAll(TextStyle(
          color: isLightMode ? const Color(0xff646060) : Colors.white)),
      onTap: onTap,
      onChanged: (value) {
        onChange;
      },
      leading: Icon(CupertinoIcons.search,
          color: isLightMode ? lightWidgetColorBackground : Colors.white),
      trailing: [
        IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.mic,
                color: isLightMode ? lightWidgetColorBackground : Colors.white))
      ],
    );
  }

  Stack buildStackNotificationIcon(
      int notifCount, Widget icon, Function() todo) {
    return Stack(children: [
      Positioned(
          width: notifCount >= 100
              ? 16
              : notifCount >= 10
                  ? 22
                  : 17,
          height: notifCount >= 100
              ? 16
              : notifCount >= 10
                  ? 19
                  : 18,
          right: 0,
          top: notifCount >= 100 ? 5 : 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                notifCount >= 100 ? "" : notifCount.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          )),
      IconButton(onPressed: todo, icon: icon),
    ]);
  }

  InkWell buildTextRow(Function() todo, IconData iconStart, String label,
      IconData iconEnd, bool isLightMode) {
    return InkWell(
      onTap: todo,
      splashColor: lightWidgetColorBackground.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(iconStart,
                  color: isLightMode
                      ? lightWidgetColorBackground
                      : darkWidgetColorBackground,
                  size: 28),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 18),
                  )),
              Icon(iconEnd,
                  color: isLightMode
                      ? lightWidgetColorBackground
                      : darkWidgetColorBackground,
                  size: 28),
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

  Container buildTopBrandContainer(
    String imgPath,
    String brandName,
    int productsAvailable,
    double width,
    Color borderColor,
  ) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image(height: 45, width: 45, image: AssetImage(imgPath)),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(brandName,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700)),
                SizedBox(
                    width: width,
                    child: Text(
                      "$productsAvailable products available",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell buildProductDisplay(
    Function()? todo,
    String tag,
    List<String> imgs,
  ) {
    final random = Random().nextInt(brandCategories[tag]!.length);

    return InkWell(
      onTap: todo,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: lightWidgetColorBackground)),
                child: Column(
                  children: [
                    buildTopBrandContainer(
                        brandCategories[tag]![random].values.first,
                        brandCategories[tag]![random].keys.first,
                        Random().nextInt(1000),
                        200,
                        Colors.transparent),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: imgs
                              .map((image) => displayedClothes(img: image))
                              .toList()),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class HAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.onTapLeadingIcon,
    required this.centerTiltle,
    this.automaticallyImplyLeading,
  });

  final Widget? leading;
  final void Function()? onTapLeadingIcon;
  final Widget? title;
  final bool centerTiltle;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading ?? false,
        leading: leading,
        leadingWidth: 4,
        title: title,
        centerTitle: centerTiltle,
        actions: actions,
        titleSpacing: 6,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}

Container buildCountTimer(String time, double width, bool isLightMode) {
  return Container(
    height: 30,
    width: width,
    decoration: BoxDecoration(
        color: isLightMode
            ? lightWidgetColorBackground.withOpacity(0.2)
            : lightWidgetColorBackground.withOpacity(0.5),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8)),
    child: Center(
        child: Text(
      time,
      style: const TextStyle(fontWeight: FontWeight.w500),
    )),
  );
}

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    this.onTap,
    required this.product,
  });

  final Product product;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    return InkWell(
      onTap: onTap,
      onLongPress: () {
        if (!favoritesController.isFavorite(product)) {
          favoritesController.addToFavorites(product);
          Get.snackbar("Item Added", "${product.name} added to favorites.");
        } else {
          favoritesController.removeFromFavorites(product);
          Get.snackbar(
              "Item Removed", "${product.name} removed from favorites.");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: isLightMode(context) ? Colors.black54 : Colors.white,
                blurRadius: isLightMode(context) ? 3.0 : 1.5,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.normal),
          ],
          color: isLightMode(context) ? Colors.white : Colors.black87,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(35)),
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    color: colorList[Random().nextInt(30)],
                    child: FadeInImage(
                        fit: BoxFit.contain,
                        placeholder: MemoryImage(kTransparentImage),
                        image: AssetImage(
                            product.image) /* NetworkImage(meal.imageUrl)*/),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 4,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white54,
                        child: Icon(
                          favoritesController.isFavorite(product)
                              ? Iconsax.heart
                              : Iconsax.heart_copy,
                          color: lightWidgetColorBackground,
                        ),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 160,
                      child: Text(product.name,
                          style: const TextStyle(fontFamily: interMedium),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class carouselImg extends StatelessWidget {
  const carouselImg({
    super.key,
    required this.url,
    this.todo,
    this.height = 150,
    this.width = 320,
  });

  final String url;
  final Function()? todo;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: todo,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image(
              image: AssetImage(url),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
        ),
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.itemsList,
    required this.todo,
    required this.radius,
  });

  final Map<String, String> itemsList;
  final double radius;
  final Function() todo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsList.keys.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: InkWell(
            onTap: todo,
            splashColor: lightWidgetColorBackground,
            splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xffe7e7ec),
                      borderRadius: BorderRadius.circular(radius)),
                  child: Image(
                      height: 40,
                      width: 40,
                      image:
                          AssetImage(itemsList.entries.elementAt(index).value)),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  itemsList.entries.elementAt(index).key,
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class SizesList extends StatelessWidget {
  const SizesList({
    super.key,
    required this.itemsList,
  });

  final List<Widget> itemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: itemsList[index],
      ),
    );
  }
}

const catList = {
  "Accessories": eyeglassIcon,
  "Beach wear": bikiniIcon,
  "Bags": bagsIcon,
  "Dresses": dressIcon,
  "Jewelry": earringsIcon,
  "Shoes": shoeIcon,
  "Shirts": shirtIcon,
  "Skirts": skirtIcon,
};

final Map<String, List<Map<String, String>>> brandCategories = {
  "Accessories": [
    {"Poki": pokiLogo},
    {"Sinteza": sintezaLogo},
    {"Lyydia": lyydiaLogo},
  ],
  "BeachWear": [
    {"Lara": laraLogo},
    {"Monica": monicaLogo},
    {"Pomii": pomiiLogo},
    {"Tants": tantsLogo},
  ],
  "Bags": [
    {"Shannel": shannelLogo},
    {"Toni Bags": toniLogo},
    {"Maki Bags": makiLogo},
  ],
  "Dresses": [
    {"Nazza": nazzaLogo},
    {"Lizzor": lizzorLogo},
    {"Ho44": ho44Logo},
    {"QuantDresses": quantDressesLogo},
  ],
  "Jewelry": [
    {"Loreal": lorealJewlsLogo},
    {"Que": queLogo},
    {"Qw4": qw4Logo},
    {"Boho Jewels": bohoJewelLogo},
    {"CikeeLiko Jewels": cikeeLikoLogo},
  ],
  "Shoes": [
    {"Bohho Shoes": bohhoLogo},
    {"Euhos": euhosLogo},
    {"Weamdes": weamdesLogo},
    {"Namer": namerShoesLogo},
  ],
  "Shirts": [
    {"HakeTops": hakeTopsLogo},
    {"MiloTops": miloTopsLogo},
    {"Likok": likokLogo},
    {"Kiki": kikiTopsLogo},
    {"SubTops": subTopsLogo},
  ],
  "Skirts": [
    {"Hobio": hobioLogo},
    {"Skrtnt": skrtntLogo},
    {"Tlullei": tlulleiLogo},
    {"Tallalyw": tallalywLogo},
    {"Mirkd": mirkdLogo},
  ],
};
final List<Map<String, String>> brands = [
  {"Kixx Shoes": kixxLogo},
  {"Loriem Wears": loriemLogo},
  {"Magienty": magientyLogo},
  {"Sumxx Wears": sumxxLogo},
  {"Bohho Shoes": bohhoLogo},
  {"Boho Jewels": bohoJewelLogo},
  {"CikeeLiko Jewels": cikeeLikoLogo},
  {"Euhos": euhosLogo},
  {"HakeTops": hakeTopsLogo},
  {"Ho44": ho44Logo},
  {"Kiki": kikiTopsLogo},
  {"Lara": laraLogo},
  {"Likok": likokLogo},
  {"Lizzor": lizzorLogo},
  {"Loreal": lorealJewlsLogo},
  {"Lyydia": lyydiaLogo},
  {"MakiLogo": makiLogo},
  {"MiloTops": miloTopsLogo},
  {"Monica": monicaLogo},
  {"Namer": namerShoesLogo},
  {"Nazza": nazzaLogo},
  {"Poki": pokiLogo},
  {"Pomii": pomiiLogo},
  {"QuantDresses": quantDressesLogo},
  {"Que": queLogo},
  {"Qw4": qw4Logo},
  {"Shannel": shannelLogo},
  {"Sinteza": sintezaLogo},
  {"SubTops": subTopsLogo},
  {"Tants": tantsLogo},
  {"Toni": toniLogo},
  {"Weamdes": weamdesLogo},
  {"Hobio": hobioLogo},
  {"Skrtnt": skrtntLogo},
  {"Tlullei": tlulleiLogo},
  {"Tallalyw": tallalywLogo},
  {"Mirkd": mirkdLogo},
];

final logos = [
  kixxLogo,
  loriemLogo,
  magientyLogo,
  sumxxLogo,
  bohhoLogo,
  bohoJewelLogo,
  cikeeLikoLogo,
  euhosLogo,
  hakeTopsLogo,
  ho44Logo,
  kikiTopsLogo,
  laraLogo,
  likokLogo,
  lizzorLogo,
  lorealJewlsLogo,
  lyydiaLogo,
  makiLogo,
  miloTopsLogo,
  monicaLogo,
  namerShoesLogo,
  nazzaLogo,
  pokiLogo,
  pomiiLogo,
  quantDressesLogo,
  queLogo,
  qw4Logo,
  shannelLogo,
  sintezaLogo,
  subTopsLogo,
  tantsLogo,
  toniLogo,
  weamdesLogo,
  hobioLogo,
  skrtntLogo,
  tlulleiLogo,
  tallalywLogo,
  mirkdLogo
];
final brandName = [
  "Kixx Shoes",
  "Loriem Wears",
  "Magienty",
  "Sumxx Wears",
  "Bohho Shoes",
  "Boho Jewels",
  "CikeeLiko Jewels",
  "Euhos",
  "HakeTops",
  "Ho44",
  "Kiki",
  "Lara",
  "Likok",
  "Lizzor",
  "Loreal",
  "Lyydia",
  "Maki",
  "MiloTops",
  "Monica",
  "Namer",
  "Nazza",
  "Poki",
  "Pomii",
  "QuantDresses",
  "Que",
  "Qw4",
  "Shannel",
  "Sinteza",
  "SubTops",
  "Tants",
  "Toni",
  "Weamdes",
  "Hobio",
  "Skrtnt",
  "Tlullei",
  "Tallalyw",
  "Mirkd"
];

class displayedClothes extends StatelessWidget {
  const displayedClothes({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 2, right: 4),
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: isLightMode(context) ? Colors.black54 : Colors.white,
              blurRadius: isLightMode(context) ? 2.0 : 1.5,
              spreadRadius: 0.5,
              blurStyle: BlurStyle.outer),
        ], borderRadius: BorderRadius.all(Radius.circular(9))),
        child: ReuseableWidgets().buildBackgroundContainer(
          colorList[Random().nextInt(30)],
          10,
          10,
          25,
          10,
          Image(
            image: AssetImage(img),
            height: 100,
          ),
        ),
      ),
    );
  }
}

List<Color> colorList = [
  const Color(0xFF421220),
  const Color(0xFF203157),
  const Color(0xFF48281E),
  const Color(0xFF083041),
  const Color(0xFF572B4B),
  const Color(0xFF342646),
  const Color(0xFF804400),
  const Color(0xFF4D4D1E),
  const Color(0xFF3A2326),
  const Color(0xFFA8B052),
  const Color(0xFF1B503E),
  const Color(0xFF334D29),
  const Color(0xFF261B54),
  const Color(0xFF8A5E65),
  const Color(0xFF85573E),
  const Color(0xFF572E2E),
  const Color(0xFF246742),
  const Color(0xFF375873),
  const Color(0xFF5749A9),
  const Color(0xFF69270F),
  const Color(0xFF5F7C24),
  const Color(0xFF460E48),
  const Color(0xFF541F1F),
  const Color(0xFFAB966C),
  const Color(0xFFC49E71),
  const Color(0xFFA25048),
  const Color(0xFF778899),
  const Color(0xFF5D6B7C),
  const Color(0xFF443A81),
  const Color(0xFF1C4E4F),
];

List<String> colorNames = [
  "Burgundy",
  "NavyBlue",
  "DarkBrown",
  "Teal",
  "Plum",
  "Charcoal",
  "GoldenBrown",
  "DarkGray",
  "DarkRed",
  "LightBrown",
  "ForestGreen",
  "DarkGreen",
  "DarkBlue",
  "Mauve",
  "Sienna",
  "Maroon",
  "SeaGreen",
  "SteelBlue",
  "Violet",
  "BurntOrange",
  "Sage",
  "DarkPurple",
  "DarkMaroon",
  "LightGolden",
  "LightCream",
  "Terracotta",
  "LightGray",
  "DarkCyan",
  "DarkViolet",
  "DarkTeal",
];
