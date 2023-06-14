

import 'dart:math';

class CompanyLeave{
  String id = "";
  String title = "";
  String name = "";
  int status = 0;
  String startDate = "";
  String endDate = "";
  String startTime = "";
  String endTime = "";
  String nationalCode = "";
  String explain = "";

  CompanyLeave.from(String ID,String code,String startdate,String enddate,String stime,String endtimee,String name1,String title1,String explain1){
    id =ID;
    nationalCode = code;
    startDate =startdate;
    endDate = enddate;
    startTime =stime;
    endTime =endtimee;
    name = name1;
    title = title1;
    explain =explain1;
  }
  CompanyLeave.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson["id"] ?? "";
    nationalCode = parsedJson["national_code"] ?? "";
    startDate = parsedJson["start_date"] ?? "";
    endDate = parsedJson["end_date"] ?? "";
    startTime = parsedJson["start_time"] ?? "";
    endTime = parsedJson["end_time"] ?? "";
    name = parsedJson["name"] ?? "";
    title = parsedJson["title"] ?? "";
    explain = parsedJson["explain"] ?? "";

  }
}