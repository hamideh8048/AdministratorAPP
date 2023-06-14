import 'package:Prismaa/components/constants.dart';
import 'package:Prismaa/components/failRequest_dialog.dart';
import 'package:Prismaa/components/qr_dialog.dart';
import 'package:Prismaa/models/companyLeave_model.dart';
import 'package:Prismaa/models/user_model.dart';
import 'package:Prismaa/services/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shamsi_date/shamsi_date.dart';

class Kartabl extends StatefulWidget {
  const Kartabl({Key? key}) : super(key: key);

  @override
  State<Kartabl> createState() => KartablState();
}

class KartablState extends State<Kartabl> {
  bool pageLoading = true;
  String companyName="";
  String companyLogo="";
  List<CompanyLeave> leaves = [];
  Jalali jNow = Jalali.now();
  String getToday(Date d) {
    final f = d.formatter;
    return '${f.d} ${f.mN} ${f.yyyy}';
  }
  getCompanyLeaveOffline()
  {
   leaves.clear();
    leaves.add(CompanyLeave.from("44","00123","1402/10/10","","16:20","17:40","مهدی ایزدی","درخواستص مرخصی روزانه","sth"));
    leaves.add(CompanyLeave.from("42","00123","1402/10/10","","16:25","17:40","رضا ایزدی","درخواست مرخصی ساعتی","sth"));
    pageLoading=false;
  }
  getCompanyLeave() async {
    setState(() => pageLoading = true);
    var response = await (Services()).getCompanyLeave(UserModel.comapnyId,"50","1");
    if(response[0]["res"] == 1){
//   setState(() {
     pageLoading=false;
        response[0]['leaves'].forEach((element){
          leaves.add(CompanyLeave.fromJson(element));
          //UserModel.leaves.add(CompanyLeave.fromJson(element));
       });
     // });
        setState(() {});
      String h="";
    } else if(response[0]["res"] == -1){

     // Navigator.pushReplacementNamed(context, "/login");
    } else {
      // String result = response[0]['msg'];
      // showSimpleNotification(
      //   Text(result,
      //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
      //           color: Colors.white
      //       )),
      //   background: Colors.red,
      // );
      setState(() => pageLoading = false);
    }
  }
  @override
  void initState() {
    companyName=UserModel.comapnyName;
    companyLogo=UserModel.comapnyLogo;
    super.initState();
    if(mounted){
     getCompanyLeave();
     // getCompanyLeaveOffline();
    }

  //  getCompanyLeaveOffline();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,//backgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [

                      UserModel.comapnyLogo != ""
                          ?
                      CachedNetworkImage(
                        imageUrl: UserModel.comapnyLogo,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(UserModel.comapnyLogo),
                        ),
                        placeholder: (context, url) => const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0)),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      )
                          :
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/user_avatar.png"),
                      ),
                      SizedBox(width: 10.sp,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text("نماینده شرکت $companyName خوش امدی ",

                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color:backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(getToday(jNow),//"مصطفی خوش آمدید",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color:greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),

                      const SizedBox(width: 16),
                      GestureDetector(
                          onTap: (){
                            // setState(() {
                            openQRDialog(context,UserModel.companyQR);
                            //   });
                          },
                          child:
                          Image.asset("assets/images/qr.png", fit: BoxFit.fitWidth,width: 45,))

                    ],
                  ),
                ],
              ),
            ),
          )
      ),

      body:
      pageLoading==true?
      Center(child:
      CircularProgressIndicator(
        backgroundColor: Colors.deepPurple,
        strokeWidth: 8,
      )):
      Container(
        // padding: EdgeInsets.only(top: 40.sp, right: 30, left: 20),
          margin:  EdgeInsets.only(right: 10, left: 10),
          // color: backgroundColor,
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child:


          Column(

            children: [
              Container(
                margin: EdgeInsets.only(right: 30.sp),
                padding: EdgeInsets.symmetric(vertical: 10.sp),

                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.sp),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width*.65,
                            height: 50.sp,child:
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border:
                            const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 14.sp,
                                color: Colors.black26
                            ),
                            hintText: 'نام پرسنلی خود را جستجو کنید',
                          ),
                        )
                        ),
                        SizedBox(width: 20.sp,),
                        const Image(height: 50, image: AssetImage('assets/images/filter.png')),
                      ]),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:leaves.length,
                      itemBuilder: (context, index) {

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
                                      // کادر خاکستری بالای کارد
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
                                                // UserModel.picPath != "" ?
                                                // CachedNetworkImage(
                                                //   imageUrl: UserModel.picPath,
                                                //   imageBuilder: (context, imageProvider) => CircleAvatar(
                                                //     radius: 24,
                                                //     backgroundColor: Colors.transparent,
                                                //     backgroundImage: NetworkImage(UserModel.picPath),
                                                //   ),
                                                //   placeholder: (context, url) => const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0)),
                                                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                                                // ):
                                                const CircleAvatar(
                                                  radius: 24,
                                                  backgroundColor: Colors.transparent,
                                                  backgroundImage: AssetImage("assets/images/user_avatar.png"),
                                                ),
                                                const SizedBox(width: 8),

                                                Text( leaves[index].name,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                                                ),

                                                const Spacer(),
                                                SizedBox(height: 20,width: 120,child:

                                                Text( leaves[index].title,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                                                )),
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
                                             //   Text('از ساعت: ' +leaves[index].startTime,
                                                Text( leaves[index].title.contains('ساعت')?'از ساعت: ' +leaves[index].startTime:'از تاریخ:'+leaves[index].startDate,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                                                ),
                                                SizedBox(
                                                  width: 30.sp,
                                                ),
                                                //Text('  تا ساعت:'+leaves[index].endTime,
                                                Text( leaves[index].title.contains('ساعت')?'تا ساعت: ' +leaves[index].endTime:'تا تاریخ:'+leaves[index].endDate,

                                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp)
                                                ),
                                                SizedBox(
                                                  width: 20.sp,
                                                ),
                                                // SizedBox(
                                                //   width: 20.sp,),
                                                //
                                                // Text('حاضر' , //+ missionsList[index].startTime,
                                                //   style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp,   color: buttonGreenColor,),
                                                //
                                                // ),
                                              ],
                                            ),
                                            SizedBox(height: 24.sp),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                         //       _controller.text.contains("قبول")? SizedBox(width: 1,):
                                                GestureDetector(
                                                    onTap: (){
                                                     // setState(() {
                                                        // showSimpleNotification(
                                                        //   Text("result",
                                                        //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        //           color: Colors.white
                                                        //       )),
                                                        //   background: Colors.green,
                                                        // );
                                                        openFailRequestDialog(setState,context, leaves[index].id,leaves,index);
                                                        //    leaveList.removeAt(index);
                                                      //});
                                                    },
                                                    child:
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                                      decoration: BoxDecoration(
                                                         // border:_controller.text.contains("رد")? Border.all(color: Colors.white): Border.all(color: Colors.black),
                                                          border:Border.all(color: Colors.black),
                                                          borderRadius: BorderRadius.circular(16.sp),
                                                          color: Colors.white//.withOpacity(0.1)
                                                      ),
                                                      child: Text('رد درخواست',
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            fontSize: 12.sp,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                    )),
                                                SizedBox(width: 10,),
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.black),
                                                      borderRadius: BorderRadius.circular(16.sp),
                                                      color: Colors.black//.withOpacity(0.1)
                                                  ),
                                                  child:
                                                  GestureDetector(
                                                    onTap: ()async{
                                                      var response = await (Services()).sendConfirmRejectLeave(leaves[index].id,"1","");

                                                              if(response[0]["res"] == 1) {
                                                                String result = response[0]['msg'];
                                                                showSimpleNotification(
                                                                  Text(result,
                                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                          color: Colors.white
                                                                      )),
                                                                  background: Colors.green,
                                                                );
                                                                setState(()
                                                                {
                                                                  if (index <leaves.length){
                                                                    leaves.removeAt(index);
                                                                    // Navigator.of(context).pop();
                                                                  }
                                                                });

                                                              } else if(response[0]["res"] == 0){
                                                                String result = response[0]['msg'];
                                                                showSimpleNotification(
                                                                  Text(result,
                                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                          color: Colors.white
                                                                      )),
                                                                  background: Colors.red,
                                                                );
                                                                // setState(() => buttonLoading = false);
                                                              }

                                                    },

                                                    child:
                                                    Text('قبول درخواست',

                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                          fontSize: 12.sp,
                                                        //  color:_controller.text.contains("قبول")?Colors.green: Colors.white
                                                          color: Colors.white
                                                      ),
                                                    ),

                                                  ),
                                                ),

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
                        ////////////////////////////////////////////////////////////////////////jj

                      }
                  )
              ),
            ],
          )

      ),
    );
  }

}
