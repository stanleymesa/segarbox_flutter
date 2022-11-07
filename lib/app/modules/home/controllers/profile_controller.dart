import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:segarbox_flutter/theme/theme.dart';

class ProfileController extends GetxController {
  // Status Bar
  final color = defaultWhite.obs;
  void getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    color.value = await paletteGenerator.dominantColor?.color ?? defaultWhite;
  }

  // Scroll
  final ScrollController scrollC = ScrollController();
  final scrollOffset = 0.0.obs;

  // Switch Dark Mode
  final isDarkMode = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getImagePalette(AssetImage('assets/image/japan.jpg'));
    scrollC.addListener(() {
      scrollOffset.value = scrollC.offset;
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
