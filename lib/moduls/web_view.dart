import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: backGround,
          elevation: 0.0,
          titleSpacing: 12.0,
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Container(
                padding: const EdgeInsets.all(0.0),
                width: 34.0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/back_arrow.svg',
                    width: 18.0,
                    height: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
