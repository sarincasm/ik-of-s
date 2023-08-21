class Phone {
  String phone = '';
  String areaCode = '';
  String internationalCode = '';

  Phone({
    required String phone,
    required String areaCode,
    required String internationalCode,
  }) {
    this.phone = phone;
    this.areaCode = areaCode;
    this.internationalCode = internationalCode;
  }

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
