import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/comments_model.dart';
import 'package:university_housing/moduls/queries/queries_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/main/cubit.dart';
import 'package:university_housing/shard/cubit/main/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class QueriesScreen extends StatelessWidget {

  var queriesController = TextEditingController();

   QueriesScreen({Key? key}) : super(key: key);

   //part 4
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){
        if(state is PostQueriesSuccessStates){
          showToast(message: 'تم تقديم طلب الأستعلام بنجاح', state: ToastStates.SUCCESS);
          queriesController.text = '';
          AppCubit.get(context).getProfileData();
        }else if(state is PostQueriesErrorStates){
          showToast(message: 'لم يتم تقديم الطلب, الرجاء المحاولة في وقت لاحق', state: ToastStates.ERROR);
          AppCubit.get(context).getProfileData();
        }

        if(state is PostQueriesLoadingStates){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }else if(state is PostQueriesSuccessStates){
          Navigator.pop(context);
        }
      },
      builder:  (context,state){
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: defaultAppBar(context: context, state: state),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    defaultTitleBox(
                      img: 'assets/images/research.svg',
                      title: 'الاستعلامات',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'اكتب طلب الاستعلام',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      height: 140.0,
                      child: whiteBoard(context, controller: queriesController),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: defaultButton(
                          function: (){
                            AppCubit.get(context).postQueries(
                                queries: queriesController.text
                            );
                          },
                          text: 'تقديم الطلب',
                          radius: 8.0,
                          height: 47,
                          btnColor: mainColors,
                          width: double.infinity
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'الاستعلامات السابقة',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),

                    const SizedBox(
                      height: 8.0,
                    ),

                    if(state is GetQueriesLoadingStates)
                      const Center(child: CircularProgressIndicator(),),
                    if(cubit.commentModel!.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildComment(context, AppCubit.get(context).commentModel![index]),
                      separatorBuilder: (context, index) => const SizedBox(height: 0,),
                      itemCount: AppCubit.get(context).commentModel!.length,
                    ),
                    // if(cubit.commentModel!.isEmpty)
                    //   Text(
                    //     ' لا يوجد استعلامات سابقه حاليا !!',
                    //     style: Theme.of(context).textTheme.bodyText1,
                    //   ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget buildComment(context, CommentsModel model) {
    if(model.user != null){
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            margin: const EdgeInsets.symmetric(vertical:5.0),
            decoration: BoxDecoration(
                color: ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color:ThemeCubit.get(context).darkTheme? Colors.indigo.withOpacity(0.2) : Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(3,3), // changes position of shadow
                  ),
                ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Builder(builder:(context){
                      if(model.user == null){
                        return CircleAvatar(
                          radius: 25.0,
                          backgroundColor: ThemeCubit.get(context).darkTheme
                              ? mainTextColor
                              : mainColors,
                          child: Container(
                            alignment: Alignment.center,
                            height: 80.0,
                            child: Icon(Icons.error,
                              color: ThemeCubit.get(context).darkTheme
                                  ? mainColors
                                  : mainTextColor,
                            ),
                          ),
                        );
                      }else{
                        if(model.user!.image != null){
                          return CircleAvatar(
                            radius: 25.0,
                            backgroundColor: ThemeCubit.get(context).darkTheme
                                ? mainTextColor
                                : mainColors,
                            backgroundImage: NetworkImage(
                              model.user!.image!,
                            ),
                          );
                        }else{
                          return CircleAvatar(
                            radius: 25.0,
                            backgroundColor: ThemeCubit.get(context).darkTheme
                                ? mainTextColor
                                : mainColors,
                            child: Container(
                              alignment: Alignment.center,
                              height: 80.0,
                              child: Icon(Icons.error,
                                color: ThemeCubit.get(context).darkTheme
                                    ? mainColors
                                    : mainTextColor,
                              ),
                            ),
                          );
                        }
                      }
                    }),

                    const SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.user == null ? 'فارغ' : model.user!.username!,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          model.user == null ? 'فارغ' :'${model.user!.id!}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    const Spacer(),
                    if(model.isReplied!)
                      Container(
                        padding: const EdgeInsetsDirectional.all(8.0),
                        child: Icon(
                          Icons.check_circle,
                          color: ThemeCubit.get(context).darkTheme? mainTextColor : mainColors,
                          size: 16.0,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 5.0,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0),
                  child: Text(
                    model.enquiry!,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    navigateTo(context,  QueriesDetailsScreen(commentsModel: model));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.only(end: 5.0),
                    child: Text(
                      'المزيد',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.0,
                        decoration:TextDecoration.underline,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }else{
      return Container(
        width: 0,
      );
    }
  }
}
