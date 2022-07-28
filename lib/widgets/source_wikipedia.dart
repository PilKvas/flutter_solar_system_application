import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WikipediaWidget extends StatelessWidget {
  const WikipediaWidget({
    Key? key,
    required Uri mainUrl,
  })  : _mainUrl = mainUrl,
        super(key: key);

  final Uri _mainUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(_mainUrl);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Source :',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
          ),
          Text(
            'Wikipedia',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                ),
          ),
          const SizedBox(
            width: 4,
          ),
          Image.asset(
            "assets/box-arrow.png",
            width: 12,
            height: 12,
          ),
        ],
      ),
    );
  }
}
