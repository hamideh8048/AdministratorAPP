
class CompanyModel{
  String id = "";
  String title = "";
  String user_id = "";
  String user_role_id = "";
  String company_id = "";
  String current_date = "";
  String current_time = "";
  String agent_name = "";
  String company_name = "";
  String company_logo = "";
  String company_code = "";
  String company_qrcode = "";
  String plan_name = "";
  String number_personel = "";
  String support = "";
  String attendance = "";
  String plan_facilities = "";
  String diffInDays = "";
  String plan_date = "";
  String msg = "";



  CompanyModel.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson["id"] ?? "";
    title = parsedJson["title"] ?? "";
    user_id = parsedJson["user_id"] ?? "";
    user_role_id = parsedJson["user_role_id"] ?? "";
    company_id = parsedJson["company_id"] ?? "";
    current_date = parsedJson["current_date"] ?? "";
    current_time = parsedJson["current_time"] ?? "";
    agent_name = parsedJson["agent_name"] ?? "";
    company_name = parsedJson["company_name"] ?? "";
    company_logo = parsedJson["company_logo"] ?? "";
    company_code = parsedJson["company_code"] ?? "";
    plan_name = parsedJson["plan_name"] ?? "";
    plan_date = parsedJson["plan_date "] ?? "";
    number_personel = parsedJson["number_personel"] ?? "";
    company_qrcode = parsedJson["company_qrcode"] ?? "";
    support = parsedJson["support"] ?? "";
    attendance = parsedJson["attendance"] ?? "";

  }
}