import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSelectedItemLang('English'),
          SizedBox(
            height: 18,
          ),
          buildUnSelectedItemLang('Arabic')
        ],
      ),
    );
  }

  Widget buildSelectedItemLang(String selectedLang) {
    return Row(
      children: [
        Expanded(
            child: Text(
          selectedLang,
          style: Theme.of(context).textTheme.headlineMedium,
        )),
        Icon(Icons.check, size: 28, color: Theme.of(context).primaryColor)
      ],
    );
  }

  Widget buildUnSelectedItemLang(String unSelectedLang) {
    return Text(
      unSelectedLang,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 18),
    );
  }
}
