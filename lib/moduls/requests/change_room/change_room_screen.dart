import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/requests/change_room/success_change_room_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class ChangeRoomScreen extends StatelessWidget {

  var floorController = TextEditingController();
  var roomController = TextEditingController();


  final List<ChangeFloorModel> _group = [
    ChangeFloorModel(
      text: "الدور الأول",
      index: 1,
    ),
    ChangeFloorModel(
      text: "الدور الثانى",
      index: 2,
    ),
    ChangeFloorModel(
      text: "الدور الثالث",
      index: 3,
    ),
    ChangeFloorModel(
      text: "الدور الرابع",
      index: 4,
    ),
    ChangeFloorModel(
      text: "الدور الخامس",
      index: 5,
    ),
  ];

  final List<ChangeRoomModel> _groupRoom = [
    ChangeRoomModel(
      text: "غرفة 201",
      index: 1,
    ),
    ChangeRoomModel(
      text: "غرفة 202",
      index: 2,
    ),
    ChangeRoomModel(
      text: "غرفة 203",
      index: 3,
    ),
    ChangeRoomModel(
      text: "غرفة 204",
      index: 4,
    ),
    ChangeRoomModel(
      text: "غرفة 205",
      index: 5,
    ),
    ChangeRoomModel(
      text: "غرفة 306",
      index: 6,
    ),
    ChangeRoomModel(
      text: "غرفة 307",
      index: 7,
    ),
    ChangeRoomModel(
      text: "غرفة 308",
      index: 8,
    ),
    ChangeRoomModel(
      text: "غرفة 409",
      index: 9,
    ),
    ChangeRoomModel(
      text: "غرفة 510",
      index: 10,
    ),
    ChangeRoomModel(
      text: "غرفة 511",
      index: 11,
    ),
  ];

  ChangeRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var cubit =  AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: defaultAppBar(context: context),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 140.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: mainColors,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140.0,
                              child: SvgPicture.asset(
                                'assets/images/layer1.svg',
                                alignment: AlignmentDirectional.centerEnd,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(height: 6.0,),
                                      Text(
                                        'انت الان مقيم في ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,

                                        ),
                                      ),
                                      Text(
                                        'غرفه  B',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        'الدور  الخامس',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        'عماره  الزهراء',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
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
                                const SizedBox(width: 22.0,),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0,),
                      Text(
                        'طلب تغيير الغرفة',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 24.0,),

                      // change floor
                      Container(
                        width: double.infinity,
                        height:45.0,
                        margin: const EdgeInsets.symmetric(horizontal: 14.0),
                        decoration: BoxDecoration(
                          color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                          borderRadius: BorderRadius.circular(8.0,),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: TextFormField(
                          controller: floorController,
                          // enabled: false,
                          readOnly: true,
                          onTap: () {
                            showDialog<void>(
                              barrierColor:ThemeCubit.get(context).darkTheme? backGroundDark : Colors.white,
                                context: context,
                                builder: (context) => buildDialog(
                                    context: context,
                                    title: 'اختر رقم الدور',
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: _group.map((e) => RadioListTile(
                                        activeColor:ThemeCubit.get(context).darkTheme? mainTextColor: backGroundDark,
                                        tileColor: backGroundDark,
                                        title: Text(
                                            e.text,
                                          style: Theme.of(context).textTheme.bodyText1!,
                                        ),
                                        groupValue: cubit.currVal,
                                        value: e.index,
                                        onChanged: (int? val) {
                                          cubit.changeFloor(val!, e.text);
                                          floorController.text = cubit.currText;
                                          Navigator.pop(context);
                                        },
                                      )).toList(),
                                    ),
                                ),
                            );
                          },
                          decoration:   InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down,
                              color:ThemeCubit.get(context).darkTheme? mainTextColor : Colors.black38,
                            ),
                            hintText: 'اختر رقم الدور',
                            hintStyle: Theme.of(context).textTheme.subtitle1,
                            contentPadding:const EdgeInsetsDirectional.all(8.0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16.0,),

                      // change room
                      Container(
                        width: double.infinity,
                        height:45.0,
                        margin: const EdgeInsets.symmetric(horizontal: 14.0),
                        decoration: BoxDecoration(
                          color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                          borderRadius: BorderRadius.circular(8.0,),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: TextFormField(
                          controller: roomController,
                          readOnly: true,
                          onTap: (){
                            if(floorController.text.isEmpty){
                              showToast(state: ToastStates.WARNING,message: 'أدخل رقم الدور أولا');
                            }else{
                              showDialog<void>(
                                barrierColor:ThemeCubit.get(context).darkTheme? backGroundDark : Colors.white,
                                context: context,
                                builder: (context) => buildDialog(
                                  context: context,
                                  title: 'اختر رقم الغرفه',
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: _groupRoom.map((e) => RadioListTile(
                                      title: Text(
                                        e.text,
                                        style: Theme.of(context).textTheme.bodyText1!,
                                      ),
                                      groupValue: cubit.currentRoomVal,
                                      value: e.index,
                                      onChanged: (int? val) {
                                        cubit.selectRoom(val!, e.text);
                                        roomController.text = cubit.currentRoomText;
                                        cubit.ShowAllDetails(true);
                                        Navigator.pop(context);
                                      },
                                    )).toList(),
                                  ),
                                ),
                              );
                            }
                          },
                          decoration:   InputDecoration(
                            border: InputBorder.none,
                            suffixIcon:  Icon(
                              Icons.keyboard_arrow_down,
                              color:ThemeCubit.get(context).darkTheme? mainTextColor : Colors.black38,
                            ),
                            hintText: 'اختر رقم الغرفة',
                            hintStyle: Theme.of(context).textTheme.subtitle1,
                            contentPadding:const EdgeInsetsDirectional.all(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 160.0,),


                      defaultButton(
                        function: (){
                          navigateTo(context, const SuccessChangeRoomScreen());
                        },
                        text: 'تقديم الطلب',
                        width: double.infinity,
                        height: 47.0,
                        btnColor: mainColors,
                        marginSize: const EdgeInsets.symmetric(horizontal: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

class ChangeFloorModel {
  late String text;
  late int index;

  ChangeFloorModel({
    required this.text,
    required this.index,
  });
}

class ChangeRoomModel {
  late String text;
  late int index;

  ChangeRoomModel({
    required this.text,
    required this.index,
  });
}
