// 8	ECMAScript 2017
// GWS can work with ECMAScript 5 (2009)
// ES6 не поддерживается IE, все остальные браузеры поддерживают с 2015-2016 года

if (true) {
  var test = true; // используем var вместо let
}
alert(test); // true, переменная существует

for (var i = 0; i < 10; i++) {
  // ...
}
alert(i); // 10, переменная i доступна вне цикла

function sayHi() {
  if (true) {
    var phrase = "Привет";
  }
  alert(phrase); // срабатывает и выводит "Привет"
}
sayHi();
alert(phrase); // Ошибка: phrase не определена

function sayHi() {
  phrase = "Привет";
  alert(phrase);
  var phrase;
}
sayHi();

var gVar = 5;
alert(window.gVar); // 5 (становится свойством глобального объекта)

// сделать информацию о текущем пользователе глобальной, для предоставления доступа всем скриптам
window.currentUser = {
  name: "John"
};

// где угодно в коде
alert(currentUser.name); // John

// или, если у нас есть локальная переменная с именем "currentUser",
// получим её из window явно (безопасно!)
alert(window.currentUser.name); // John

// использование полифилов
if (!window.Promise) {
  alert("Ваш браузер очень старый!");
}

