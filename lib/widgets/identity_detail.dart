import 'package:flutter/material.dart';
import 'package:foodentity_ar/consts/enums/image_path.dart';
import 'package:foodentity_ar/models/identity.dart';

class IdentityDetail extends StatelessWidget {
  const IdentityDetail(this._identity);

  final Identity _identity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: _identity != null
            ? Image.asset("assets/${_identity.image.value}")
            : null,
        title: _identity != null
            ? Text(
                _identity.jpName,
                style: const TextStyle(fontSize: 14),
              )
            : null,
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            _identity?.description ?? "上の画面に表示される食品の「正体」をタップすると、その詳細が表示されます。",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
