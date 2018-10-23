import 'package:test/test.dart';

import 'logic.dart' as lg;

void main() {
  group('Calculate logic', () {
    group('Contain function "calc"', () {
      test("function exist", () {
        expect(lg.calc, allOf([anything, isNotNull]) );
      });

      test("Called normally", () {
        expect(lg.calc([1, 2, 5], 10), allOf([isList]) );
      });

      test("Called normally with wrong params", () {
        expect(lg.calc([], 0), allOf([isNull]) );
      });
    });

    group('Behaviour function "calc"', () {
      test("example test", () {
        expect(lg.calc([1, 5, 10], 20), equals([1, 1, 1, 1, 1, 5, 10]) );
      });

      test("in params - nominal order doesnt matter", () {
        expect(lg.calc([10, 1, 5], 20), equals([1, 1, 1, 1, 1, 5, 10]) );
      });

      test("but not in answer", () {
        expect(lg.calc([1, 5, 10], 20), isNot(equals([1, 1, 1, 1, 1, 10, 5])) );
      });

      test("first test", () {
        expect(lg.calc([1, 2, 5], 10), equals([1, 2, 2, 5]) );
      });

      test("minimal counts confirm", () {
        expect(lg.calc([1, 2, 5, 10], 30), equals([1, 2, 2, 5, 10, 10]) );
      });

      test("return youself minimal", () {
        expect(lg.calc([1, 2, 5], 1), equals([1]) );
      });

      test("return youself not min, not GCD", () {
        expect(lg.calc([3, 5], 5), equals([5]) );
      });

      test("one item via others", () {
        expect(lg.calc([1, 2, 5], 5), equals([1, 2, 2]) );
      });

      test("one next", () {
        expect(lg.calc([1, 2, 3, 4, 5], 6), equals([1, 2, 3]) );
      });

      test("haven't answer - no error", () {
        expect(lg.calc([3, 4, 5], 2), equals(null) );
      });

      test("haven't answer 2 - no error", () {
        expect(lg.calc([3, 5, 13], 17), equals(null) );
      });

    });
  });
}