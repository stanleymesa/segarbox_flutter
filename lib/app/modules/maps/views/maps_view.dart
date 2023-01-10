import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite,
        title: Text(
          'Maps',
          style:
              Get.textTheme.headlineLarge!.copyWith(color: AppColorTheme.green),
        ),
        iconTheme: IconThemeData(color: AppColorTheme.green),
        titleSpacing: 0,
        elevation: 0.2,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          backgroundColor: AppColorTheme.green,
          onPressed: () => controller.getCurrentPosition(),
          child: Icon(
            Icons.location_on_rounded,
            color: AppColorTheme.defaultWhite,
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controller.currentLatLng.value,
                zoom: 15,
              ),
              onTap: (latLng) {
                controller.goTo(latLng);
              },
              onMapCreated: (mapController) {
                controller.completer.complete(mapController);
                if (Get.isDarkMode) {
                  mapController.setMapStyle(controller.mapStyle.value);
                }
              },
              markers: controller.markers.toSet(),
              zoomControlsEnabled: false,
            ),
          ),
          InfoWindow(controller: controller),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Get.isDarkMode ? Colors.white12 : Colors.black12,
                    blurRadius: 16,
                    offset: Offset(0, -1),
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Choose Address',
                  style: Get.textTheme.headline1!.copyWith(
                      color: AppColorTheme.defaultWhite,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorTheme.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
            ),
            bottom: 0,
          ),
        ],
      ),
    );
  }
}

class InfoWindow extends StatelessWidget {
  const InfoWindow({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MapsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        top: (controller.isWindowClosed.value) ? -150 : 16,
        left: 16,
        right: 16,
        duration: 500.milliseconds,
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Container(
            padding: EdgeInsets.all(16),
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    (controller.currentPlacemark.value.street != null)
                        ? '${controller.currentPlacemark.value.street}, ${controller.currentPlacemark.value.locality}, ${controller.currentPlacemark.value.subAdministrativeArea}, ${controller.currentPlacemark.value.administrativeArea}, ${controller.currentPlacemark.value.postalCode}, ${controller.currentPlacemark.value.country}'
                        : 'Location Not Found',
                    style: Get.textTheme.headline1,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => controller.isWindowClosed.value = true,
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColorTheme.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
