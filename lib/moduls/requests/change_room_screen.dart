import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_housing/shard/components/components.dart';
import 'package:university_housing/shard/style/color.dart';

class ChangeRoomScreen extends StatelessWidget {
  const ChangeRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                    color: mainColors,
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0
                  ),
                ),
                const SizedBox(height: 24.0,),
                Container(
                  width: double.infinity,
                  height:45.0,
                  margin: const EdgeInsets.symmetric(horizontal: 14.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: TextFormField(
                    // enabled: false,
                    readOnly: true,
                    onTap: (){

                    },
                    decoration:  const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black38,
                      ),
                      hintText: 'اختر رقم الدور',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                      contentPadding:EdgeInsetsDirectional.only(start: 8.0, top: 4.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0,),
                Container(
                  width: double.infinity,
                  height:45.0,
                  margin: const EdgeInsets.symmetric(horizontal: 14.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: TextFormField(
                    // enabled: false,
                    readOnly: true,
                    onTap: (){

                    },
                    decoration:  const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black38,
                      ),
                      hintText: 'اختر رقم الغرفة',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                      contentPadding:EdgeInsetsDirectional.only(start: 8.0, top: 4.0),
                    ),
                  ),
                ),
                const SizedBox(height: 160.0,),
                defaultButton(
                  function: (){},
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
  }
}
