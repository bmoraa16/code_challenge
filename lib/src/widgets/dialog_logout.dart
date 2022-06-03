import 'package:flutter/material.dart';

import '../utils/asset_route.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';

class DialogLogout extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool titleVisible;
  final VoidCallback accept;
  final VoidCallback cancel;
  const DialogLogout({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.titleVisible,
    required this.accept,
    required this.cancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: neutralWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: primaryPurple50,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: Stack(children: [
                    Visibility(
                      visible: titleVisible,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, right: 16.0, left: 32.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: const TextStyle(
                                color: subaGrey,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: primaryPurple50,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(800, 400),
                        bottomRight: Radius.elliptical(800, 400)),
                  ),
                  child: Image.asset(
                    errorGif,
                    color: primaryPurple,
                    width: Utils.getWidthScreen(context) * 0.04,
                    height: Utils.getHeightScreen(context) * 0.11,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: cancel,
                        style: ElevatedButton.styleFrom(
                            primary: ceruleanBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        child: const Text(
                          cancelString,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: accept,
                        style: ElevatedButton.styleFrom(
                            primary: ceruleanBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        child: const Text(
                          acceptString,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
