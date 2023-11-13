import 'package:flutter/material.dart';
import 'package:sofa/data/models/user.dart';

class UserInfo extends StatelessWidget {
  final User user;
  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> userInfo = {
      'Email': user.email,
      'Website': user.website,
      'Phone': user.phone,
      'Address':
          '${user.address.city}, ${user.address.street}, ${user.address.suite}, ${user.address.zipcode}',
      'Company':
          '${user.company.name}, ${user.company.bs}, ${user.company.catchPhrase}',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: userInfo.entries.map((entry) {
        return Text('${entry.key} : ${entry.value}');
      }).toList(),
    );
  }
}
