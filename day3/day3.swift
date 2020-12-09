import Foundation

let mapWidth = 31
let mapHeight = 323

var map: [[Bool]] = []
var treeCount = 0

while let row = readLine() {
  let mapRow = row.map {$0 == "#"}
  map.append(mapRow)
}

var posX = 0
var posY = 0

while posY < mapHeight {
  if map[posY][posX] {
    treeCount += 1
  }

  posY += 1
  posX = (posX + 3) % mapWidth
}

print(treeCount)