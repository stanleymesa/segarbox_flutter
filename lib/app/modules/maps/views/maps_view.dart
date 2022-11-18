import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultWhite,
        title: Text(
          'Maps',
          style: title.copyWith(color: green),
        ),
        iconTheme: IconThemeData(color: green),
        titleSpacing: 0,
        elevation: 0.2,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          backgroundColor: green,
          onPressed: () => controller.getCurrentPosition(),
          child: Icon(Icons.location_on_rounded),
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
              onMapCreated: (mapController) =>
                  controller.completer.complete(mapController),
              markers: controller.markers.toSet(),
              zoomControlsEnabled: false,
            ),
          ),
          InfoWindow(controller: controller),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              width: Get.width,
              decoration: BoxDecoration(
                color: defaultWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
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
                  style: normalBold.copyWith(color: defaultWhite),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: green,
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
              color: defaultWhite,
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
                    style: normalDark,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => controller.isWindowClosed.value = true,
                  child: Icon(
                    Icons.close_rounded,
                    color: green,
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
