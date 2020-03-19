function sayHi() {
  alert( "Привет" );
}

alert( sayHi ); // выведет код функции

let func = sayHi;    // (2) копируем

func(); // Привет    // (3) вызываем копию (работает)!
sayHi(); // Привет   //     прежняя тоже работает (почему бы нет)

let sum = (a, b) => a + b;

/* Более короткая форма для:

let sum = function(a, b) {
  return a + b;
};
*/

console.log( sum(1, 2) );

let age = prompt("Сколько Вам лет?", 18);

let welcome = (age < 18) ?
  () => alert('Привет') :
  () => alert("Здравствуйте!");

welcome(); // теперь всё в порядке

let sum = (a, b) => {  // фигурная скобка, открывающая тело многострочной функции
  let result = a + b;
  return result; // при фигурных скобках для возврата значения нужно явно вызвать return
};

alert( sum(1, 2) ); // 3

debugger;  // <-- здесь выполнение прерывается

function sumAll(...args) { // args — имя массива
  let sum = 0;

  for (let arg of args) sum += arg;

  return sum;
}

function f() {
  let showArg = () => alert(arguments[0]);
  showArg(2);
}

let arr = [3, 5, 1];
alert( Math.max(...arr) ); // 5 (оператор "раскрывает" массив в список аргументов)

let arr2 = [8, 3, -8, 1];
alert( Math.max(...arr, ...arr2) ); // 8

function makeCounter() {
  let count = 0;

  return function() {
    return count++; // есть доступ к внешней переменной "count"
  };
}

let counter = makeCounter();

// функции, которая запускатся сразу после её объявления
(function() {
  alert("Скобки вокруг функции");
})();

(function() {
  alert("Скобки вокруг всего");
}());

!function() {
  alert("Выражение начинается с побитового оператора NOT");
}();

+function() {
  alert("Выражение начинается с унарного плюса");
}();

// Вызов фуекции из возвращаемого значения функции
function f() {
  let value = Math.random();
  return function() { console.log(value);     };
}
f()();
(f())();



