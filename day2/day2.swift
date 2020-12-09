import Foundation

func splitRow(_ row: String) -> (Int, Int, Character, String) {
  let rulePassword = row.components(separatedBy: ": ");
  let rangeChar = rulePassword[0].components(separatedBy: " ");
  let minMax = rangeChar[0].components(separatedBy: "-");

  let password = rulePassword[1];
  let char = Character(rangeChar[1])
  let min = Int(minMax[0])!;
  let max = Int(minMax[1])!;

  return (min, max, char, password);
}

var validPasswordCount = 0;

while let row = readLine() {
  let (min, max, char, password) = splitRow(row);

  let charCount = password.filter({$0 == char}).count

  if charCount >= min && charCount <= max {
    validPasswordCount += 1
  } 
}

print(validPasswordCount)