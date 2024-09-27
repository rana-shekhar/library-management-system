// import 'dart:io';

// class Book {
//   String title;
//   String author;
//   String isbn;
//   bool isAvailable;

//   Book(this.title, this.author, this.isbn, this.isAvailable);

//   @override
//   String toString() {
//     return 'Title: $title, Author: $author, ISBN: $isbn, Available: ${isAvailable ? "Yes" : "No"}';
//   }
// }

// class User {
//   String name;
//   String userType;
//   List<String> borrowedBooks;

//   User(this.name, this.userType) : borrowedBooks = [];

//   @override
//   String toString() {
//     return 'Name: $name, Type: $userType, Borrowed Books: $borrowedBooks';
//   }
// }

// class Library {
//   List<Book> books = [];
//   List<User> users = [];

//   void addBook(Book book) {
//     books.add(book);
//     print('Book added: $book');
//   }

//   void removeBook(String isbn) {
//     books.removeWhere((book) => book.isbn == isbn);
//     print('Book removed with ISBN: $isbn');
//   }

//   void searchBooks(String query) {
//     var results = books.where((book) =>
//         book.title.toLowerCase().contains(query.toLowerCase()) ||
//         book.author.toLowerCase().contains(query.toLowerCase()));
//     if (results.isEmpty) {
//       print('No books found for query: $query');
//     } else {
//       results.forEach((book) => print(book));
//     }
//   }

//   void listAvailableBooks() {
//     var availableBooks = books.where((book) => book.isAvailable);
//     if (availableBooks.isEmpty) {
//       print('No available books');
//     } else {
//       availableBooks.forEach((book) => print(book));
//     }
//   }

//   void borrowBook(String isbn, User user) {
//     if (user.userType != 'member') {
//       print('Only members can borrow books');
//       return;
//     }
//     Book? book = books.firstWhere(
//       (book) => book.isbn == isbn && book.isAvailable,
//     );
//     if (book == null) {
//       print('Book with ISBN $isbn is not available');
//     } else {
//       book.isAvailable = false;
//       user.borrowedBooks.add(isbn);
//       print('Book borrowed: $book');
//     }
//   }

//   void returnBook(String isbn, User user) {
//     Book? book = books.firstWhere((book) => book.isbn == isbn);
//     if (book == null) {
//       print('No such book with ISBN: $isbn');
//       return;
//     }
//     if (!user.borrowedBooks.contains(isbn)) {
//       print('This user did not borrow the book with ISBN: $isbn');
//       return;
//     }
//     book.isAvailable = true;
//     user.borrowedBooks.remove(isbn);
//     print('Book returned: $book');
//   }

//   void addUser(User user) {
//     users.add(user);
//     print('User added: $user');
//   }

//   void removeUser(String name) {
//     users.removeWhere((user) => user.name == name);
//     print('User removed: $name');
//   }

//   void listUsers() {
//     if (users.isEmpty) {
//       print('No users found');
//     } else {
//       users.forEach((user) => print(user));
//     }
//   }
// }

// void main() {
//   var library = Library();
//   User? currentUser;

//   void showMenu() {
//     print('''\nLibrary Management System
// 1. Add Book
// 2. Remove Book
// 3. Search Books
// 4. List Available Books
// 5. Borrow Book
// 6. Return Book
// 7. Add User
// 8. Remove User
// 9. List Users
// 0. Exit
// Choose an option:''');
//   }

//   void handleOption(String? option) {
//     switch (option) {
//       case '1':
//         if (currentUser?.userType == 'librarian') {
//           stdout.write('Enter title: ');
//           var title = stdin.readLineSync();
//           stdout.write('Enter author: ');
//           var author = stdin.readLineSync();
//           stdout.write('Enter ISBN: ');
//           var isbn = stdin.readLineSync();
//           if (title != null && author != null && isbn != null) {
//             var book = Book(title, author, isbn, true);
//             library.addBook(book);
//           } else {
//             print('Invalid input, please try again.');
//           }
//         } else {
//           print('Only librarians can add books.');
//         }
//         break;
//       case '2':
//         if (currentUser?.userType == 'librarian') {
//           stdout.write('Enter ISBN of book to remove: ');
//           var isbn = stdin.readLineSync();
//           if (isbn != null) {
//             library.removeBook(isbn);
//           } else {
//             print('Invalid input, please try again.');
//           }
//         } else {
//           print('Only librarians can remove books.');
//         }
//         break;
//       case '3':
//         stdout.write('Enter title or author to search: ');
//         var query = stdin.readLineSync();
//         if (query != null) {
//           library.searchBooks(query);
//         } else {
//           print('Invalid input, please try again.');
//         }
//         break;
//       case '4':
//         library.listAvailableBooks();
//         break;
//       case '5':
//         if (currentUser?.userType == 'member') {
//           stdout.write('Enter ISBN to borrow: ');
//           var isbn = stdin.readLineSync();
//           if (isbn != null) {
//             library.borrowBook(isbn, currentUser!);
//           } else {
//             print('Invalid input, please try again.');
//           }
//         } else {
//           print('Only members can borrow books.');
//         }
//         break;
//       case '6':
//         if (currentUser?.userType == 'member') {
//           stdout.write('Enter ISBN to return: ');
//           var isbn = stdin.readLineSync();
//           if (isbn != null) {
//             library.returnBook(isbn, currentUser!);
//           } else {
//             print('Invalid input, please try again.');
//           }
//         } else {
//           print('Only members can return books.');
//         }
//         break;
//       case '7':
//         if (currentUser?.userType == 'librarian') {
//           stdout.write('Enter user name: ');
//           var name = stdin.readLineSync();
//           stdout.write('Enter user type (librarian/member): ');
//           var userType = stdin.readLineSync();
//           if (name != null && userType != null) {
//             var user = User(name, userType);
//             library.addUser(user);
//           } else {
//             print('Invalid input, please try again.');
//           }
//         } else {
//           print('Only librarians can add users.');
//         }
//         break;
//       case '8':
//         if (currentUser?.userType == 'librarian') {
//           stdout.write('Enter name of user to remove: ');
//           var name = stdin.readLineSync();
//           if (name != null) {
//             library.removeUser(name);
//           } else {
//             print('Invalid input, please try again.');
//           }
//         } else {
//           print('Only librarians can remove users.');
//         }
//         break;
//       case '9':
//         library.listUsers();
//         break;
//       case '0':
//         exit(0);
//       default:
//         print('Invalid option, try again.');
//     }
//   }

//   // Initial login
//   print('Enter your name:');
//   var name = stdin.readLineSync();
//   if (name != null && name.isNotEmpty) {
//     currentUser = library.users.firstWhere((user) => user.name == name);
//     if (currentUser == null) {
//       print('User not found, please add user as librarian.');
//       stdout.write('Enter user type (librarian/member): ');
//       var userType = stdin.readLineSync();
//       if (userType != null &&
//           (userType == 'librarian' || userType == 'member')) {
//         currentUser = User(name, userType);
//         library.addUser(currentUser);
//       } else {
//         print('Invalid input, please restart the application.');
//         return;
//       }
//     }

//     // Main loop
//     while (true) {
//       showMenu();
//       var option = stdin.readLineSync();
//       handleOption(option);
//     }
//   } else {
//     print('Invalid input, please restart the application.');
//   }
// }

// Develop a user-friendly, terminal-based library management system in Dart using object-oriented programming (OOP) concepts.

// Functionality:

// Book Management:
// 1. Add new books (title, author, ISBN, availability)
// 2. Remove books from the library
// 3. Search for books by title or author
// 4. List all available books
// 5. Borrowing and Returning:
// Borrow a book by providing ISBN (check availability)
// Return a borrowed book by providing ISBN

// User Interaction:
// Provide a clear menu for different functionalities
// Handle invalid user input gracefully

// Implement user accounts (librarian and member) with different access levels.
// Librarian Access:
// 1. Can add/remove books, search books, and see all available books.
// 2. Can manage users (add/remove/list users).
// Member Access:
// 1. Can search books, see available books, borrow books (restricted to member type), and view their borrowing history
import 'dart:io';

class Book {
  String title;
  String author;
  String isbn;
  bool isAvailable;

  Book(this.title, this.author, this.isbn, this.isAvailable);

  String toString() {
    return 'Title: $title, Author:$author, ISBN:$isbn,Available: $isAvailable';
  }
}

class Library {
  List<Book> books = [];

  void addBooks(Book book) {
    books.add(book);
    print('Book added $book');
  }

  void removeBooks(String isbn) {
    books.removeWhere((book) => book.isbn == isbn);
    print('Book Removed With ISBN Number: $isbn');
  }


  // what if there is input error => "kite "
  Book? searchBook(String title) {
    var result = books
        .where((book) => book.title.toLowerCase().contains(title.toLowerCase().trim()));
    if(result.isEmpty){
      print('no book found with this title: $title');
      return null;
    }else{
      result.forEach((book) => print(book));
      return result[0];
    }
  }

// List all books, available and not available
void allBooks (){
  var availableBooks = books.where((book) => book.isAvailable);
if(availableBooks.isEmpty){
  print('no book found.');
}else{
  availableBooks.forEach((book) => print(book));
}
}

void listAllAvailableBooks() {
  // list all available boookd
}

// borrowBook(isbn, userId)
void borrowBook(String isbn){
  bool val = false;
 val = books.firstWhere((book) =>book.isbn==isbn orElse: null);
if(val ==false){
  print('No book found for this library.');
}else{
  print('book is borrowed');
  // if book is available
  // if(var.isAvailable) {
  //   // set isAvailable to false

  //   // create a borrow history object
  //   // add the created bookHistory into borrowHIstories list
  // }
  print('book is borrowed');
  // removeBooks(isbn);
  }


}

// Create BookHistory object
// id, userId, bookId, rentedAt, returnedAd()

// store this in library

}
void main(){
 
  Book book1 = Book('phil','robert','45453232',true);
  Library lib1 = Library();
  lib1.addBooks(book1);
 lib1.allBooks();
//  lib1.removeBooks('45453232');
//  lib1.allBooks();
 lib1.searchBook('phil');
 lib1.borrowBook('45453232');
 lib1.allBooks();
  
}
