import Foundation

func splitRow(_ row: String) -> (Int, Int, Character, String) {
  let rulePassword = row.components(separatedBy: ": ");
  let rangeChar = rulePassword[0].components(separatedBy: " ");
  let positions = rangeChar[0].components(separatedBy: "-");

  let password = rulePassword[1];
  let char = Character(rangeChar[1])
  let pos1 = Int(positions[0])! - 1;
  let pos2 = Int(positions[1])! - 1;

  return (pos1, pos2, char, password);
}

var validPasswordCount = 0;

while let row = readLine() {
  let (pos1, pos2, char, password) = splitRow(row);

  if 
    (password[password.index(password.startIndex, offsetBy: pos1)] == char) != 
    (password[password.index(password.startIndex, offsetBy: pos2)] == char) { // XOR
    validPasswordCount += 1
  } 
}

print(validPasswordCount)