import 'package:flutter/material.dart';

class CakeShop {
  String name;
  String address;
  String phone;
  String image1;
  String image2;
  String image3;
  String description;
  String openCloseTime;
  String website;
  String facebook;
  String latitude;
  String longitude;

  // Constructor ต้องชื่อเดียวกับ Class
  CakeShop({
    required this.name,
    required this.address,
    required this.phone,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.description,
    required this.openCloseTime,
    required this.website,
    required this.facebook,
    required this.latitude,
    required this.longitude,
  });
}