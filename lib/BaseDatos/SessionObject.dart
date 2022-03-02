
final String tableSesion = 'Sesion';

class SessionObjectFields{
  static final List<String> values = [usuario,password];
  static final String usuario = '_usuario';
  static final String password = '_password';
}

class SessionObject{
  final String usuario;
  final String password;

  SessionObject(
      {
        required this.usuario,
        required this.password,
      });

  Map<String,Object?> toJson() => {
    SessionObjectFields.usuario: usuario,
    SessionObjectFields.password: password,
  };

  static SessionObject fromJson(Map<String,Object?> json) => SessionObject(
    usuario: json[SessionObjectFields.usuario] as String,
    password: json[SessionObjectFields.password] as String,
  );
  SessionObject copy({
    String? usuario,
    String? password
  })=>SessionObject(
    usuario: usuario ?? this.usuario,
    password:  password ?? this.password,
  );

}