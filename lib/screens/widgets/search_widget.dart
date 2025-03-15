import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      hintText: "شهر...",
      onSubmitted: (value) {},
    );
  }
}
