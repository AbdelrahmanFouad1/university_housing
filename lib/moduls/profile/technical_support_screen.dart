import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_text/link_text.dart';
import 'package:university_housing/shard/web_view.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class TechnicalSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backGround,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGround,
            statusBarIconBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: backGround,
          elevation: 0.0,
          titleSpacing: 12.0,
          title: Text(
            'الدعم الفني',
            style: TextStyle(
              fontSize: 20.0,
              color: mainColors,
            ),
          ),
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    'للتواصل مع السكن',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height:5.0),
                Container(
                  width: 250.0,
                  height:1.0,
                  color: separator,
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SelectableText(
                    '0554363862',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SelectableText(
                    '0554363864',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SelectableText(
                    '0554363596',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SelectableText(
                    '0554362493',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                  width: double.infinity,
                  child: Text(
                    'للتواصل مع النقل',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height:5.0),
                Container(
                  width: 250.0,
                  height:1.0,
                  color: separator,
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SelectableText(
                    '01001902862',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SelectableText(
                    '01012236657',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                  width: double.infinity,
                  child: Text(
                    'للتواصل مع شئون الطلاب',
                    style: TextStyle(
                      color: mainColors,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height:5.0),
                Container(
                  width: 250.0,
                  height:1.0,
                  color: separator,
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: LinkText(
                    'http://www.hti.edu.eg/ar/page.aspx?id=1013',
                    onLinkTap: (url){
                      navigateTo(context, WebViewScreen(url));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

