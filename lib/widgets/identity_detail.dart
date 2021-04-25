import 'package:flutter/material.dart';
import 'package:foodentity_ar/consts/colors.dart';
import 'package:foodentity_ar/consts/enums/image_path.dart';
import 'package:foodentity_ar/models/identity.dart';

class IdentityDetail extends StatelessWidget {
  const IdentityDetail(this._identity);

  final Identity _identity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_identity != null)
          CircleAvatar(
            radius: 50,
            backgroundColor: mainColor100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/${_identity.image.value}"),
            ),
          ),
        ListTile(
          title: _identity != null
              ? Text(
                  _identity.jpName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: mainColor,
                  ),
                )
              : null,
          subtitle: Text(
            _identity?.description ?? "上の画面に表示される食品の「正体」をタップすると、その詳細が表示されます。",
            style: const TextStyle(fontSize: 20),
          ),
        ),
        if (_identity != null) const SizedBox(height: 50),
      ],
    );
  }
}
