import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:university_housing/moduls/bus/bus_screen.dart';
import 'package:university_housing/moduls/fines/fines_screen.dart';
import 'package:university_housing/moduls/home/home_screen.dart';
import 'package:university_housing/moduls/notifications/notifications_screen.dart';
import 'package:university_housing/moduls/profile/edit_profile_screen.dart';
import 'package:university_housing/moduls/profile/profile_screen.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

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

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        Function? onSubmit,
        // Function? onChange,
        ValueChanged<String>? onChange,
        Function? onTap,
        bool isPassword = false,
        required Function validate,
        String? label,
        String? hint,
        required IconData prefix,
        Function? suffixPressed,
        bool isClickable = true,
        required context}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChange,
      //     (s) {
      //   onChange;
      // },
      onTap: () {
        onTap;
      },
      validator: (s) {
        validate;
      },
      cursorColor: mainColors,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        labelText: label,
        labelStyle:
            Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget defaultButton2({
  double? width,
  double? height,
  double? fontSize,
  EdgeInsets? marginSize,
  required VoidCallback function,
  required String text,
  required Color btnColor,
  required style,
}) =>
    Container(
      width: width,
      height: height,
      margin: marginSize,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: style,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
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
  Object? state,
}) =>
    AppBar(
        titleSpacing: titleSpacing,
        automaticallyImplyLeading: false,
        actions: [
          if (showBus == true)
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
                  navigateTo(context, const BusScreen());
                },
              ),
            ),
          Container(
            padding: const EdgeInsets.all(0.0),
            width: 30.0,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.person_outline,
                color: ThemeCubit.get(context).darkTheme
                    ? mainTextColor
                    : mainColors,
              ),
              onPressed: () {
                AppCubit.get(context).getReviews();
                if(AppCubit.get(context).profileModel!.isresident){
                  navigateTo(context, const ProfileScreen());
                }else{
                  navigateTo(context, const EditProfileScreen());
                }
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
                    color: ThemeCubit.get(context).darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                    child: SvgPicture.asset('assets/icon/dot.svg'),
                  ),
                ],
              ),
              onPressed: () {
                navigateTo(context, const NotificationsScreen());
              },
            ),
          ),
          if (pop == true)
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 30.0,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: ThemeCubit.get(context).darkTheme
                      ? mainTextColor
                      : mainColors,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          if (bookingDone == true)
            InkWell(
              onTap: () {
                navigateTo(context, HomeScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SvgPicture.asset(
                  'assets/images/back_arrow.svg',
                  color: ThemeCubit.get(context).darkTheme
                      ? mainTextColor
                      : mainColors,
                ),
              ),
            ),
          const SizedBox(
            width: 6.0,
          ),
        ],
        title: Text(
          'أهلا , ${AppCubit.get(context).profileModel != null ? AppCubit.get(context).profileModel!.id : 'xxxxxxxx'}',
          style: Theme.of(context).textTheme.headline6,
        ));

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
        mainAxisAlignment: mainAxisAlignment,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              img,
              width: widthImage,
              height: heightImage,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
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

Widget whiteBoard(
  context, {
  double? height = 250.0,
  int? maxLine = 10,
  String? hint = '',
  TextEditingController? controller,
}) =>
    Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color:
            ThemeCubit.get(context).darkTheme ? finesColorDark : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey, width: 1),
        boxShadow: [
          BoxShadow(
            color: ThemeCubit.get(context).darkTheme
                ? Colors.black.withOpacity(0.5)
                : Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          controller: controller,
          scrollPhysics: const BouncingScrollPhysics(),
          cursorColor:
              ThemeCubit.get(context).darkTheme ? mainTextColor : mainColors,
          maxLines: maxLine,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyText1,
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
        color: ThemeCubit.get(context).darkTheme ? finesColorDark : finesColor,
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
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: fontsize1,
                      ),
                ),
                Text(
                  '${AppCubit.get(context).sum} جنية مصرى',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: fontsize2, fontWeight: FontWeight.bold),
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
                    navigateTo(context, const FinesScreen());
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
}) =>
    Fluttertoast.showToast(
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

Widget buildEnquiry(
  context, {
  required double height,
  required StatusStates state,
  required Widget body,
}) =>
    Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color:
            ThemeCubit.get(context).darkTheme ? finesColorDark : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              height: double.infinity,
              width: 10.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  bottomLeft: Radius.circular(22.0),
                ),
                color: chooseStatusColor(state),
              ),
            ),
          ),
          body,
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
}) =>
    AlertDialog(
      backgroundColor: ThemeCubit.get(context).darkTheme ? backGroundDark : Colors.white,
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                color: ThemeCubit.get(context).darkTheme ? backGroundDark : Colors.white,
                child: child),
          ),
        ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'الغاء',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );


Widget waitingDialog({
  required context
})=>
    AlertDialog(
      backgroundColor: ThemeCubit.get(context).darkTheme ? mainColors : Colors.white,
      contentPadding: EdgeInsets.zero,
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: ThemeCubit.get(context).darkTheme ? mainColors : Colors.white,
            ),
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 12.0,),
                Text(
                  'برجاء الأنتظار ...',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            )),
      ),
    );




Widget roomBox({
  String? buildingName,
  int? roomNumber,
  int? floor,
}) =>
    Container(
      width: double.infinity,
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: mainColors,
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/layer1.svg',
              alignment: AlignmentDirectional.centerEnd,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: 180.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text(
                      'انت الان مقيم في ',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'غرفة:  ${roomNumber ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'الدور:  ${floor ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'المبنى:  ${buildingName ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/images/layer22.svg',
                width: 100.0,
                height: 92.0,
              ),
              const SizedBox(
                width: 22.0,
              ),
            ],
          ),
        ],
      ),
    );










// dashBoard

AppBar dashAppBar({
  required String title,
  required context,
  Widget? action,
  bool? pop = true,
}) =>
    AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        if (action != null) action,
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 30.0,
          child: IconButton(
            icon: Icon(
              Icons.brightness_4,
              color: ThemeCubit.get(context).darkTheme
                  ? mainTextColor
                  : mainColors,
            ),
            onPressed: () {
              ThemeCubit.get(context).changeTheme();
            },
          ),
        ),
        if (pop == true)
          Container(
            padding: const EdgeInsets.all(0.0),
            width: 30.0,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                IconBroken.Arrow___Left_2,
                color: ThemeCubit.get(context).darkTheme
                    ? mainTextColor
                    : mainColors,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
      ],
    );

Widget dashTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String hint,
  required context,
}) =>
    Container(
      width: double.infinity,
      height: 45.0,
      decoration: BoxDecoration(
        color:
            ThemeCubit.get(context).darkTheme ? finesColorDark : Colors.white,
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText1,
          contentPadding: const EdgeInsetsDirectional.all(5.0),
        ),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );



Widget switchedTextFormField({
  required context,
  required DashBoardCubit cubit,
  required controller,
  bool center = true,
  TextInputType type = TextInputType.text,
  int flex = 1,
}) =>
    Expanded(
      flex: flex,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintStyle: Theme.of(context).textTheme.bodyText1,
        ),
        readOnly: cubit.showEdit == true || cubit.showStudentEdit == true || cubit.showWaitingStudentEdit == true || cubit.showSecurityEdit == true || cubit.showRoomEdit == true || cubit.showFinesEdit == false
          ? false
          : true,
        enableInteractiveSelection:
            cubit.showEdit == true || cubit.showStudentEdit == true || cubit.showWaitingStudentEdit == true || cubit.showSecurityEdit == true || cubit.showRoomEdit == true || cubit.showFinesEdit == false
                ? true
                : false,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: center ? TextAlign.center : TextAlign.start,
        keyboardType: type,
      ),
    );

Widget defaultDashBoardTitleBox({
  String? img,
  required String title,
  bool? svg = false,
  String? svgImage ,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: mainColors,
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
            child: svg == false ?Image.asset(
              img!,
              width: 50.0,
              height: 50.0,
            ):SvgPicture.asset(
              svgImage!,
              width: 50.0,
              height: 50.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(title,
              style: TextStyle(
                color: finesColor,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );



Widget smallDashBoardTitleBox({
  String? img,
  required String title,
  bool? svg = false,
  String? svgImage ,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: mainColors,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: svg == false ?Image.asset(
              img!,
              width: 30.0,
              height: 30.0,
            ):SvgPicture.asset(
              svgImage!,
              width: 30.0,
              height: 30.0,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Text(title,
              style: TextStyle(
                color: finesColor,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );


Widget dashWhiteBoard(
    context, {
      double? height = 200.0,
      int? maxLine = 8,
      required String text,
    }) =>
    Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color:
        ThemeCubit.get(context).darkTheme ? finesColorDark : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey, width: 1),
        boxShadow: [
          BoxShadow(
            color: ThemeCubit.get(context).darkTheme
                ? Colors.black.withOpacity(0.5)
                : Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Text(
            text,
            maxLines: maxLine,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );