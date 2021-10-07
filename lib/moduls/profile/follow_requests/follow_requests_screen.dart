import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_detailes_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/iconly_broken.dart';

class FollowRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(create: (context)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){},
        builder :(context,state){
          var cubit = AppCubit.get(context);
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
                  'متابعه طلباتي',
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
                        padding:EdgeInsets.zero,
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
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0,),
                    Text(
                      '* يجب مراعاه الارشادات التاليه',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: mainColors,
                      ),
                    ),
                    const SizedBox(height:10.0),
                    Row(
                      children: [
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadiusDirectional.circular(3.0),
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'تمت الموافقه علي طلبكم',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: mainColors,
                          ),
                        ),
                        SizedBox(width: 14.0,),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(3.0),
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'جاري الرد علي طلبكم',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: mainColors,
                          ),
                        ),
                        SizedBox(width: 14.0,),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(3.0),
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'تم رفض طلبكم',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: mainColors,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height:8.0),
                    Container(
                      width: double.infinity,
                      height:1.0,
                      color: separator,
                    ),
                    const SizedBox(height:15.0),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            child: defaultFormField(
                              controller: searchController,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'enter text to search';
                                }
                                return null;
                              },
                              onSubmit: (String text) {},
                              hint: 'بحث ...',
                              prefix: Icons.search,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height:15.0),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: backGround,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder:(context,index)=>buildRequestItem(cubit,context),
                          separatorBuilder:(context,index)=>SizedBox(height: 8.0,),
                          itemCount: 10 ,
                        ),
                      ),
                    ),
                    const SizedBox(height:10.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildRequestItem(AppCubit cubit ,context)=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  child:buildEnquiry(
      context,
      height: 100.0,
      state: StatusStates.ACCEPT,
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      'طلب الاستضافه',
                      style: TextStyle(
                          color: mainColors,
                          fontSize: 16.0
                      ),
                    ),
                  ),
                  Text(
                    'التاريخ : 2021-23-9',
                    style: TextStyle(
                        color: mainColors,
                        fontSize: 12.0
                    ),

                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                      context,
                      FollowRequestsDetailsScreen(),
                  );
                },
                child: Text(
                  'عرض التفاصيل',
                  style: TextStyle(
                    color: mainColors,
                    fontSize: 12.0,
                    decoration:TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
  ),
);


