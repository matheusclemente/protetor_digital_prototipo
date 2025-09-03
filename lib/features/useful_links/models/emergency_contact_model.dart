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
      description: 'Denuncie crimes na internet',
      phone: '197',
      iconData: Icons.local_police,
    ),
    EmergencyContact(
      name: 'Ministério Público do Distrito Federal e Territórios',
      description: 'Denuncie fraudes e golpes',
      phone: '61 3343-9500',
      iconData: Icons.security,
    ),
    EmergencyContact(
      name: 'Polícia Militar',
      description: 'Se estiver em perigo agora',
      phone: '190',
      iconData: Icons.local_police_outlined,
    ),
  ];
}
