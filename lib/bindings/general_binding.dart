import 'package:brother_store/features/authontication/controllers.onboarding/onboarding_controller.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/blog/controller/blog_controller.dart';
import 'package:brother_store/features/gallery/controller/album_controller.dart';
import 'package:brother_store/features/gallery/controller/gallery_controller.dart';
import 'package:brother_store/features/general/controllers/brother_controller.dart';
import 'package:brother_store/features/general/controllers/paytabs_controller.dart';
import 'package:brother_store/features/project/controllers/ask_price_controller.dart';
import 'package:brother_store/features/project/controllers/project_controller.dart';
import 'package:brother_store/features/shop/controllers/address_controller.dart';
import 'package:brother_store/features/shop/controllers/banner_controller.dart';
import 'package:brother_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:brother_store/features/shop/controllers/product/images_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(OnBoardingController());
    Get.put(AlbumController());
    Get.put(GalleryController());

    Get.put(BrothersController());
    Get.put(AddressController());
    Get.put(CheckoutController());
    Get.put(ImagesController());
    Get.put(ProjectController());
    Get.put(AskPriceController());
    Get.put(BlogController());
    Get.put(BannerController());

    Get.put(PayTabsController());
  }
  //ProjectController
}
