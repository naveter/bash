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


