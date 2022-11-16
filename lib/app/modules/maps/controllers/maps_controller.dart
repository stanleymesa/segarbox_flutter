import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsController extends GetxController {
  Completer<GoogleMapController> completer = Completer();

  final markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(-6.9896536, 110.4225974),
    ),
  ].obs;

  final currentLatLng = LatLng(-6.9896536, 110.4225974).obs;

  Future<void> getCurrentPosition() async {
    if (await Permission.location.serviceStatus.isDisabled) {
      Get.snackbar('Location Services', 'Location services are disabled');
      print('ERROR 1');
      return;
    } else {
      PermissionStatus status = await Permission.location.status;
      if (status.isDenied) {
        status = await Permission.location.request();
        if (status.isDenied) {
          Get.snackbar(
              'Location Permissions', 'Location permissions are denied');
          return;
        }
      }

      if (status.isPermanentlyDenied) {
        Get.snackbar('Location Permissions',
            'Location permissions are permanently denied, we cannot request permissions.');
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      currentLatLng.value = LatLng(position.latitude, position.longitude);

      GoogleMapController mapController = await completer.future;
      final oldMarkerIndex =
          this.markers.indexWhere((marker) => marker.markerId == MarkerId('1'));
      if (oldMarkerIndex >= 0) {
        this.markers[oldMarkerIndex] = Marker(
            markerId: MarkerId('1'),
            position: LatLng(
                currentLatLng.value.latitude, currentLatLng.value.longitude));
      }
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: currentLatLng.value,
        zoom: 15,
      )));
    }
  }

  // Future<void> goTo(LatLng latLng) async {
  //   GoogleMapController mapController = await completer.future;
  //   final oldMarkerIndex =
  //       this.markers.indexWhere((marker) => marker.markerId == MarkerId('1'));
  //   if (oldMarkerIndex >= 0) {
  //     this.markers[oldMarkerIndex] = Marker(
  //         markerId: MarkerId('1'),
  //         position: LatLng(latLng.latitude, latLng.longitude));
  //   }
  //   mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //     target: latLng,
  //     zoom: 15,
  //   )));
  // }

  @override
  void onInit() {
    super.onInit();
    getCurrentPosition();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() {}
}
