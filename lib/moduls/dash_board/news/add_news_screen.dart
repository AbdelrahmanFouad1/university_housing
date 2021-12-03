import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/moduls/dash_board/rooms/success_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class AddNewsScreen extends StatelessWidget {
  AddNewsScreen({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {
        if(state is PostNewsSuccessStates ){
          navigateTo(context, AddingSuccessScreen());
        }
        if(state is PostNewsLoadingStates ){
          showDialog<void>(
              context: context,
              builder: (context)=> waitingDialog(context: context)
          );
        }
        if (state is PostNewsErrorStates ){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'إضافة خبر جديد',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    dashTextFormField(
                      hint: 'عنوان الخبر',
                      controller: titleController,
                      context: context,
                      type: TextInputType.text,
                    ),
                    SizedBox(height: 12.0,),
                    whiteBoard(
                        context,
                        hint: 'الموضوع ...',
                        controller: bodyController,
                    ),
                    SizedBox(height: 12.0,),
                    Builder(
                        builder: (context) {
                          if(cubit.newsImage != null){
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 42.0),
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 280.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0,),
                                            image: DecorationImage(
                                              image:FileImage(cubit.newsImage!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 288.0,
                                        margin: const EdgeInsets.symmetric(horizontal: 14.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          border: Border.all(color: Colors.grey, width: 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 3.0),
                                    child: IconButton(
                                      onPressed: () {
                                        cubit.removeNewsImage();
                                      },
                                      icon: const CircleAvatar(
                                        radius: 20.0,
                                        child: Icon(
                                          Icons.close,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }else{
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 72.0),
                              child: Container(
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
                                  onTap: (){
                                    cubit.pikeNewsImage();
                                  },
                                  decoration:  InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        cubit.pikeNewsImage();
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/images/upload.svg',
                                        alignment: Alignment.center,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                    contentPadding: const EdgeInsetsDirectional.all(10.0),
                                    hintText: 'صورة الخبر',
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                    ),
                    defaultButton(
                      function: (){
                        validation(
                          context: context,
                          title: titleController.text,
                          body: bodyController.text,
                          cubit: cubit,
                        );
                      },
                      text: 'إضافة الخبر',
                      width: double.infinity,
                      height: 47.0,
                      btnColor: mainColors,
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

void validation({
  required context,
  required String title,
  required String body,
  required DashBoardCubit cubit,
}){
  if(title.isEmpty){
    showToast(message: 'أدخل عنوان الخبر', state: ToastStates.ERROR);
  }else if(body.isEmpty){
    showToast(message: 'أدخل الموضوع', state: ToastStates.ERROR);
  }else{
    cubit.postNews(
      title: title,
      text: body,
      image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BBC_News_%282008%29.svg/1200px-BBC_News_%282008%29.svg.png'
    );
  }
}