import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key, required this.callback});
  Function(String) callback;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "شهر...",
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                callback.call(controller.text.trim().toString());
              }
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            callback.call(value.trim().toString());
          }
        },
      ),
    );
  }
}
