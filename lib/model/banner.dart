class BannerModel {
  int code;
  BannerData data;

  BannerModel({this.code, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new BannerData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class BannerData {
  List<Slider> slider;
  List<RadioList> radioList;
  List<Null> songList;

  BannerData({this.slider, this.radioList, this.songList});

  BannerData.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = new List<Slider>();
      json['slider'].forEach((v) {
        slider.add(new Slider.fromJson(v));
      });
    }
    if (json['radioList'] != null) {
      radioList = new List<RadioList>();
      json['radioList'].forEach((v) {
        radioList.add(new RadioList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slider != null) {
      data['slider'] = this.slider.map((v) => v.toJson()).toList();
    }
    if (this.radioList != null) {
      data['radioList'] = this.radioList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  String linkUrl;
  String picUrl;
  int id;

  Slider({this.linkUrl, this.picUrl, this.id});

  Slider.fromJson(Map<String, dynamic> json) {
    linkUrl = json['linkUrl'];
    picUrl = json['picUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkUrl'] = this.linkUrl;
    data['picUrl'] = this.picUrl;
    data['id'] = this.id;
    return data;
  }
}

class RadioList {
  String picUrl;
  String ftitle;
  int radioid;

  RadioList({this.picUrl, this.ftitle, this.radioid});

  RadioList.fromJson(Map<String, dynamic> json) {
    picUrl = json['picUrl'];
    ftitle = json['Ftitle'];
    radioid = json['radioid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picUrl'] = this.picUrl;
    data['Ftitle'] = this.ftitle;
    data['radioid'] = this.radioid;
    return data;
  }
}