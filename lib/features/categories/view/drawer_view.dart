import 'package:flutter/material.dart';
import 'package:news_app_c14/common/extentions/context_extentions.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key, required this.goHome});
  final void Function() goHome;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: const Alignment(0, 0),
          color: context.getColorSceem().secondary,
          height: (166 / 852) * context.getScreenSize().height,
          child: Text(
            'News App', //TODO:localization
            style: context
                .getTextThemes()
                .titleLarge!
                .copyWith(fontSize: 24, color: context.getColorSceem().primary),
          ),
        ),
        ListTile(
          onTap: () => goHome(),
          leading: Icon(
            Icons.home_outlined,
            color: context.getColorSceem().secondary,
          ),
          title: Text(
            'Go To Home', //TODO:localization
            style: context.getTextThemes().titleLarge!.copyWith(fontSize: 20),
          ),
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        )
      ],
    );
  }
}
