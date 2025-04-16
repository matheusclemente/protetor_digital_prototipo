import 'package:flutter/material.dart';

class EmergencyContact {
  final String name;
  final String description;
  final String phone;
  final IconData iconData;

  const EmergencyContact({
    required this.name,
    required this.description,
    required this.phone,
    required this.iconData,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'phone': phone,
    'iconData': iconData.codePoint,
  };
}

class EmergencyContactModel {
  static final List<EmergencyContact> emergencyContacts = [
    EmergencyContact(
      name: 'Polícia Civil',
      description: 'Para denúncias de crimes digitais',
      phone: '197',
      iconData: Icons.security,
    ),
  ];
}