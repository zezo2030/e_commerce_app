import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.color = Colors.transparent,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    // This would parse data from an API
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      icon: _getIconFromString(json['icon']),
      color: Colors.transparent, // Color will be set in the UI
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'icon': _getStringFromIcon(icon)};
  }

  // Helper method to convert string to icon
  static IconData _getIconFromString(String iconName) {
    // This is a simplified version - you'd need a more complete mapping
    switch (iconName) {
      case 'shirt':
        return FontAwesomeIcons.shirt;
      case 'mobile':
        return FontAwesomeIcons.mobileScreen;
      case 'laptop':
        return FontAwesomeIcons.laptopCode;
      case 'house':
        return FontAwesomeIcons.house;
      case 'beauty':
        return FontAwesomeIcons.sprayCan;
      case 'sports':
        return FontAwesomeIcons.baseball;
      case 'toys':
        return FontAwesomeIcons.gamepad;
      case 'books':
        return FontAwesomeIcons.book;
      case 'car':
        return FontAwesomeIcons.car;
      default:
        return FontAwesomeIcons.tag;
    }
  }

  // Helper method to convert icon to string
  static String _getStringFromIcon(IconData icon) {
    if (icon == FontAwesomeIcons.shirt) return 'shirt';
    if (icon == FontAwesomeIcons.mobileScreen) return 'mobile';
    if (icon == FontAwesomeIcons.laptopCode) return 'laptop';
    if (icon == FontAwesomeIcons.house) return 'house';
    if (icon == FontAwesomeIcons.sprayCan) return 'beauty';
    if (icon == FontAwesomeIcons.baseball) return 'sports';
    if (icon == FontAwesomeIcons.gamepad) return 'toys';
    if (icon == FontAwesomeIcons.book) return 'books';
    if (icon == FontAwesomeIcons.car) return 'car';
    return 'tag';
  }
}
