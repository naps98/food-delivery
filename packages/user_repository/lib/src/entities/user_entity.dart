class MyUserEntity {
  String userId;
  String email;
  String name;
  String mobile;
  bool hasActiveCart;

  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.mobile,
    required this.hasActiveCart,
  });

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'mobile': mobile,
      'hasActiveCart': hasActiveCart,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'], 
      email: doc['email'], 
      name: doc['name'],
      mobile: doc['mobile'],
      hasActiveCart: doc['hasActiveCart'],
    );
  }
}