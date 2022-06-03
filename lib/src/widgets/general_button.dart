import 'package:flutter/material.dart';

import '../utils/colors.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onpressed;

  const GeneralButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [malibu, primaryPurple])),
        child: ElevatedButton(
          onPressed: () {
            onpressed.call();
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 50)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            //elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }
}
