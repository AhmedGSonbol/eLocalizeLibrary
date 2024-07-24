class UserModel
{
  final int? id;
  final String userName;
  final String userCode;

  UserModel({
    this.id,
    required this.userName,
    required this.userCode,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'],
      userCode: map['userCode'],
      id: map['id'],
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userCode': userCode,
    };
  }
}