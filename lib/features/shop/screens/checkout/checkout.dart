import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/transaction.dart';

import 'package:brother_store/features/shop/screens/wellcome_widget.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subtotal = cartController.totalOfCartPrice.value;
    //final orderController = Get.put(OrderController());
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
          appBar: TAppBar(
            showBackArrow: true,
            title: Text(
              'Order Review',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: !AuthenticationRepository.instance.isGust.value
              ? SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      const TCartItems(
                        showAddRemoveButtons: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),

                      ///Copoun code
                      //pconst TCouponCode(),
                      const SizedBox(
                        height: TSizes.spaceBtWsections,
                      ),
                      TRoundedContainer(
                          showBorder: true,
                          backgroundColor: dark ? TColors.black : TColors.white,
                          padding: const EdgeInsets.all(TSizes.md),
                          child: const Column(
                            children: [
                              TBillingAmountSection(),
                              SizedBox(
                                height: TSizes.spaceBtWItems,
                              ),
                              Divider(),
                              SizedBox(
                                height: TSizes.spaceBtWItems,
                              ),
                              TbillingPaymentSection(),
                              SizedBox(
                                height: TSizes.spaceBtWItems,
                              ),
                              TBillingAddressSection(),
                              SizedBox(
                                height: TSizes.spaceBtWItems,
                              ),
                            ],
                          )),
                    ],
                  ),
                ))
              : const WellcomeWidget(),
          bottomNavigationBar: !AuthenticationRepository.instance.isGust.value
              ? Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ElevatedButton(
                      onPressed: subtotal > 0
                          ? () => Get.to(() => Ttransaction())

                          //orderController.processOrder(subtotal)
                          : () => Get.snackbar(
                              AppLocalizations.of(context)!.cartEmpty,
                              AppLocalizations.of(context)!
                                  .addItemTotheCartForOrderProcess),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.checkout),
                          const SizedBox(
                            width: 15,
                          ),
                          TProductPriceText(
                              color: TColors.white, price: subtotal.toString())
                        ],
                      )),
                )
              : null),
    );
  }
}
