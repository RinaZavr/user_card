/// Модель данных о пользователе
class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.company,
    required this.city,
  });

  /// Конструктор для парсинга данных с API
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        company = json['company']['name'],
        city = json['address']['city'];

  final int id;
  final String name;
  final String email;
  final String phone;
  final String company;
  final String city;
}
