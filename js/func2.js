function sayHi() {
  alert("Hi");
  // давайте посчитаем, сколько вызовов мы сделали
  sayHi.counter++;
}
sayHi.counter = 0; // начальное значение
sayHi(); // Hi
sayHi(); // Hi
alert( `Вызвана ${sayHi.counter} раза` );

function sayHi() {
  alert("Hi");
}
alert(sayHi.name); // sayHi

let sayHi = function() {
  alert("Hi");
};
alert(sayHi.name); // sayHi (есть имя!)

function f(sayHi = function() {}) {
  alert(sayHi.name); // sayHi (работает!)
}
f();

let user = {

  sayHi() {
    // ...
  },

  sayBye: function() {
    // ...
  }

}
alert(user.sayHi.name); // sayHi
alert(user.sayBye.name); // sayBye

function f1(a) {}
function f2(a, b) {}
function many(a, b, ...more) {}

alert(f1.length); // 1
alert(f2.length); // 2
alert(many.length); // 2


let sayHi = function func(who) {
  if (who) {
    alert(`Hello, ${who}`);
  } else {
    func("Guest"); // использует func, чтобы снова вызвать себя же
  }
};
sayHi(); // Hello, Guest
// А вот так - не cработает:
func(); // Ошибка, func не определена


let sum = new Function('a', 'b', 'return a + b');
alert( sum(1, 2) ); // 3

let str = ... код, полученный с сервера динамически ...
let func = new Function(str);
func();

function getFunc() {
  let value = "test";
  let func = new Function('alert(value)');
  return func;
}
getFunc()(); // ошибка: value не определено




