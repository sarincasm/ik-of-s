class Phone {
  final String phone;
  final String areaCode;
  final String internationalCode;

  const Phone({
    required this.phone,
    required this.areaCode,
    required this.internationalCode,
  });

  printAll() {
    print(phone);
    print(areaCode);
    print(internationalCode);
  }
}

void main() {
  var phoneObject = Phone(
    phone: '1234',
    areaCode: '123',
    internationalCode: '123',
  );
  phoneObject.printAll();
}
