import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_tile.dart';
import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/personlization/screens/settings/settings_profile.dart';
import 'package:brother_store/features/project/screens/prices/prices.dart';
import 'package:brother_store/features/project/screens/projects/projects.dart';
import 'package:brother_store/features/shop/screens/orders/widgets/order.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
    //   statusBarColor: dark ? TColors.black : TColors.white, // status bar color
    // ));
    // final termController = BrothersController.instance;
    // final brotherData = termController.allData;
    // bool isEg = Get.locale?.languageCode == 'en';
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TPrimaryHeaderContainer(
                  child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      AppLocalizations.of(context)!.setting,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtWsections,
                  )
                ],
              )),

              ///body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TSettingTile(),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    //-- acount settings
                    // TSectionHeading(
                    //     title: AppLocalizations.of(context)!.accountSettings,
                    //     showActionButton: false),
                    // const SizedBox(
                    //   height: TSizes.spaceBtWItems,
                    // ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const ProjectsScreen()),
                      icon: Iconsax.buildings_2,
                      title: AppLocalizations.of(context)!.myProjects,
                      subTitle: 'track processing projects ',
                    ),

                    TSettingMenuTile(
                        onTap: () => Get.to(() => const TPricesRequestScreen()),
                        icon: Iconsax.discount_shape,
                        title: AppLocalizations.of(context)!.priceRequest,
                        subTitle:
                            'you can Request for Price or decoration price'),
                    // TSettingMenuTile(
                    //     icon: Iconsax.location,
                    //     onTap: () => Get.to(() => const UserAdressScreen()),
                    //     subTitle: AppLocalizations.of(context)!.addressSubtile,
                    //     title: AppLocalizations.of(context)!.myAddresses),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => const CartScreen()),
                    //   icon: Iconsax.shopping_bag,
                    //   title: AppLocalizations.of(context)!.myCart,
                    //   subTitle: AppLocalizations.of(context)!.cartSubtitle,
                    // ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const OrderScreen()),
                      icon: Iconsax.book,
                      title: AppLocalizations.of(context)!.myOrders,
                      subTitle: AppLocalizations.of(context)!.ordersSubtitle,
                    ),
                    // TSettingMenuTile(
                    //     onTap: () {
                    //       final controller = Get.put(NavigationController());
                    //       controller.updateSelectedIndex(1);
                    //       Get.to(() => const FavoriteScreen());
                    //     },
                    //     icon: Iconsax.heart,
                    //     title: AppLocalizations.of(context)!.wishList,
                    //     subTitle:
                    //         AppLocalizations.of(context)!.wishlistSubTitle),

                    //  ),
                    // TSettingMenuTile(
                    //   onTap: () => Get.to(() => const NotificationScreen()),
                    //   icon: Iconsax.notification,
                    //   title: AppLocalizations.of(context)!.notifications,
                    //   subTitle: 'Do culpa reprehenderit ullamco fugiat.',
                    // ),

                    // TSettingMenuTile(
                    //   icon: Iconsax.security_card,
                    //   title: AppLocalizations.of(context)!.accountPrivacy,
                    //   subTitle: 'manage data usage',
                    // ),
                    // const SizedBox(
                    //   height: TSizes.spaceBtWsections,
                    // ),
                    // TSectionHeading(
                    //   title: AppLocalizations.of(context)!.appSettings,
                    //   showActionButton: false,
                    // ),
                    // const SizedBox(
                    //   height: TSizes.spaceBtWItems,
                    // ),

                    // TSettingMenuTile(
                    //   icon: Iconsax.document_upload,
                    //   title: AppLocalizations.of(context)!.loadDate,
                    //   subTitle: 'upload data to your account',
                    // ),

                    // TSettingMenuTile(
                    //   onTap: () {
                    //     if (Get.locale?.languageCode == 'ar') {
                    //       GetStorage().write('en', true);
                    //       Get.updateLocale(const Locale('en'));
                    //       THelperFunctions.isDarkMode(context)
                    //           ? Get.changeTheme(TAppTheme.darkThemeEg)
                    //           : Get.changeTheme(TAppTheme.lightThemeEg);
                    //     } else {
                    //       GetStorage().write('en', false);
                    //       Get.updateLocale(const Locale('ar'));
                    //       THelperFunctions.isDarkMode(context)
                    //           ? Get.changeTheme(TAppTheme.darkThemeAr)
                    //           : Get.changeTheme(TAppTheme.lightThemeArabic);
                    //     }

                    //     Get.reload();
                    //   },
                    //   icon: Icons.language,
                    //   title: AppLocalizations.of(context)!.changedTo,
                    //   subTitle:
                    //       AppLocalizations.of(context)!.chooseYourLanguage,
                    // ),
                    // TSettingMenuTile(
                    //   icon: Iconsax.moon5,
                    //   title: AppLocalizations.of(context)!.darkMode,
                    //   subTitle:
                    //       AppLocalizations.of(context)!.chooseYourPrightness,
                    //   trailing: Switch(
                    //       activeColor: TColors.primary,
                    //       value: THelperFunctions.isDarkMode(context),
                    //       onChanged: (value) {
                    //         if (!value) {
                    //           Get.changeTheme(Get.locale?.languageCode == 'en'
                    //               ? TAppTheme.lightThemeEg
                    //               : TAppTheme.lightThemeArabic);
                    //         } else {
                    //           Get.changeTheme(Get.locale?.languageCode == 'en'
                    //               ? TAppTheme.darkThemeEg
                    //               : TAppTheme.darkThemeAr);
                    //         }
                    //       }),
                    // ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => const SettingProfileScreen()),
                      icon: Icons.person_2_outlined,
                      title: AppLocalizations.of(context)!.account,
                      subTitle: AppLocalizations.of(context)!.accountSettings,
                    ),
                    TSettingMenuTile(
                      onTap: () => AuthenticationRepository.instance.logOut(),
                      icon: Icons.logout,
                      title: AppLocalizations.of(context)!.logout,
                      subTitle: AppLocalizations.of(context)!.logout,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
