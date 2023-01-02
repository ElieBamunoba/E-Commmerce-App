import 'package:flutter/material.dart';

class CustomInputTextField extends StatelessWidget {
  final String lable;
  final BuildContext context;
  final TextEditingController controller;
  const CustomInputTextField({
    Key? key,
    required this.lable,
    required this.controller,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 75,
            child: Text(
              lable,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ))
        ],
      ),
    );
  }
}
