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
      body: Obx(
        () => GoogleMap(
          initialCameraPosition: CameraPosition(
            target: controller.currentLatLng.value,
            zoom: 15,
          ),
          onTap: (latLng) {},
          onMapCreated: (mapController) =>
              controller.completer.complete(mapController),
          markers: controller.markers.toSet(),
        ),
      ),
    );
  }
}
