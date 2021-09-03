import 'package:flutter/material.dart';

final double mobileW = 480;
final double tabletW = 800;
final double desktopW = 1200;
final double bigPCW = 2600;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileW;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletW &&
      MediaQuery.of(context).size.width >= mobileW;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletW;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 900 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return desktop;
        }
        // If width it less then 900 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 650) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}
