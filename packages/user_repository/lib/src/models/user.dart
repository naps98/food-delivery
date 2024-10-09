import '../entities/entities.dart';

class MyUser {
  String userId;
  String email;
  String name;
  String mobile;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.mobile,
    required this.hasActiveCart,
  });

  static final empty = MyUser(
		userId: '', 
		email: '', 
		name: '',
    mobile: '',
    hasActiveCart: false,
	);

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId, 
      email: email, 
      name: name,
      mobile: mobile,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId, 
      email: entity.email, 
      name: entity.name,
        mobile: entity.mobile,
      hasActiveCart: entity.hasActiveCart
    );
  }

  @override
  String toString() {
    return 'MyUser: $userId, $email, $name,$mobile, $hasActiveCart';
  }
}