// class Person{
// String? name;
// String? name2;
// String? name3;

// void info(){
// print('the name is : $name');
// print('the name2 is : $name2');
// print('the name3 is : $name3');

// }
// }
// void main(){
// var details = Person();
// details.name= 'shekhar';
// details.name2= 'kuldeep';
// details.name3= 'parveen';

// var sp = Person();
// sp.name='john';
// sp.name2='wick';
// sp.name3='dr. dooms';


// details.info();
// sp.info();
// }

// class Person {
//   String? name;
//   String? fatherName;
//   int? age;
//   bool? isStudent;

//   void displayInfo() {
//     print("My name is ${name}");
//     print("My age is ${age}");
//     print("My father is ${fatherName}");
//   }
// }

// void main() {
//   var person = Person();
//   person.name = 'Asif Taj';
//   person.fatherName = 'Taj Gul';
//   person.age = 12;

//   var person1 = Person();
//   person1.name = 'John';
//   person1.fatherName = 'Wick';
//   person1.age = 20;

//   person.displayInfo();
//   person1.displayInfo();
// }

// class Car{
// String brand;
// String model;
// int year;

// Car(this.brand, this.model, this.year);

// void displayInfo (){
// print('brand: ${this.brand} ,model: ${this.model} , year: ${this.year}');
// }
// }
// void main(){
// var car1 =Car('maruti' 'gt' 2020); 
// car1.displayInfo();
// }

//Build a Simple Address Book Application:
 //Create a command-line application to store and manage contact information
 // (name, phone number, email). Features to implement: Search contact, 
 //Display all contacts, Add Contact, Delete contact


class Contact {
  String name;
  int phoneNumber;
  String email;

  Contact(this.name, this.phoneNumber, this.email);

 
  void info()
   {
    print('Name: $name, Phone Number: $phoneNumber, Email: $email');
    
  }
}
void main(){
  Contact con1 =Contact('shekhar' , 9466562780, 'shekharrana1011@gmail.com');

  con1.info();
}


