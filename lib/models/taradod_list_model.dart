
class TaradodListModel{
  String id = "";
  String companyName = "";
  String personel_pic = "";
  String date = "";
  String inTime = "";
  String personel = "";
  String outTime = "";
  String outDevice = "";
  int status=0 ;
  int type=0 ;
  String company_personel_id="";
  String personel_code="";

  TaradodListModel.fromJson(Map<String, dynamic> parsedJson){
    outTime = parsedJson["outTime"] ?? "";
    personel =parsedJson["personel"] ?? "بی نام";
    inTime = parsedJson["inTime"] ?? "";
    personel_pic = parsedJson["personel_pic"] ?? "";
    status = parsedJson["status"] ?? 0;
    inTime = parsedJson["inTime"] ?? "";
    type = parsedJson["type"] ?? 0;
    company_personel_id = parsedJson["company_personel_id"] ?? 0;
    personel_code = parsedJson["personel_code"] ?? 0;

  }
  TaradodListModel.from(String outtime,String intime,String pic,int status,String personel,int type){
    outTime = outtime;
    personel =personel;
    inTime = intime;
    personel_pic = pic;
    status = status;
    inTime = intime;
    type = type;

  }
}