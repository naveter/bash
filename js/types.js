let str = "Привет";

alert( str.toUpperCase() ); // ПРИВЕТ

alert( 123456..toString(36) ); // 2n9c

let sum = 0.1 + 0.2;
alert( sum.toFixed(2) ); // 0.30

// Привет! Я – число, растущее само по себе!
alert( 9999999999999999 ); // покажет 10000000000000000

// Во всех других случаях Object.is(a, b) идентичен a === b.

function sum(a, b) {
  return a + b;
}
alert(`1 + 2 = ${sum(1, 2)}.`); // 1 + 2 = 3.


let str = '';

for (let i = 65; i <= 220; i++) {
  str += String.fromCodePoint(i);
}
alert( str );
// ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
// ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜ




