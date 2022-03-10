import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/utils/image_svg_utils.dart';
import 'package:provider_base/utils/utils.dart';

class LoginScreen extends HookConsumerWidget with Utils {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login_screen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double _fontSize = 15;
    double _paddingText = 15;
    double _sizeWith = 0.66;
    return Scaffold(
      backgroundColor: const Color(0xFFAFCEB3),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              boldText('Provider Base'),
              boldText('Smart stories for \n curious people.'),
              Column(
                children: [
                  normalText(
                    'Get started by creating your account',
                    textColor: const Color(0xFF000000),
                    fonSize: _fontSize,
                    padding: _paddingText,
                  ),
                  loginBtn(
                    context,
                    urlSvg: ImageSvg.icGoogle,
                    txtLogin: 'Sign up with Google',
                    onTap: () {
                      // TODO(anyone): login by google
                      pushReplacement(context, const HomeScreen(title: 'base'));
                    },
                    sizeWith: _sizeWith,
                  ),
                  loginBtn(
                    context,
                    urlSvg: ImageSvg.icFacebook,
                    txtLogin: 'Sign up with Facebook',
                    onTap: () {
                      // TODO(anyone): login by facebook
                      pushReplacement(context, const HomeScreen(title: 'base'));
                    },
                    sizeWith: _sizeWith,
                  ),
                  Platform.isIOS
                      ? loginBtn(
                          context,
                          urlSvg: ImageSvg.icApple,
                          txtLogin: 'Sign up with Apple',
                          onTap: () {
                            // TODO(anyone): login by apple
                            pushReplacement(context, const HomeScreen(title: 'base'));
                          },
                          sizeWith: _sizeWith,
                        )
                      : const SizedBox(),
                  Stack(
                    children: [
                      const Divider(
                        color: Colors.black,
                        thickness: 3,
                        height: 25,
                        indent: 120,
                        endIndent: 120,
                      ),
                      Center(
                        child: Container(
                          width: 40,
                          height: 25,
                          color: const Color(0xFFAFCEB3),
                        ),
                      ),
                      const Center(
                          child: Text(
                        'Or',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      )),
                    ],
                  ),
                  loginBtn(
                    context,
                    urlSvg: ImageSvg.icQrCode,
                    txtLogin: 'QR Scanner',
                    onTap: () {
                      // TODO(anyone): Scanner qrcode
                      pushReplacement(context, const HomeScreen(title: 'base'));
                    },
                    sizeWith: 0.4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      normalText(
                        'Already have an account? ',
                        textColor: const Color(0xFF000000),
                        fonSize: _fontSize,
                        padding: _paddingText,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: normalText(
                          'Sign in.',
                          textColor: const Color.fromARGB(255, 255, 0, 0),
                          fonSize: _fontSize,
                          padding: _paddingText,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  normalText(
                    'By creating an account. I accept Provider Base\'s',
                    textColor: const Color(0xFF000000),
                    fonSize: 14,
                    padding: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Terms of Service',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget boldText(String boldText) {
    return Text(
      boldText,
      style: GoogleFonts.robotoSlab(
        fontWeight: FontWeight.w500,
        fontSize: 36,
      ),
    );
  }

  Widget normalText(String normalText,
      {required Color textColor,
      required double fonSize,
      required double padding}) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding, top: padding),
      child: Text(
        normalText,
        style: TextStyle(
          color: textColor,
          fontSize: fonSize,
        ),
      ),
    );
  }

  Widget loginBtn(
    BuildContext context, {
    required double sizeWith,
    required String urlSvg,
    required String txtLogin,
    required Function() onTap,
  }) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 40,
        width: size.width * sizeWith,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        urlSvg,
                        height: 25,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(txtLogin,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
