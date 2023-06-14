import 'package:Prismaa/components/constants.dart';
import 'package:Prismaa/components/user_controller.dart';
import 'package:Prismaa/models/taradod_list_model.dart';
import 'package:Prismaa/models/user_model.dart';
import 'package:Prismaa/screens/admin/widgets/view_kartabl_card_item.dart';
import 'package:Prismaa/screens/admin/widgets/view_verification_card_item.dart';
import 'package:Prismaa/services/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shamsi_date/shamsi_date.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key,required this.taradod}) : super(key: key);
  final TaradodListModel taradod;
  @override
  State<Verification> createState() => VerificationState();
}

class VerificationState extends State<Verification> {
  bool pageLoading = false;


  @override
  void initState() {
    super.initState();

  }

  Jalali jNow = Jalali.now();
  refresh() {
    setState(() {
      if(mounted){
        UserModel.name;
        UserModel.family;
        getProfilePic();
      }
    });
  }
  String getToday(Date d) {
    final f = d.formatter;
    return '${f.d} ${f.mN} ${f.yyyy}';
  }
  getProfilePic() async {
    setState(() => pageLoading = true);
    var response = await (Services()).getOtherPersonelItems(UserModel.mainToken);
    if(response[0]["res"] == 1){
      setState(() {
        UserModel.picPath = response[0]["pic_path"];
        pageLoading = false;
      });
    } else if(response[0]["res"] == -1){
      logOut();
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      String result = response[0]['msg'];
      showSimpleNotification(
        Text(result,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white
            )),
        background: Colors.red,
      );
      setState(() => pageLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: backgroundColor,
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
                      SizedBox(height: 50,),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                            height: 45.sp,
                            width: 45.sp,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset("assets/images/arrow_back.png")
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text("راستی آزمایی",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(getToday(jNow),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              // fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.black38
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30.sp,
                        width: 28.sp,
                        child: Image.asset("assets/images/notification_kartabl.png", fit: BoxFit.fill),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
      ),

      body: pageLoading
      ? const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0))
      :
      NestedScrollView(
        headerSliverBuilder: (context, value){
          return [
            SliverAppBar(
              floating: false,
              pinned: false,
              expandedHeight: MediaQuery.of(context).size.height.sp * 0.3,
              backgroundColor: Colors.white,
              centerTitle: false,
              stretch: true,
              leading: const SizedBox(),
              leadingWidth: 0,

              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left:16.0.sp,right:16.0.sp,top:0.0.sp),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // عکس پروفایل
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // حاشیه سفید عکس پروفایل
                                Container(
                                  height: 150.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),

                                widget.taradod.personel_pic != ""
                                ?
                                CachedNetworkImage(
                                  imageUrl: widget.taradod.personel_pic,
                                  imageBuilder: (context, imageProvider) => Container(
                                    height: 135.sp,
                                    width: 135.sp,
                                    // padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.taradod.personel_pic),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0)),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                )
                                :
                                // تصویر پروفایل
                                Container(
                                  height: 135.sp,
                                  width: 135.sp,
                                  // padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/images/user_avatar.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           SizedBox(height: 16.sp),
                            Text(widget.taradod.personel,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Text("کد پرسنلی : " + widget.taradod.personel_code,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),


            ),
          ];
        },

        body: SingleChildScrollView(
          child: Column(
            children: [
             // SizedBox(height: 16.sp),
              Container(
                margin: EdgeInsets.only(right: 0.sp),
                padding: EdgeInsets.symmetric(vertical: 0.sp),

                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2.sp),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width*.7,
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

                        const Image(height: 50, image: AssetImage('assets/images/filter2.png')),


                      ]),
                ),
              ),
SizedBox(height: 400,child:
                   ListView.builder(
                      itemCount:1,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: (){
                              // showDialogInMission(context, requestsList[index]);
                            },
                            // child: requestsListCardItems(context, requestsList, index, date)
                            child:
                            ViewVerificationCardItems()
                          //viewEmplyeeCardItems()
                        );
                      }
                  ))
            ],
          ),
        ),
      )


    );
  }



  Widget itemsWidget(String imageIcon, String text, bool textColor, bool notify){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const SizedBox(width: 10),
          SizedBox(
            width: 24.sp,
            height: 24.sp,
            child: Image.asset(imageIcon,
              fit: BoxFit.fill,
              color: textColor ? Colors.red : Colors.black
            ),
          ),
          const SizedBox(width: 20),
          Text(text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: textColor ? Colors.red : Colors.black
            ),
          ),
          const Spacer(),
          notify
              ? Container(
            width: 35.sp,
            height: 18.sp,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF4BB40),
            ),
            child: Center(
              child: Text("۲", style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp
              )
              ),
            ),
          )
              : const SizedBox(),
          SizedBox(
            width: 25.sp,
            height: 25.sp,
            child: Image.asset("assets/images/arrow-left.png", fit: BoxFit.fill, color: Colors.black),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
