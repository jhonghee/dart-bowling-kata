import 'package:unittest/unittest.dart';
import 'package:dart-bowling-kata/bowling_kata.dart';

void main() {

  // utils test
  test('sum of values in list', () =>
      expect(55, sum([1,2,3,4,5,6,7,8,9,10])));

  test('partition 2', () =>
      expect([[1,2],[3,4],[5,6]], partition(2, [1,2,3,4,5,6])));

  test('map of partition 2', () =>
      expect([3,7,11], [[1,2],[3,4],[5,6]].map(sum)));

  test('partition 3', () =>
      expect([[1,2,3],[4,5,6],[7,8,9],[10,11]], partition(3, [1,2,3,4,5,6,7,8,9,10,11])));

  // Bowling Specs
  test('gutter game results in a score of zero', () =>
      expect( 0, score([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])));

  test('all 1s frames results in a score of 20', () =>
      expect(20, score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])));

  test('spare frame adds next roll to score', () =>
      expect(16, score([5,5,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])));

  test('strike frame adds next two rolls to score', () =>
      expect(26, score([10,5,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])));

  test('perfect games results in a score of three hundred', () =>
      expect(300, score([10,10,10,10,10,10,10,10,10,10,10,10])));

}
