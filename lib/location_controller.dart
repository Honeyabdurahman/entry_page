import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController{
  Placemark pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;
}