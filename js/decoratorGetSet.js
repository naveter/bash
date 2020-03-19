function sayHi() {
  alert(this.name);
}

let user = { name: "John" };
let admin = { name: "Admin" };

// используем 'call' для передачи различных объектов в качестве 'this'
sayHi.call( user ); // John
sayHi.call( admin ); // Admin


let worker = {
  someMethod() {
    return 1;
  },

  slow(x) {
    alert("Called with " + x);
    return x * this.someMethod(); // (*)
  }
};

function cachingDecorator(func) {
  let cache = new Map();
  return function(x) {
    if (cache.has(x)) {
      return cache.get(x);
    }
    let result = func.call(this, x); // теперь 'this' передаётся правильно
    cache.set(x, result);
    return result;
  };
}

worker.slow = cachingDecorator(worker.slow); // теперь сделаем её кеширующей

alert( worker.slow(2) ); // работает
alert( worker.slow(2) ); // работает,


function hash() {
  alert( [].join.call(arguments) ); // 1,2
}
hash(1, 2);

let user = {
  firstName: "Вася",
  sayHi() {
    alert(`Привет, ${this.firstName}!`);
  }
};
setTimeout(() => user.sayHi(), 1000);
// ...в течение 1 секунды
user = { sayHi() { alert("Другой пользователь в 'setTimeout'!"); } };

// Другой пользователь в 'setTimeout'!

let user = {};

Object.defineProperty(user, "name", {
  value: "John"
});

let descriptor = Object.getOwnPropertyDescriptor(user, 'name');
alert( JSON.stringify(descriptor, null, 2 ) );
/*
{
  "value": "John",
  "writable": false,
  "enumerable": false,
  "configurable": false
}
 */

let user = {
  name: "John"
};
Object.defineProperty(user, "name", {
  writable: false
});
user.name = "Pete";

let user = { };
Object.defineProperty(user, "name", {
  value: "John",
  // для нового свойства необходимо явно указывать все флаги, для которых значение true
  enumerable: true,
  configurable: true
});
alert(user.name); // John
user.name = "Pete"; // Ошибка


let user = {
  name: "John",
  surname: "Smith",

  get fullName() {
    return `${this.name} ${this.surname}`;
  }
};
alert(user.fullName); // John Smith



function User(name, birthday) {
  this.name = name;
  this.birthday = birthday;

  // возраст рассчитывается из текущей даты и дня рождения
  Object.defineProperty(this, "age", {
    get() {
      let todayYear = new Date().getFullYear();
      return todayYear - this.birthday.getFullYear();
    }
  });
}
let john = new User("John", new Date(1992, 6, 1));
alert( john.birthday ); // доступен как день рождения
alert( john.age );      // ...так и возраст




