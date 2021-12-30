import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:university_housing/model/get_all_users_model.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class VoucherDetailsScreen extends StatelessWidget {
  VoucherDetailsScreen({Key? key, required this.userItem}) : super(key: key);

  Users userItem;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        // if(state is PutVoucherLoadingStates ){
        //   showDialog<void>(
        //       context: context,
        //       builder: (context)=> waitingDialog(context: context)
        //   );
        // }else if(state is GetAllUsersSuccessStates ){
        //   Navigator.pop(context);
        //   showToast(message: 'تم التعديل بنجاح', state: ToastStates.SUCCESS);
        // }
      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);

        DateTime tempDate = DateFormat("yyyy-MM-dd").parse(userItem.paidAt);
        String date = tempDate.toString().substring(0, 10);


        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الساكنين',
              context: context,
              action: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
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
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultDashBoardTitleBox(
                        svgImage: 'assets/images/ticket.svg',
                        svg: true,
                        title: 'المصاريف الدراسية'),

                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: separator,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    if(cubit.allVouchers.isNotEmpty)
                      Column(
                        children: [
                          //name
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- اسم الطالب :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  userItem.username,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          //id
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- رقم الطالب :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  userItem.id.toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          //payment date
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- تاريخ الدفع :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  date,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          //upload date
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '- تاريخ رفع الإيصال :',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              const SizedBox(width: 20.0,),
                              Expanded(
                                child: Text(
                                  '${DateFormat("yyyy-MM-dd").parse(cubit.allVouchers[0].createdAt)}'.substring(0, 10),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),

                          //nationalPhoto
                          Text(
                            'صورة الإصال',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0,),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: cubit.allVouchers[0].voucherImage,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>  Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: Icon(Icons.error,
                                      color: ThemeCubit.get(context).darkTheme
                                          ? mainTextColor
                                          : mainColors,),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 188.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey, width: 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    if(cubit.allVouchers.isEmpty)
                      const Center(child: CircularProgressIndicator(),),

                    // fines button
                    const SizedBox(
                      height: 20.0,
                    ),
                    if(userItem.isPaid==false)
                    defaultButton(
                        function: (){
                          // navigateTo(context,AddVoucherScreen(item: item,));
                        },
                        text: 'إضافة الوصل',
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
