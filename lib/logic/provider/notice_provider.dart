import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../modules/notice_model.dart';
import '../service/fireStoreServices/notice_firestore_service.dart';

class NoticeProvider with ChangeNotifier {
   final service = NoticeFirestoreService();
  late String _notice;
  late DateTime _time;
  late String _url;
  var uuid = Uuid();

  // getter
  String get getNotice => _notice;
  DateTime get getTime => _time;
  String get getUrl => _url;


  //Setters:
  void changeNotice(String value) {
    _notice = value;
    notifyListeners();
  }

  void changetime(DateTime time) {
    _time = time;
    notifyListeners();
  }

  void changeUrl(String url) {
    _url = url;
    notifyListeners();
  }

  void saveNotice() {
    var newNotice = Notice(id: uuid.v4(), notice: getNotice, time: getTime,getUrl);
    service.saveNotice(newNotice);
  }

  void deleteNotice(noticeId) {
    service.removeNotice(noticeId);
  }


} 