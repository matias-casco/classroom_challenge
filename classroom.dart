import 'dart:math';

void main() {
  final randomUtilsImpl = RandomUtilsImpl(
    random: Random(),
  );

  final classroom = Classroom(
    randomUtils: randomUtilsImpl,
    usedHoursPerDay: 15,
    usedDaysPerWeek: 5,
    usedMonthsPerYear: 9,
  );

  final tubesCalculation = classroom.calculateTubes();

  final totalBrokenTubes = tubesCalculation[0];
  final totalCost = tubesCalculation[1];

  // print('Total hours used in 1 year: ${classroom.totalHoursPerYear()}');
  print('Total fluorescent tubes broken in 1 year: $totalBrokenTubes');
  print('Total cost for replacing fluorescent tubes: \$${totalCost}');
}

class Classroom {
  final int usedHoursPerDay;
  final int usedDaysPerWeek;
  final int usedMonthsPerYear;
  final int tubeCost;
  final RandomUtils _randomUtils;
  final int unitsPerClassroom;
  final int tubesPerUnit;

  const Classroom({
    required this.usedHoursPerDay,
    required this.usedDaysPerWeek,
    required this.usedMonthsPerYear,
    required RandomUtils randomUtils,
    this.tubeCost = 7,
    this.unitsPerClassroom = 4,
    this.tubesPerUnit = 4,
  }) : _randomUtils = randomUtils;

  int totalHoursPerYear() {
    int daysPerYear = 365;
    double weeksPerYear = daysPerYear / 7;
    double averageWeeksPerMonth = weeksPerYear / 12;

    int totalHours = usedHoursPerDay *
        usedDaysPerWeek *
        averageWeeksPerMonth.round() *
        usedMonthsPerYear;

    return totalHours;
  }

  List<int> calculateTubes() {
    int brokenTubes = 0;
    int replacedTubes = 0;

    for (int unit = 1; unit <= unitsPerClassroom; unit++) {
      // print('----TUBE UNIT: $unit');
      int brokenInUnitBatch = 0;
      List<int> expirationHours = _generateTubesExpirationHours();
      for (int hoursElapsed = 1;
          hoursElapsed <= totalHoursPerYear();
          hoursElapsed++) {
        for (int tubeIndex = 0; tubeIndex < tubesPerUnit; tubeIndex++) {
          for (int expirationHourIndex = 0;
              expirationHourIndex < expirationHours.length;
              expirationHourIndex++) {
            if (expirationHours[expirationHourIndex] <= hoursElapsed &&
                expirationHours[expirationHourIndex] != 0 &&
                brokenInUnitBatch < 2) {
              brokenTubes++;
              // final cleanExpirationHours =
              //     expirationHours.where((element) => element != 0).toList();
              // print('Expiration Hours: $cleanExpirationHours');
              brokenInUnitBatch++;
              expirationHours[expirationHourIndex] = 0;
              // print(
              //     'At hour number $hoursElapsed we already have $brokenInUnitBatch broken tube/s in this unit batch');
              // print(
              //     'and a total of $brokenTubes broken tube/s in the classroom');
              // print('-------------');
            }
            if (brokenInUnitBatch >= 2) {
              replacedTubes += tubesPerUnit;
              expirationHours = _generateReplacedTubesExpirationHours(
                hoursElapsed: hoursElapsed,
              );
              // print(
              //     'We replace tubes and obtain new expiration hours: $expirationHours');
              // print('-------------');
              brokenInUnitBatch = 0;
            }
          }
        }
      }
    }

    final cost = replacedTubes * tubeCost;

    return [brokenTubes, cost];
  }

  List<int> _generateTubesExpirationHours() {
    final result = List.generate(
      tubesPerUnit,
      (_) => _randomUtils.rand(min: 100, max: 200),
    );
    return result;
  }

  List<int> _generateReplacedTubesExpirationHours({required int hoursElapsed}) {
    final result = _generateTubesExpirationHours()
        .map(
          (e) => e + hoursElapsed,
        )
        .toList();
    return result;
  }
}

abstract class RandomUtils {
  int rand({int min, int max});
}

class RandomUtilsImpl implements RandomUtils {
  final Random _random;

  RandomUtilsImpl({required Random random}) : _random = random;

  @override
  int rand({int min = 0, int max = 100}) {
    final result = _random.nextInt(max - min) + min;
    return result;
  }
}
