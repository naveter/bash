function sayHi(phrase, who) {
  alert( phrase + ', ' + who );
}
let timeId = setTimeout(sayHi, 1000, "Привет", "Джон");
clearTimeout(timeId);

// повторить с интервалом 2 секунды
let timerId = setInterval(() => alert('tick'), 2000);
// остановить вывод через 5 секунд
setTimeout(() => { clearInterval(timerId); alert('stop'); }, 5000);

// регулярно средствами setTimeout
let timerId = setTimeout(function tick() {
  alert('tick');
  timerId = setTimeout(tick, 2000); // (*)
}, 2000);

// этот код выводит «Привет» и затем сразу «Мир»:
setTimeout(() => alert("Мир"));
alert("Привет");




