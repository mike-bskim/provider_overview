class Babies {
  final int age;

  Babies({
    required this.age,
  });

  Future<int> getBabies() async {
    await Future.delayed(const Duration(seconds: 2));
    if (age > 1 && age < 5) {
      return 4;
    } else if (age <= 1) {
      return 0;
    } else {
      return 2;
    }
  }

  Future<double> getBabies2() async {
    await Future.delayed(const Duration(seconds: 5));
    if (age > 1 && age < 5) {
      return 14;
    } else if (age <= 1) {
      return 10;
    } else {
      return 12;
    }
  }
}
