

import 'package:Prismaa/models/mission_model.dart';
import 'package:Prismaa/models/taradod_list_model.dart';
import 'package:Prismaa/screens/home_page/widgets/DailyTask.dart';
import 'package:Prismaa/screens/home_page/widgets/Mission.dart';
import 'package:Prismaa/screens/home_page/widgets/Verification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget viewEmplyeeCardItems(  int index,List<TaradodListModel> taradodList) {

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState){
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black.withOpacity(0.05)),
                ),
                child: Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.sp),
                              topRight: Radius.circular(15.sp)
                          )
                      ),
                      child:

                      Row(
                          children: [
                          const SizedBox(width: 8),
                      taradodList[index].personel_pic != "" ?
                      CachedNetworkImage(
                        imageUrl: taradodList[index].personel_pic,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(taradodList[index].personel_pic),
                        ),
                         errorWidget: (context, url, error) => const Icon(Icons.error),
                      ):
                           const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/user_avatar.png"),
                      ),
                      const SizedBox(width: 8),

                            Text(taradodList[index].personel ,//+ missionsList[index].startTime,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                            ),

                            const Spacer(),
                             Text("نوع فعالیت",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                            ),
                          ])


                    ),

                    // محتوای درون کارد
                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        children: [

                          SizedBox(
                            height: 5.sp,
                          ),

                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 16.sp)),
                                  Image(
                                      height: 16.sp,
                                      image: const AssetImage('assets/images/clock.png')),
                                  SizedBox(width: 4.sp),
                                  Text('ساعت ورود :' ,//+ missionsList[index].startTime,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                                  ),
                                  SizedBox(
                                    width: 30.sp,
                                  ),
                                  Text('ساعت خروج :', //+ missionsList[index].endTime,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp)
                                  ),
                                  const Spacer(),
                                  Text(getStatus(taradodList[index].status),
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 12.sp,
                                        color: Colors.green
                                    ),
                                  ),
                                ],
                              ),
                          SizedBox(height: 24.sp),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                   // Navigator.pushReplacementNamed(context, "/verification");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  Verification(taradod: taradodList[index],)),
                                    );
                                },child:
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: Colors.black//.withOpacity(0.1)
                                ),
                                child:

                                Text('راستی آزمایی',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white
                                  ),
                                ),
                              )),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: () async {
                                  // Navigator.pushReplacementNamed(context, "/verification");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Mission(taradod: taradodList[index],)),
                                  );
                                },child:
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: Colors.black//.withOpacity(0.1)
                                ),
                                child: Text('ثبت ماموریت',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white
                                  ),
                                ),
                              )),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: () async {
                                  // Navigator.pushReplacementNamed(context, "/verification");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  DailyTask(taradod: taradodList[index],)),
                                  );
                                },child:
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: Colors.black//.withOpacity(0.1)
                                ),
                                child: Text('ثبت فعالیت روزانه',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white
                                  ),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 16.sp),


                        ],
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      );
    },
  );
}
String getStatus(int sta) {
  String result="";
 switch(sta){
   case 0:
     result= "غایب";
     break;
   case 1:
     result= "حاضر";
     break;
   case 2:
     result= "مرخصی";
     break;
   case 3:

     result= "ماموریت";
     break;

 }
  return result;
}
