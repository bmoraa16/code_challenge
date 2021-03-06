import 'package:code_challenge/src/pages/home/home.dart';
import 'package:code_challenge/src/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';
import '../../utils/string_validator.dart';
import '../../utils/upper_case_formater.dart';
import '../../widgets/bezier_container.dart';
import '../../widgets/general_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController rfcCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                    SizedBox(height: height * .2),
                    _title(),
                    const SizedBox(height: 50),
                    _emailPasswordWidget(),
                    const SizedBox(height: 20),
                    GeneralButtonWidget(
                        buttonText: login,
                        onpressed: () => {
                              if (_formKey.currentState!.validate())
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomePage()))
                                }
                            }),
                    //_divider(),
                    SizedBox(height: height * .055),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _entryField(
      String title,
      dynamic validatorField,
      TextEditingController controllerField,
      List<TextInputFormatter> formatersRule,
      int maxLengthValue) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controllerField,
            maxLength: maxLengthValue,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: neutralGrisClaro),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: neutralGrisClaro),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                counterText: ""),
            validator: validatorField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            /*inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
            ],
            */
            inputFormatters: formatersRule,
          )
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Code',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: primaryPurple),
          children: [
            TextSpan(
              text: ' ',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'Challenge',
              style: TextStyle(color: primaryPurple, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _entryField(
              rfc,
              (value) => StringValidator.validateRFC(value!),
              rfcCtrl,
              [
                FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                UpperCaseTextFormatter(),
              ],
              13),
          _entryField(
              email,
              (value) => StringValidator.validatePassword(value!, rfcCtrl),
              emailCtrl,
              [
                FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
              ],
              30),
        ],
      ),
    );
  }
}
