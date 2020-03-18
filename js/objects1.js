let fruit = prompt("Какой фрукт купить?", "apple");
let bag = {};

// имя свойства будет взято из переменной fruit
bag[fruit] = 5;


function makeUser(name, age) {
  return {
    name, // то же самое, что и name: name
    age   // то же самое, что и age: age
    // ...
  };
}

let user = { name: "John", age: 30 };

alert( "age" in user ); // true, user.age существует
alert( "blabla" in user ); // false, user.blabla не

let user = {
  name: "John",
  age: 30,
  isAdmin: true
};

for (let key in user) {
  // ключи
  alert( key );  // name, age, isAdmin
  // значения ключей
  alert( user[key] ); // John, 30, true
}

let a = {};
let b = a; // копирование по ссылке

alert( a == b ); // true, обе переменные ссылаются на один и тот же объект
alert( a === b ); // true


Object.assign(dest, [src1, src2, src3...]) // копирует src1, src2 в dest


let user = {
  name: "John",
  age: 30
};

let clone = Object.assign({}, user);

 delete obj.prop // удаление свойства объекта

 let id = Symbol("id");
 // user  - объект из сторонего кода
 user[id] = "Их идентификатор";

 // читаем символ из глобального реестра и записываем его в переменную
 let id = Symbol.for("id"); // если символа не существует, он будет создан

 // читаем его снова в другую переменную (возможно, из другого места кода)
 let idAgain = Symbol.for("id");

 // проверяем -- это один и тот же символ
 alert( id === idAgain ); // true

 // получаем имя по символу
 alert( Symbol.keyFor(idAgain) ); // id











