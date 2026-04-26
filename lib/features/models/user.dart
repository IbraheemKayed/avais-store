class User {
  final int ID;
  final String user_pass;
  final String user_nicename;
  final String user_email;
  final String display_name;
  

  User({
    required this.ID,
    required this.display_name,
    required this.user_email,
    required this.user_nicename,
    required this.user_pass,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      ID: json['ID'] as int,
      display_name: json['display_name'] as String,
      user_email: json['user_email'] as String,
      user_nicename: json['user_nicename'] as String,
      user_pass: json['user_pass'] as String,
    );
  }
}
