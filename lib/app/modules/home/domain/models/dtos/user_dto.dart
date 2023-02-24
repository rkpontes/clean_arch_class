class UserDto {
  UserDto({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.createdAt,
  });

  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? createdAt;

  factory UserDto.fromMap(Map<String, dynamic> map) => UserDto(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      createdAt: map['createdAt']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "createdAt": createdAt,
      };
}
