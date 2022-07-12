class UserModel {
  late int id;
  late String email;
  late String password;

  UserModel.new(this.email,this.password){
    id=0;
  }

  UserModel.fromDB(Map<String, dynamic> input)
      : id = input['id'],
        email = input['email'],
        password = input['password'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{ 'email': email, 'password': password};
  }
}
