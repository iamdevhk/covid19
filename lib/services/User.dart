class User {

  String state;
  String confirmed;

  User(String state, String confirmed) {

    this.state = state;
    this.confirmed = confirmed;
  }

  User.fromJson(Map json)
      :
        state = json['state'],
        confirmed = json['conformed'];

  Map toJson() {
    return {'state': state, 'confirmed': confirmed};
  }
}