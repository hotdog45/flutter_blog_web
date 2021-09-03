import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

class Socal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          // SvgPicture.asset("assets/icons/behance-alt.svg"),
          Icon(
            Icons.camera,
            size: 33,
          ),
        if (!Responsive.isMobile(context))
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            // child: SvgPicture.asset("assets/icons/feather_dribbble.svg"),
            child: Icon(
              Icons.camera,
              size: 33,
            ),
          ),
        if (!Responsive.isMobile(context))
          // SvgPicture.asset("assets/icons/feather_twitter.svg"),
          Icon(
            Icons.camera,
            size: 33,
          ),
        SizedBox(width: kDefaultPadding),
        ElevatedButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical:
                  kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
            ),
          ),
          child: Text("Let's Talk"),
        ),
      ],
    );
  }
}
