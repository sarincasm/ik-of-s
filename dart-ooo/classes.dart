void main() {
  callMeMaybe({
    required String phone,
    required String areaCode,
    required String internationalCode,
  }) {
    print(phone);
    print(areaCode);
    print(internationalCode);
  }

  callMeMaybe(
    phone: '123',
    areaCode: '12',
    internationalCode: '11',
  );
}
