library bowling_kata;

import 'dart:collection';

List<List<int>> partition(int n, List coll) {
  List newColl = [];
  List elmColl;
  for(int i=0; i<coll.length; i++) {
    if(i%n == 0) {
      elmColl = [];
      newColl.add(elmColl);
    }
    elmColl.add(coll[i]);
  }
  return newColl;
}

List<int> take(int n, List coll) {
  List newColl = [];
  if( n > coll.length ) {
    newColl = new List.from(coll);
  }
  else {
    for(int i=0; i<n; i++) {
       newColl.add(coll[i]);
    }
  }
  return newColl;
}

int sum(List points) => points.reduce(0, (prev, curr) => prev + curr);

List<int> drop(int n, List coll) {
  if( n < coll.length ) {
    return coll.getRange(n, coll.length-n);
  }
  else {
    return new List(0);
  }
}

bool isSpare(List rolls) {
  return sum(take(2, rolls)) == 10;
}

bool isStrike(List rolls) {
  return rolls[0] == 10;
}

List<int> rest_rolls(List rolls) {
  if( isStrike(rolls) ) {
    return drop(1, rolls);
  }
  else {
    return drop(2, rolls);
  }
}

List<List<int>> to_frames(List frames, List rolls) {

  if( rolls.length > 0 && frames.length < 10 ) {
    if( isSpare(rolls) || isStrike(rolls) ) {
      frames.add(take(3, rolls));
    }
    else {
      frames.add(take(2, rolls));
    }
    return to_frames(frames, rest_rolls(rolls));
  }
  else {
    return frames;
  }
}

int score(List rolls) {
  return sum(to_frames([], rolls).map(sum));
}