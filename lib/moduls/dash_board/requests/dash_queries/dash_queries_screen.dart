import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_housing/model/get_all_orders_model.dart';
import 'package:university_housing/moduls/dash_board/requests/dash_queries/dash_queries_details_screen.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/cubit/dashBoard/cubit.dart';
import 'package:university_housing/shard/cubit/dashBoard/states.dart';
import 'package:university_housing/shard/style/color.dart';
import 'package:university_housing/shard/style/theme/cubit/cubit.dart';

class DashQueriesScreen extends StatelessWidget {
  const DashQueriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: dashAppBar(
              title: 'الأستعلامات',
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    smallDashBoardTitleBox(
                        svgImage:'assets/images/research.svg',
                        svg: true,
                        title: 'الاستعلامات'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 500.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsetsDirectional.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ComplaintsItem(
                            item: cubit.allOrders!.enquiry[index],
                            cubit: cubit,
                            context: context,
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          height: 1.0,
                          color: separator,
                        ),
                        itemCount: cubit.allOrders!.enquiry.length,
                      ),
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


Widget ComplaintsItem({
  required BuildContext context,
  required DashBoardCubit cubit,
  required Enquiry item,
}) {
  return InkWell(
    onTap: (){
      if(item.user != null){
        navigateTo(context, DashQueriesDetailsScreen(
          enquiryItem: item,
        ));
      }else{
        showToast(message: 'لا يوجد تفاصيل حاليا!!', state: ToastStates.WARNING);
      }
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            item.user == null ? 'فارغ' :item.user!.username,
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            item.user == null ? 'فارغ' :item.user!.id.toString(),
            style: item.isReplied ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green) : Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 30.0,
          height: 30.0,
          child: IconButton(
            onPressed: () {
              navigateTo(context, DashQueriesDetailsScreen(
                enquiryItem: item,
              ));
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: ThemeCubit
                  .get(context)
                  .darkTheme
                  ? mainTextColor
                  : mainColors,
            ),
          ),
        ),
      ],
    ),
  );
}


