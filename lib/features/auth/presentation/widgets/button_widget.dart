import 'package:flutter/material.dart';



class CommonButtonWidget extends StatelessWidget {
  final String text;
  final Function() ontap;
  const CommonButtonWidget({
    Key? key,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
        onPressed: ontap,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(text),
        ));
  }
}