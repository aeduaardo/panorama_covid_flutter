class DataModel {
  int cases;
  int deaths;
  int recovered;
  String date;
  double percentageInfected;
  List<States> arrayData;

  DataModel(
      {this.cases,
      this.date,
      this.deaths,
      this.recovered,
      this.percentageInfected,
      this.arrayData});

  DataModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    if (json['date'] == null) {
      date = '';
    } else {
      date = json['date'];
    }
    deaths = json['deaths'];
    recovered = json['recovered'];
    percentageInfected = json['percentageInfected'];
    if (json['states'] != null) {
      arrayData = new List<States>();
      json['states'].forEach((v) {
        arrayData.add(new States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['date'] = this.date;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['percentageInfected'] = this.percentageInfected;
    if (this.arrayData != null) {
      data['states'] = this.arrayData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  // * This class will be used to obtain state or countries data.
  String name;
  String flag;
  int cases;
  int deaths;
  double percentageInfected;

  States(
      {this.name, this.flag, this.cases, this.deaths, this.percentageInfected});

  States.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
    cases = json['cases'];
    deaths = json['deaths'];
    percentageInfected = json['percentageInfected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['flag'] = this.flag;
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['percentageInfected'] = this.percentageInfected;
    return data;
  }
}
