import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  DrawerTile({this.iconData, this.title, this.page});

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: primaryColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
