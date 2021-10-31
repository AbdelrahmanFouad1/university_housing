import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/dash_board/dash_home_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class AddingSuccessScreen extends StatelessWidget {
  const AddingSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50.0,),
          Center(
            child:SvgPicture.asset(
              'assets/images/phone.svg',
            ),
          ),
          SizedBox(height: 12.0,),
          Text(
            '" تمت الإضافه بنجاح "',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20.0,),
          Container(
            width: double.infinity,
            height: 70.0 ,
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
            child: defaultButton(
                function: () {
                 navigateTo(context, DashHomeScreen());
                },
                text: 'العودة لرئيسية',
                btnColor: mainColors),
          ),
        ],
      ),
    );
  }
}
