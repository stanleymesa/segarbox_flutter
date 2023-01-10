import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:segarbox_flutter/theme/app_theme.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapsController extends GetxController {
  Completer<GoogleMapController> completer = Completer();
  final mapStyle = ''.obs;

  final markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(-6.9896536, 110.4225974),
    ),
  ].obs;

  final currentLatLng = LatLng(-6.9896536, 110.4225974).obs;
  final currentPlacemark = Placemark().obs;
  final isWindowClosed = true.obs;

  Future<void> getCurrentPosition() async {
    if (await Permission.location.serviceStatus.isDisabled) {
      Get.snackbar('Location Services', 'Location services are disabled');
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
      goTo(currentLatLng.value);
    }
  }

  Future<void> goTo(LatLng latLng) async {
    isWindowClosed.value = false;

    GoogleMapController mapController = await completer.future;
    final oldMarkerIndex =
        this.markers.indexWhere((marker) => marker.markerId == MarkerId('1'));
    if (oldMarkerIndex >= 0) {
      this.markers[oldMarkerIndex] = Marker(
        markerId: MarkerId('1'),
        position: LatLng(latLng.latitude, latLng.longitude),
      );
    }
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: latLng,
      zoom: 15,
    )));

    var placemark =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    currentPlacemark.value = placemark.firstWhere((element) =>
        element.street != null &&
        element.locality != null &&
        element.subAdministrativeArea != null &&
        element.administrativeArea != null &&
        element.postalCode != null &&
        element.country != null);
  }

  void setSystemBar() {
    AppTheme.systemBarColor(
        navBarColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite);
  }

  @override
  void onInit() {
    super.onInit();
    setSystemBar();
    rootBundle.loadString('assets/maps/map_style.txt').then(
          (value) => mapStyle.value = value,
        );
    getCurrentPosition();
    AppTheme.systemBarColor(
        navBarColor: Get.isDarkMode
            ? AppColorTheme.defaultBlack
            : AppColorTheme.defaultWhite);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() {}
}
