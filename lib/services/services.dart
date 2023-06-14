import 'dart:convert';
import 'dart:io';
import 'package:Prismaa/components/user_controller.dart';
import 'package:Prismaa/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';



class Services {
  String baseURL = "http://185.213.195.182:3025";



  // گرفتن اطلاعات پروفایل پرسنل
  Future getOtherPersonelItems(String token) async {
    final response = await http.get(Uri.parse(baseURL + '/personel_profile?token=$token'));
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  Future sendPostLoginDataFormToServer(String username, String password) async {
    var bodyParameter = {
      "username": username,
      "password": password
    };

    final response = await http.post(Uri.parse(baseURL + '/company_login'), body: bodyParameter);
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  Future sendLoginDataFormToServer(String username, String password) async {
    final response = await http.get(Uri.parse(baseURL + '/company_login?username=$username&password=$password'));
    var responseBody = json.decode(response.body);
    // return {"body": responseBody, "code": response.statusCode};
    if(responseBody[0]['res'] == 1) {
      return responseBody;
    } else if(responseBody[0]['res'] == 0){
      return responseBody;
    } else { // when it is -1
      logOut();
      return responseBody;
    }
  }

  // داشبورد
  Future getPersonelTrafficToServer(String company_id, String name,String count,String pagination) async {
    final response = await http.get(Uri.parse(baseURL + '/personel_traffic?company_id=$company_id&name=$name&count=$count&pagination=$pagination'));
    var responseBody = json.decode(response.body);
    // return {"body": responseBody, "code": response.statusCode};
    if(responseBody[0]['res'] == 1) {
      return responseBody;
    } else if(responseBody[0]['res'] == 0){
      return responseBody;
    } else { // when it is -1
      logOut();
      return responseBody;
    }
  }


  // مرخصی ها
  Future getCompanyLeave(String company_id, String count,String pagination) async {
    String token=UserModel.mainToken;
    final response = await http.get(Uri.parse(baseURL + '/company_leave_dashboard?token=$token&company_id=$company_id&count=$count&pagination=$pagination'));
    var responseBody = json.decode(response.body);
    // return {"body": responseBody, "code": response.statusCode};
    if(responseBody[0]['res'] == 1) {
      return responseBody;
    } else if(responseBody[0]['res'] == 0){
      return responseBody;
    } else { // when it is -1
      logOut();
      return responseBody;
    }
  }


  //ثبت فعالیت
  Future addPeronelActivity(String explain,String personelId,String companyId,String title,String time,String date) async {
    var bodyParameter = {
      "token": UserModel.mainToken,
      "title": title,
      "company_id": companyId,
      "company_personel_id": personelId,
      "time": time,
      "date": date,
      "explain":explain
    };

    final response = await http.post(Uri.parse(baseURL + '/add_company_personel_activity'), body: bodyParameter);
    var responseBody = json.decode(response.body);
    if(responseBody[0]['res'] == 1) {
      return responseBody;
    } else if(responseBody[0]['res'] == 0){
      return responseBody;
    } else { // when it is -1
      logOut();
      return responseBody;
    }
  }
  // تایید ا رد مرخصی
  Future sendConfirmRejectLeave(String id, String action, String rejection_reason) async {
    String token = UserModel.mainToken;
    final response = await http.patch(Uri.parse(baseURL + '/confirm_reject_leave?token=$token&id=$id&action=$action&reject_reason=$rejection_reason'));
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  //ثبت ماموریت
  Future addMission(String explain,String personelId,String companyId,String title,String startDate,String endDate,startTime,String endTime,String inSite,String address,String location_name,String lat,String long,String type) async {
    var bodyParameter = {
      "token": UserModel.mainToken,
      "title": title,
      "company_id": companyId,
      "company_personel_id": personelId,
      "start_date": startDate,
      "end_date": endDate,
      "start_time": startTime,
      "end_time": endTime,
      "is_in_place": inSite,
      "explain":explain,
      "title":title,
      "address":address,
      "lat":lat,
      "long":long,
      "location_name":location_name,"type":type
    };

    final response = await http.post(Uri.parse(baseURL + '/add_mission'), body: bodyParameter);
    var responseBody = json.decode(response.body);
    if(responseBody[0]['res'] == 1) {
      return responseBody;
    } else if(responseBody[0]['res'] == 0){
      return responseBody;
    } else { // when it is -1
      logOut();
      return responseBody;
    }
  }






}

