import 'package:Prismaa/components/constants.dart';
import 'package:Prismaa/components/qr_dialog.dart';
import 'package:Prismaa/models/taradod_list_model.dart';
import 'package:Prismaa/models/user_model.dart';
import 'package:Prismaa/screens/admin/widgets/view_employee_card_item.dart';
import 'package:Prismaa/services/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shamsi_date/shamsi_date.dart';


class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => Home2State();
}

class Home2State extends State<Home2> {
  Jalali jNow = Jalali.now();
  ScrollController? scrollController;
  List<TaradodListModel> taradods = [];
  bool pageLoading = true;
  String companyName="";
  String companyLogo="";

  @override
  void initState() {
    companyName=UserModel.comapnyName;
    companyLogo=UserModel.comapnyLogo;

    super.initState();
    if(mounted){
      getPersonelTraffic();
    //  getPersonelTrafficOffline();
    }
  }

  String getToday(Date d) {
    final f = d.formatter;
    return '${f.d} ${f.mN} ${f.yyyy}';
  }
  getPersonelTrafficOffline()
  {UserModel.comapnyId="34";
  UserModel.userId="49";

    taradods.add(TaradodListModel.from("","","https://back.prismaa.ir/upload/user_2/1684931504515.jpg",0,"مهدی امیری",0));
    taradods.add(TaradodListModel.from("","","https://back.prismaa.ir/upload/user_2/1684931504515.jpg",0,"مهدی امیری",0));
    taradods.add(TaradodListModel.from("","","https://back.prismaa.ir/upload/user_2/1684931504515.jpg",0,"مهدی امیری",0));
  }
  getPersonelTraffic() async {
    setState(() => pageLoading = true);
    var response = await (Services()).getPersonelTrafficToServer(UserModel.comapnyId,"","50","1");
    if(response[0]["res"] == 1){
      pageLoading=false;
      response[0]['data'].forEach((element){
        taradods.add(TaradodListModel.fromJson(element));
      });
      setState(() {
        pageLoading = false;
      });

    } else if(response[0]["res"] == -1){

      Navigator.pushReplacementNamed(context, "/login");
    } else {

      setState(() => pageLoading = false);
    }
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
                          Text("نماینده شرکت $companyName خوش آمدید ",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color:backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(getToday(jNow),
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
)
):
      Container(

       margin:  EdgeInsets.only(right: 10, left: 10),

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
                        itemCount:taradods.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: (){
                               },
                               child:
                              viewEmplyeeCardItems(index,taradods)
                          );
                        }
                    )
                ),
              ],
            )

      ),
    );
  }

}
