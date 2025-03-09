// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/controllers/product/later_list_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

//TFavoriteIcon
class TSaveForLaterIcon extends StatelessWidget {
  const TSaveForLaterIcon({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaterListController());
    var id = CartController.instance.cartItems.indexOf(productId);
    return Obx(
      () => Row(children: [
        //Text(AppLocalizations.of(context)!.saveForLater),
        TCircularIcon(
            backgroundColor: Colors.transparent,
            size: 35,
            icon: controller.isLaterShoping(productId)
                ? Icons.archive
                : Icons.archive,
            color: controller.isLaterShoping(productId)
                ? TColors.primary
                : Colors.black,
            onPressed: () {
              controller.toggleLaterShopingProduct(productId);
              CartController.instance.cartItems.removeAt(id);
              CartController.instance.updateCart();
            }),
      ]),
    );
  }
}
