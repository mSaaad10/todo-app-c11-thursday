import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSelectedItemTheme('Light'),
          SizedBox(
            height: 18,
          ),
          buildUnSelectedItemTheme('Dark')
        ],
      ),
    );
  }

  Widget buildSelectedItemTheme(String selectedTheme) {
    return Row(
      children: [
        Expanded(
            child: Text(
          selectedTheme,
          style: Theme.of(context).textTheme.headlineMedium,
        )),
        Icon(Icons.check, size: 28, color: Theme.of(context).primaryColor)
      ],
    );
  }

  Widget buildUnSelectedItemTheme(String unSelectedTheme) {
    return Text(
      unSelectedTheme,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 18),
    );
  }
}
