import 'dart:io';

class Contact {
  String name;
  String phoneNumber;
  String email;

  Contact(this.name, this.phoneNumber, this.email);

  @override
  String toString() {
    return 'Name: $name, Phone Number: $phoneNumber, Email: $email';
  }
}

class AddressBook {
  List<Contact> contacts = [];

  void addContact(Contact contact) {
    contacts.add(contact);
    print('Contact added!');
  }

  void deleteContact(String name) {
    contacts.removeWhere(
        (contact) => contact.name.toLowerCase() == name.toLowerCase());
    print('Contact deleted!');
  }

  void displayAllContacts() {
    if (contacts.isEmpty) {
      print('No contacts available.');
    } else {
      
      for (var contact in contacts) {
        print(contact);
      }
    }
  }

  void searchContact(String name) {
    var results = contacts
        .where((contact) => contact.name.toLowerCase() == name.toLowerCase());
    if (results.isEmpty) {
      print('No contact found: $name');
    } else {
//       print('Search results:');
      for (var contact in results) {
        print(contact);
      }
    }
  }
}

void main() {
  var addressBook = AddressBook();

//   addressBook.addContact(
//       Contact('Shekhar', '9826366726', 'Shekharrana1011@example.com'));

//   addressBook.displayAllContacts();


    print('Address Book Application');
    print('1. Add Contact');
    print('2. Delete Contact');
    print('3. Search Contact');
    print('4. Display All Contacts');
    print('5. Exit');
    stdout.write('Enter your choice: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter name: ');
        var name = stdin.readLineSync()!;
        stdout.write('Enter phone number: ');
        var phoneNumber = stdin.readLineSync()!;
        stdout.write('Enter email: ');
        var email = stdin.readLineSync()!;
        addressBook.addContact(Contact(name, phoneNumber, email));
        break;

      case '2':
        stdout.write('Enter the name of the contact to delete: ');
        var name = stdin.readLineSync()!;
        addressBook.deleteContact(name);
        break;

      case '3':
        stdout.write('Enter the name to search: ');
        var name = stdin.readLineSync()!;
        addressBook.searchContact(name);
        break;

      case '4':
        addressBook.displayAllContacts();
        break;

      case '5':
        print('Exiting...');
        

      default:
        print('Invalid choice. Please try again.');
    }

}
