class User {

  String user = '';
  String password = '';

  User();

  User.fromtest(){//Constructor con nombre de prueba
    user = 'Fernando';
    password = '121212';
  }

  Map<String, dynamic> toMap(){
    return {
      'user':user,
      'password':password
    };
  }

}