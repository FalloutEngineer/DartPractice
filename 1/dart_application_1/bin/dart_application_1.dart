class CallableFunction {
  String call(String a, String b, String c) => '$a $b $c';
}

var wf = CallableFunction();

var out = wf('Ruston', 'and', 'Martin');

typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main(List<String> args) async {
  print(sort is Compare<int>);

  print(out);
}























// void main(List<String> args) async {
//   Duration interval = Duration(seconds: 1);
//   Stream<int> stream = Stream<int>.periodic(interval, (x) => (x + 1) * 2);

//   stream = stream.take(5);

//   await for (int i in stream) {
//     print(i);
//   }
// }






























// void main(List<String> args) {
//   performTasks();
// }

// void task1() {
//   var result = 'task1';

//   print('task1 done');
// }

// Future<void> performTasks() async {
//   task1();

//   task2().then((data) => task3(data)).catchError((error) => print(error));

//   try {
//     String? task2Result = await task2();

//     task3(task2Result);
//   } catch (error) {
//     print(error);
//   }
// }

// Future<String> task2() async {
//   return await Future.delayed(Duration(seconds: 3), () {
//     print('task2 done');
//     return 'data';
//   });
// }

// void task3(String task2data) {
//   var result = 'task3';

//   print('task3 done with data from $task2data');
// }





































// class foo<T, A> {
//   T func(T something) {
//     return something;
//   }

//   A fun(A something) {
//     return something;
//   }
// }

// void main(List<String> args) {
//   var a = 'aaa';
//   var b = 111;

//   var bar = foo<String, int>();

//   print(bar.func(a));
//   print(bar.fun(b));
// }















// class foo<T> {
//   T func(List<T> myList) {
//     T temp = myList[0];
//     return temp;
//   }
// }

// void main(List<String> args) {
//   var intL = <int>[1, 2, 3];
//   var strL = <String>['1', '2', '3'];

//   foo<int> foo1 = foo<int>();
//   foo<String> foo2 = foo<String>();

//   print(foo1.func(intL));

//   print(foo2.func(strL));
// }






















// class Base {
//   num a = 1;
// }

// class Based extends Base {
//   num b = 2;
// }

// class Foo<T extends Base> {
//   String toString() => 'Foo';
// }

// void main() {}


























// abstract class Chache<T> {
//   T getByKey(String key);
//   void setByKey(String key, T value);
// }

// class myChache extends Chache<String> {
//   Map chache = {};

//   String getByKey(String key) {
//     return chache[key];
//   }

//   void setByKey(key, value) {
//     chache[key] = value;
//   }
// }

// void main() {}




































// mixin BasicFeatures on Paladin {
//   num strength = 5;
//   num agility = 5;
//   num stamina = 5;

//   void recover() => print('Восстановление силы');
// }

// class Paladin {
//   num defence = 15;
//   void lightPower() => print('Сила');
// }

// class LightWarrior extends Paladin with BasicFeatures {
//   num attack;

//   LightWarrior(this.attack);
// }

// class Druid with BasicFeatures {
//   final int mp;
//   Druid(this.mp);
// }

// void main() {
//   LightWarrior l = LightWarrior(5);

//   l.lightPower();
//   l.recover();

//   Druid d = Druid(8);

//   d.recover();
// }
























// enum Vehicle { Car, Bike, Heli }

// void main() {
//   print(Vehicle.Bike);
// }

















// extension NumberParsing on String {
//   int parseInt() => int.parse(this);
//   double parseDouble() => double.parse(this);
// }

// class staticClass {
//   static const PI = 3.1415;
//   static void hi() => print('hi');
// }

// void main() {
//   staticClass.hi();
//   print(staticClass.PI);
// }




















// class Vector {
//   final int x, y;

//   Vector(this.x, this.y);

//   Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
//   Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
// }

// void main() {
//   Vector v1 = Vector(5, 5);
//   Vector v2 = Vector(7, 1);

//   print('${(v1 + v2).x}, ${(v1 - v2).x}');
// }























// class Person {
//   final _name;

//   Person(this._name);

//   String greet(String who) => 'Привет $who, я $_name';
// }

// class Impostor implements Person {
//   get _name => '';
//   String greet(String who) => 'Хай $who';
// }

// String greetBob(Person person) => person.greet('Bob');

// void main() {
//   print(greetBob(Person('Alex')));
//   print(greetBob(Impostor()));
// }































// abstract class AbstactClass {
//   void AbstractMethod();
// }

// class MyClass extends AbstactClass {
//   void AbstractMethod() {
//     print('Abstract');
//   }
// }

// void main() {
//   MyClass c = MyClass();

//   c.AbstractMethod();
// }




































// class Rectangle {
//   num left, top, width, height;

//   Rectangle(this.left, this.top, this.width, this.height);

//   num get right => left + width;
//   set right(num value) => left = value - width;

//   num get bottom => top + height;
//   set bottom(num value) => height = value - height;
// }

// void main() {
//   var rect = Rectangle(10, 15, 20, 40);

//   print(rect.left);
//   rect.right = 12;
//   print(rect.left);
// }








































// class Paladin {
//   final num attack;
//   final num defence;
//   final num lightPower;

//   Paladin(this.attack, this.defence) : lightPower = 7;

//   num superLightAttack() {
//     return attack + lightPower - 1;
//   }
// }

// void main() {
//   var hero = Paladin(12, 20);
//   print(hero.superLightAttack());
// }








































// class Logger {
//   final String name;

//   static final Map<String, Logger> _chache = <String, Logger>{};

//   factory Logger(String name) {
//     return _chache.putIfAbsent(name, () => Logger._internal(name));
//   }

//   Logger._internal(this.name) {
//     print('Called constructor');
//   }
// }

// void main() {
//   Logger log1 = Logger('log');
//   Logger log2 = Logger('log');
//   Logger log3 = Logger('Log!');

//   print(log1);
//   print(log2);
//   print(log3);
// }





































// class ImmutablePoint {
//   final num x, y;
//   const ImmutablePoint(this.x, this.y);
// }

// void main() {
//   ImmutablePoint p = const ImmutablePoint(5, 10);
//   ImmutablePoint p2 = const ImmutablePoint(5, 10);

//   print(p == p2);

//   // print('x: ${p.x}, | y: ${p.y}');
// }






























// class Paladin {
//   num? attack;
//   num? defence;

//   Paladin(this.attack, this.defence);
//   Paladin.darker(num attack) : this(attack, 5);

//   String toString() => 'Paladin <attack:$attack, defence:$defence>';
// }

// void main() {
//   Paladin p = Paladin.darker(28);

//   print(p.toString());
// }




































// class Paladin {
//   num? attack;
//   num? defence;
//   num? classRating;

//   Paladin(attack, defence)
//       : attack = attack,
//         defence = defence,
//         classRating = (attack + defence) * 10 / 2;
// }

// void main() {
//   Paladin p = Paladin(12, 20);
//   print(p.classRating);
// }






























// class Paladin {
//   num? lvl;
//   num? attack;
//   num? defence;

//   Paladin(int exp)
//       : lvl = exp ~/ 10,
//         attack = exp + 10,
//         defence = exp - 10 {
//     print('Инициализаторы: lvl = $lvl, attack = $attack, defence = $defence');
//   }
// }

// void main() {
//   var newPaladin = Paladin(43);
// }





























// abstract class Hero {
//   num? lvl;
//   num? damage;
//   num? health;
//   String? role;
//   late String _name;

//   String toString() => 'Hero: lvl=[$lvl], damage=[$damage], health=[$health]';

//   Hero(name) {
//     _name = name;
//   }

//   String getName() {
//     return _name;
//   }
// }

// class Paladin extends Hero {
//   Paladin(String? name) : super(name);

//   Paladin.darker({num? lvl = 17}) : super('default') {
//     super.lvl = lvl;
//     print('Darkness.......');
//   }

//   void defend() {
//     print('Defending');
//   }
// }

// void main() {
//   Hero darker = Paladin.darker(lvl: 99);
//   print(darker.toString());
// }
