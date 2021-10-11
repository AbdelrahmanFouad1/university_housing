import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_housing/shard/cubit/cubit.dart';
import 'package:university_housing/shard/cubit/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class QueriesDetailsScreen extends StatelessWidget {
  const QueriesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 12.0,
                title: Text(
                  'المزيد',
                  style: Theme.of(context).textTheme.headline6,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(0.0),
                      width: 34.0,
                      child: IconButton(
                        padding: EdgeInsets.zero,
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
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color:ThemeCubit.get(context).darkTheme? Colors.indigo.withOpacity(0.2) : Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    const Offset(3, 3), // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (cubit.profileImage == null) {
                                          return const CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage: NetworkImage(
                                                'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                                          );
                                        } else {
                                          return CircleAvatar(
                                            radius: 30.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  150.0,
                                                ),
                                                image: DecorationImage(
                                                  image: FileImage(
                                                      cubit.profileImage!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'عبدالرحمن محمد فؤاد',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '42018122',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: double.infinity,
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Text(
                                      '«إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو  »',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0 ,right: 16.0),
                          child: CircleAvatar(
                            radius: 20.0,
                            child:
                            Image.asset('assets/images/logo.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 16.0,left: 16.0,bottom: 16.0,right: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:ThemeCubit.get(context).darkTheme? finesColorDark : Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color:ThemeCubit.get(context).darkTheme? Colors.indigo.withOpacity(0.2) : Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset:
                                      const Offset(3, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: SingleChildScrollView(
                                          physics: const BouncingScrollPhysics(),
                                          child: Text(
                                            '«إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو إن هذا الكتاب حسن الطوية فهو  »',
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
