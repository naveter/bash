class User {

  constructor(name) {
    this.name = name;
  }

  sayHi() {
    alert(this.name);
  }

}

// Использование:
let user = new User("Иван");
user.sayHi();


class User {
  constructor(name) { this.name = name; }
  sayHi() { alert(this.name); }
}
// класс - это функция
alert(typeof User); // function
// ...или, если точнее, это метод constructor
alert(User === User.prototype.constructor); // true
// Методы находятся в User.prototype, например:
alert(User.prototype.sayHi); // alert(this.name);
// в прототипе ровно 2 метода
alert(Object.getOwnPropertyNames(User.prototype));


// "Named Class Expression"
// (в спецификации нет такого термина, но происходящее похоже на Named Function Expression)
let User = class MyClass {
  sayHi() {
    alert(MyClass); // имя MyClass видно только внутри класса
  }
};
new User().sayHi(); // работает, выводит определение MyClass
alert(MyClass); // ошибка, имя MyClass не видно


function f(phrase) {
  return class {
    sayHi() { alert(phrase) }
  }
}
class User extends f("Привет") {}
new User().sayHi(); // Привет


class Animal {

  constructor(name) {
    this.speed = 0;
    this.name = name;
  }

  run(speed) {
    this.speed = speed;
    alert(`${this.name} бежит со скоростью ${this.speed}.`);
  }

  stop() {
    this.speed = 0;
    alert(`${this.name} стоит.`);
  }

}

class Rabbit extends Animal {
  hide() {
    alert(`${this.name} прячется!`);
  }

  stop() {
    super.stop(); // вызываем родительский метод stop
    this.hide(); // и затем hide
  }
}

let rabbit = new Rabbit("Белый кролик");

rabbit.run(5); // Белый кролик бежит со скоростью 5.
rabbit.stop(); // Белый кролик стоит.


// вместо класса
function Rabbit() {}
alert( new Rabbit() instanceof Rabbit ); // true




