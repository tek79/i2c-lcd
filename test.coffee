LCD = require("./lcd.coffee")


lcd = new LCD("/dev/i2c-1", 0x27)
lcd.init()
.then( ->
  return lcd.createChar(0, [
    0x1b, 0x15, 0x0e, 0x1b, 
    0x15, 0x1b, 0x15, 0x0e
  ])
).then( ->
  return lcd.createChar(1, [
    0x0c, 0x12, 0x12, 0x0c
    0x00, 0x00, 0x00, 0x00
  ])
)
.then( -> lcd.home() )
.then( -> lcd.print("Raspberry Pi #{String.fromCharCode(0)}") )
.then( -> lcd.setCursor(0, 1) )
.then( -> lcd.cursorUnder() )
.delay(2000)
.then( -> 
  d = new Date()
  s = d.toString()
  return lcd.setCursor(0, 0)
    .then( -> lcd.print(s) )
    .then( -> lcd.setCursor(0, 1) )
    .then( -> lcd.print(s.substring(16)) )
).done()