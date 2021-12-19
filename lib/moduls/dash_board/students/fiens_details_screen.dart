import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/get_all_users_model.dart';
import 'package:university_housing/model/get_dash_security_model.dart';
import 'package:university_housing/model/security_model.dart';
import 'package:university_housing/moduls/dash_board/rooms/available_now.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

import 'add_fines.dart';

class FinesDetailsScreen extends StatelessWidget {
  FinesDetailsScreen({Key? key, required this.item}) : super(key: key);

  Users item;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is PutFinesLoadingStates ){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is GetAllUsersSuccessStates ){
          Navigator.pop(context);
          showToast(message: 'تم التعديل بنجاح', state: ToastStates.SUCCESS);
        }

      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الساكنين',
              context: context,
              action: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: 30.0,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ThemeCubit.get(context).darkTheme
                        ? mainTextColor
                        : mainColors,
                  ),
                  onPressed: () {
                    ThemeCubit.get(context).changeTheme();
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultDashBoardTitleBox(
                        svgImage: 'assets/images/wallet.svg',
                        svg: true,
                        title: 'الغرامات'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.username,
                            style: Theme.of(context).textTheme.bodyText1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.id.toString(),
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if(item.fines.length!=0)
                      Row(
                      children: [
                        Expanded(
                          child: Text(
                            'سبب الغرامة',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'المبلغ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if(item.fines.length==0)
                      Text('لا يوجد غرامات حاليا',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20.0),
                      ),

                    Container(
                      decoration: item.fines.length!= 0 ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0,),
                        border: Border.all(color: Colors.grey, width: 1),
                      ) : BoxDecoration(),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10.0),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => finesItem(
                          user: item,
                          item: item.fines[index],
                          cubit: cubit,
                          context: context,
                          index: index
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: item.fines.length,
                      ),
                    ),

                    // fines button
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        function: (){
                          navigateTo(context,AddFinesScreen(item: item,));
                        },
                        text: 'إضافة غرامة',
                        btnColor: mainColors,
                      width: double.infinity
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget finesItem({
  required context,
  required DashBoardCubit cubit,
  required Fines item,
  required Users user,
  required int index,
}) {
  var reasonController = TextEditingController();
  var costController = TextEditingController();

  reasonController.text = item.fineReason;
  costController.text = item.fineValue.toString();
  return Container(
    color: cubit.showFinesEdit == false && cubit.fineIndex == index ? ThemeCubit.get(context).darkTheme
        ? finesColorDark
        : Colors.white : ThemeCubit.get(context).darkTheme ?backGroundDark :backGround,
    child: Row(
      children: [
        switchedTextFormField(
            context: context,
            cubit: cubit,
            controller: reasonController,
            center: false,
            flex: 4
        ),
        switchedTextFormField(
          context: context,
          cubit: cubit,
          controller: costController,
          type: TextInputType.number,
          center: false,

        ),
        Container(
          width: 50.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              if (cubit.showFinesEdit == false) {
                  cubit.putFines(
                    studentIdDB: user.idDB,
                      idDB: item.idDB,
                      fineReason: reasonController.text,
                      fineValue: num.parse(costController.text),
                      isFine: true
                  );
              }else{
                cubit.changeFineIndex(index);
              }
              cubit.changeFinesEditIcon(!cubit.showFinesEdit);
            },
            icon: Icon(
              cubit.showFinesEdit == false && cubit.fineIndex == index ?  Icons.done : Icons.edit,
              size: 20.0,
              color: ThemeCubit.get(context).darkTheme
                  ? mainTextColor
                  : mainColors,
            ),
            alignment: AlignmentDirectional.center,
          ),
        ),
      ],
    ),
  );
}
