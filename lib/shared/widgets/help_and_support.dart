import 'package:flutter/material.dart';
import 'package:tech_store/shared/responsive/responsive_layout.dart';
import 'package:tech_store/shared/widgets/phonewidgets/help_and_support_phone.dart';
import 'package:tech_store/shared/widgets/tabletwidget/help_and_support_tablet.dart';
class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      phone:HelpAndSupportPhone() ,
      tablet: HelpAndSupportTablet(),
    );
  }
}
