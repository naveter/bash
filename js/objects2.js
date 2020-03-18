// эти объекты делают одно и то же (одинаковые методы)

user = {
  sayHi: function() {
    alert("Привет");
  }
};

// сокращённая запись выглядит лучше, не так ли?
user = {
  sayHi() { // то же самое, что и "sayHi: function()"
    alert("Привет");
  }
};


let user = { name: "Джон" };
let admin = { name: "Админ" };

function sayHi() {
  alert( this.name );
}

// используем одну и ту же функцию в двух объектах
user.f = sayHi;
admin.f = sayHi;

// вызовы функции, приведённые ниже, имеют разное значение this
// "this" внутри функции является ссылкой на объект, который указан "перед точкой"
user.f(); // Джон  (this == user)
admin.f(); // Админ  (this == admin)

admin['f'](); // Админ (неважен способ доступа

let user = {
  name: "John",
  money: 1000,

  // для хинта равного "string"
  toString() {
    return `{name: "${this.name}"}`;
  },

  // для хинта равного "number" или "default"
  valueOf() {
    return this.money;
  }

  [Symbol.toPrimitive](hint) {
    alert(`hint: ${hint}`);
    return hint == "string" ? `{name: "${this.name}"}` : this.money;
  }

};


function User(name) {
  // this = {};  (неявно)

  // добавляет свойства к this
  this.name = name;
  this.isAdmin = false;

  // return this;  (неявно)
}

let user = new User("Вася");

function User() {
  alert(new.target); // вызвано с new или нет
}

function BigUser() {

  this.name = "Вася";

  return { name: "Godzilla" };  // <-- возвращает этот объект
}

alert( new BigUser().name );  // Godzilla,

let user = new User; // <-- без скобок
// то же, что и
let user = new User();











