class myData {
  bool? success;
  List<Request>? request;

  myData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Request'] != null) {
      request = <Request>[];
      json['Request'].forEach((v) {
        request!.add(new Request.fromJson(v));
      });
    }
  }
}

class Request {
  String? sId;
  String? user;
  String? time;
  String? date;
  String? wasteType;
  int? pincode;
  String? zone;
  int? amount;
  String? timestamp;
  int? iV;

  Request.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    time = json['time'];
    date = json['date'];
    wasteType = json['wasteType'];
    pincode = json['pincode'];
    zone = json['zone'];
    amount = json['amount'];
    timestamp = json['timestamp'];
    iV = json['__v'];
  }
}
