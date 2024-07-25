class WunderkindCustomer {
  final String email;
  final String phone;

  const WunderkindCustomer({
    required this.email,
    required this.phone,
  });

  factory WunderkindCustomer.fromJson(Map<String, dynamic> map) {
    return WunderkindCustomer(
      email: map['email'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
    };
  }
}
