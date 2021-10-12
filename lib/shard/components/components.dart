import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:university_housing/moduls/bus/bus_screen.dart';
import 'package:university_housing/moduls/fines/fines_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/notifications/notifications_screen.dart';
import 'package:university_housing/moduls/profile/profile_screen.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
Widget defaultButton({
  double? width,
  double? height,
  double? radius = 8.0,
  double? fontSize,
  EdgeInsets? marginSize,
  required VoidCallback function,
  required String text,
  required Color btnColor,
}) =>
    Container(
      width: width,
      height: height,
      margin: marginSize,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        color: btnColor,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  String? label,
  String? hint,
  required IconData prefix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s){
        onSubmit;
      },
      onChanged: (s){
        onChange;
      },
      onTap: (){
        onTap;
      },
      validator: (s){
        validate;
      },
      cursorColor: mainColors,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14.0
        ),
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        border:OutlineInputBorder(),
      ),
    );


Widget defaultButton2({
  double? width ,
  double? height,
  double? fontSize ,
  EdgeInsets? marginSize ,
  required VoidCallback function,
  required String text,
  required Color btnColor,
}) => Container(
  width: width,
  height: height,
  margin: marginSize,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
      bottomLeft:  Radius.circular(8.0),
      bottomRight: Radius.circular(8.0),
    ),
    color: btnColor,
  ),
);


AppBar defaultAppBar({
  required BuildContext context,
  double? titleSpacing = 12.0,
  bool? showBus = false,
  bool? pop = true,
  bool? bookingDone = false,
  Widget? popToScreen,
})=> AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: backGround,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: backGround,
    elevation: 0.0,
    titleSpacing: titleSpacing,
    automaticallyImplyLeading: false,
    actions: [
      if(showBus == true)
        Container(
          padding: const EdgeInsets.all(0.0),
          width: 30.0,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              'assets/icon/bus.svg',
              width: 18.0,
              height: 18.0,
            ),
            onPressed: () {
              navigateTo(context, BusScreen());
            },
          ),
        ),
      Container(
        padding: const EdgeInsets.all(0.0),
        width: 30.0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon:  Icon(
            Icons.person_outline,
            color: mainColors,
          ),
          onPressed: () {
            navigateTo(context, ProfileScreen());
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.all(0.0),
        width: 30.0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Icon(
                IconBroken.Notification,
                color: mainColors,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0,left: 4.0),
                child: SvgPicture.asset('assets/icon/dot.svg'),
              ),
            ],
          ),
          onPressed: () {
            navigateTo(context, NotificationsScreen());
          },
        ),
      ),
      if(pop == true)
        Container(
          padding: const EdgeInsets.all(0.0),
          width: 30.0,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon:  Icon(
              IconBroken.Arrow___Left_2,
              color: mainColors,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      if(bookingDone == true)
        InkWell(
          onTap: (){
            navigateTo(context, HomeScreen());
          },
          child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 14.0,
              backgroundColor: backGround,
            ),
            SvgPicture.asset('assets/images/back_arrow.svg'),
          ],
      ),
        ),
      const SizedBox(width: 6.0,),
    ],
    title: Text(
      'أهلا , 42018122',
      style: TextStyle(
        color: mainColors,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    )
);


Widget defaultTitleBox({
  required String img,
  required String title,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 88.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              img,
              width: 68.0,
              height: 68.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: finesColor,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );

Widget defaultTiTleBoxColumn({
  required String img,
  required String title,
  double? width,
  double? height,
  double widthImage = 68.0,
  double heightImage = 68.0,
  double fontSize = 20.0,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(8.0),
      ),

      child: Column(
        mainAxisAlignment:mainAxisAlignment,
        children: [
          const SizedBox(height: 20.0,),
          Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              img,
              width: widthImage,
              height: heightImage,
            ),
          ),
          const SizedBox(height: 5.0,),
          Text(
            title,
            style: TextStyle(
              color: finesColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );

Widget whiteBoard({
  double? height = 250.0,
  int? maxLine = 10,
}) =>
    Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          scrollPhysics: BouncingScrollPhysics(),
          cursorColor: mainColors,
          maxLines: maxLine,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );

Widget buildFinesBox(
  context, {
  double fontsize1 = 16.0,
  double fontsize2 = 20.0,
}) =>
    Container(
      width: double.infinity,
      height: 87.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        color: finesColor,
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'لديك غرامة بقيمة',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: fontsize1,
                  ),
                ),
                Text(
                  '120 جنيه مصرى',
                  style: TextStyle(
                      color: mainColors,
                      fontSize: fontsize2,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60.0, bottom: 10.0),
                child: defaultButton(
                  function: () {
                    navigateTo(context, FinesScreen());
                  },
                  text: 'عرض التفاصيل',
                  fontSize: 12.0,
                  height: 30.0,
                  btnColor: mainColors,
                ),
              ),
              SvgPicture.asset(
                'assets/images/hand.svg',
                semanticsLabel: 'fine',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );

// Toast in all app
void showToast({
  required String message,
  required ToastStates state,
}) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 14.0,
);

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget buildEnquiry(context, {
  required double height,
  required StatusStates state,
  required Widget body,
}) => Container(
  height: height,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          height: double.infinity,
          width: 10.0,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22.0),
              bottomLeft: Radius.circular(22.0),
            ),
            color: chooseStatusColor(state),
          ),
        ),
      ),
      body,
      // Expanded(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(
      //       height: 122.0,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const Text(
      //             'سؤال ؟',
      //             style: TextStyle(
      //               fontSize: 16.0,
      //               fontWeight: FontWeight.w800,
      //             ),
      //           ),
      //           const SizedBox(height: 6.0,),
      //           Text(
      //             'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.',
      //             maxLines: 3,
      //             overflow: TextOverflow.ellipsis,
      //             style: Theme.of(context).textTheme.caption!.copyWith(
      //               height: 1.4,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    ],
  ),
);

enum StatusStates { ACCEPT, REJECT, WAITING }

Color chooseStatusColor(StatusStates state) {
  Color color;

  switch (state) {
    case StatusStates.ACCEPT:
      color = Colors.green;
      break;
    case StatusStates.REJECT:
      color = Colors.red;
      break;
    case StatusStates.WAITING:
      color = Colors.amber;
      break;
  }

  return color;
}


Widget buildDialog({
  required context,
  required String title,
  required Widget child,
}) => AlertDialog(
  title: Text(
    title,
    textDirection: TextDirection.rtl,
    style: TextStyle(color: mainColors),
  ),
  contentPadding: EdgeInsets.zero,
  content: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: child,
    ),
  ),
  actions: [
    TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        'الغاء',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: mainColors,
        ),
      ),
    ),
    TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        'اختيار',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: mainColors,
        ),
      ),
    ),
  ],
);


