import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/moduls/profile/follow_requests/follow_requests_detailes_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class FollowRequestsScreen extends StatelessWidget {
  const FollowRequestsScreen({Key? key}) : super(key: key);

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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 12.0,
                title: Text(
                  'متابعه طلباتي',
                  style: Theme.of(context).textTheme.headline6,
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
                          color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
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
                    const SizedBox(height: 10.0,),
                    Text(
                      '* يجب مراعاه الارشادات التاليه',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.0,
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
                        const SizedBox(width: 5.0,),
                        Text(
                          'تمت الموافقه علي طلبكم',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 10.0,
                          ),
                        ),
                        const SizedBox(width: 14.0,),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(3.0),
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 5.0,),
                        Text(
                          'جاري الرد علي طلبكم',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 10.0,
                          ),
                        ),
                        const SizedBox(width: 14.0,),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(3.0),
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 5.0,),
                        Text(
                          'تم رفض طلبكم',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 10.0,
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
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height:15.0),
                    Expanded(
                      flex: 1,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder:(context,index)=>buildRequestItem(cubit,context),
                        separatorBuilder:(context,index)=>const SizedBox(height: 8.0,),
                        itemCount: 10 ,
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
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    'التاريخ : 2021-23-9',
                    style: Theme.of(context).textTheme.bodyText2,
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
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
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


