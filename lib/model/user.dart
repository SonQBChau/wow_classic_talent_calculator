class User {
  final bool seenOnBoarding;
  User({this.seenOnBoarding});

  User.fromJson(Map<String, dynamic> json)
      : seenOnBoarding = json['seenOnBoarding'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seenOnBoarding'] = this.seenOnBoarding;
    return data;
  }
}

class UserService {
  String userName = "filledstacks";
}
