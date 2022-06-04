import 'package:code_challenge/src/pages/home/select_entity.dart';
import 'package:code_challenge/src/pages/login/login_page.dart';
import 'package:code_challenge/src/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/bezier_container.dart';
import '../../widgets/dialog_logout.dart';
import '../../widgets/general_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                    opacity: a1.value,
                    child: DialogLogout(
                      title: areYouSureColseSesion,
                      subtitle: youWillToLoginScreen,
                      titleVisible: true,
                      cancel: () => {Navigator.of(context).pop()},
                      accept: () => {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()))
                      },
                    )),
              );
            },
            transitionDuration: const Duration(milliseconds: 200),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, animation1, animation2) {
              return Container();
            });
        return Future.value(false);
      },
      child: Scaffold(
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
                        buttonText: reviewHistorical,
                        onpressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SelectEntityPage()))
                            }),
                    SizedBox(height: height * .05),
                    GeneralButtonWidget(
                        buttonText: exit,
                        onpressed: () => {
                              showGeneralDialog(
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  transitionBuilder: (context, a1, a2, widget) {
                                    return Transform.scale(
                                      scale: a1.value,
                                      child: Opacity(
                                          opacity: a1.value,
                                          child: DialogLogout(
                                            title: areYouSureColseSesion,
                                            subtitle: youWillToLoginScreen,
                                            titleVisible: true,
                                            cancel: () =>
                                                {Navigator.of(context).pop()},
                                            accept: () => {
                                              Navigator.of(context).popUntil(
                                                  (route) => route.isFirst),
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const LoginPage()))
                                            },
                                          )),
                                    );
                                  },
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  barrierDismissible: true,
                                  barrierLabel: '',
                                  context: context,
                                  pageBuilder:
                                      (context, animation1, animation2) {
                                    return Container();
                                  })
                            }),
                    //_divider(),
                    SizedBox(height: height * .055),
                  ],
                ),
              ),
            ),
            //Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      )),
    );
  }

  Widget _title() {
    return const Text(selectOption,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: primaryPurple));
  }
}
