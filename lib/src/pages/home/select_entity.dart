import 'package:code_challenge/src/pages/login/login_page.dart';
import 'package:code_challenge/src/utils/shared_prefences.dart';
import 'package:code_challenge/src/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/bezier_container.dart';
import '../../widgets/general_button.dart';
import '../entities/entity_data.dart';

class SelectEntityPage extends StatefulWidget {
  const SelectEntityPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SelectEntityPageState createState() => _SelectEntityPageState();
}

class _SelectEntityPageState extends State<SelectEntityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .3),
                  _title(),
                  SizedBox(height: height * .1),

                  GeneralButtonWidget(
                      buttonText: nasdaq,
                      onpressed: () => {
                            MyAppPreferences.setEntityName("NDAQ"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const EntityDataPage()))
                          }),
                  SizedBox(height: height * .05),
                  GeneralButtonWidget(
                      buttonText: nikkei,
                      onpressed: () => {
                            MyAppPreferences.setEntityName("^N225"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const EntityDataPage()))
                          }),
                  SizedBox(height: height * .05),
                  GeneralButtonWidget(
                      buttonText: dax,
                      onpressed: () => {
                            MyAppPreferences.setEntityName("DAX"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const EntityDataPage()))
                          }),
                  //_divider(),
                  SizedBox(height: height * .055),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child:
                  const Icon(Icons.keyboard_arrow_left, color: primaryPurple),
            ),
            const Text(back,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryPurple))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(selectEntityString,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: primaryPurple));
  }
}
