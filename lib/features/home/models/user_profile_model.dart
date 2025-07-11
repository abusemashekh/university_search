class UserProfileModel {
  final String name;
  final String avatar;
  final String email;

  const UserProfileModel({required this.name, required this.avatar, required this.email});

  static const UserProfileModel mockUser = UserProfileModel(name: 'John Doe', avatar: '👨‍🎓', email: 'john.doe@example.com');
}
