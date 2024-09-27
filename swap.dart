// void main() {
//   int a = 5;
//   int b = 10;

//   (b, a) = (a, b);

//   print('$a.....$b');
// }
import 'dart:io';

class Book {
  String? title;
  String? author;
  String? isbn;
  bool isAvailable;

  Book(this.title, this.author, this.isbn, this.isAvailable);

  @override
  String toString() {
    return 'Title: $title, Author: $author, ISBN: $isbn, Available: $isAvailable';
  }
}

class User {
  String name;
  String userType;
  List<String> borrowedBooks;

  User(this.name, this.userType) : borrowedBooks = [];

  @override
  String toString() {
    return 'Name: $name, Type: $userType, Borrowed Books: $borrowedBooks';
  }
}

class Library {
  List<Book> books = [];
  List<User> users = [];

  void addBook(Book book) {
    books.add(book);
    print('Book added: $book');
  }

  void removeBook(String isbn) {
    var bookToRemove = books.firstWhere(
      (book) => book.isbn == isbn,
      orElse: () => Book("", "", "", false),
    );

    if (bookToRemove.isAvailable) {
      books.remove(bookToRemove);
      print('Book removed: $isbn');
    } else {
      print('No book with ISBN "$isbn" found.');
    }
  }

  void searchBooks({String? title, String? author}) {
    var results = books.where((book) {
      bool matchesTitle = title != null && book.title?.contains(title) == true;
      bool matchesAuthor =
          author != null && book.author?.contains(author) == true;
      return matchesTitle || matchesAuthor;
    }).toList();

    if (results.isEmpty) {
      print('No books found.');
    } else {
      print('Search results:');
      results.forEach(print);
    }
  }

  void listAvailableBooks() {
    var availableBooks = books.where((book) => book.isAvailable).toList();
    if (availableBooks.isEmpty) {
      print('No available books.');
    } else {
      print('Available books:');
      availableBooks.forEach(print);
    }
  }

  void borrowBook(String isbn, User user) {
    if (user.userType != 'member') {
      print('Only members can borrow books.');
      return;
    }
    var book = books.firstWhere(
      (book) => book.isbn == isbn && book.isAvailable,
      orElse: () => Book("", "", "", false),
    );
    if (book.isAvailable) {
      book.isAvailable = false;
      user.borrowedBooks.add(isbn);
      print('Book borrowed: $book');
    } else {
      print('Book with ISBN $isbn is not available.');
    }
  }

  void returnBook(String isbn, User user) {
    var book = books.firstWhere(
      (book) => book.isbn == isbn,
      orElse: () => Book("", "", "", false),
    );
    if (book.isAvailable) {
      print('No such book with ISBN: $isbn.');
      return;
    }
    if (!user.borrowedBooks.contains(isbn)) {
      print('This user did not borrow the book with ISBN: $isbn.');
      return;
    }
    book.isAvailable = true;
    user.borrowedBooks.remove(isbn);
    print('Book returned: $book');
  }

  void addUser(User user) {
    users.add(user);
    print('User added: $user');
  }

  void removeUser(String name) {
    users.removeWhere((user) => user.name == name);
    print('User $name removed.');
  }

  void listUsers() {
    print('Listing all users:');
    users.forEach(print);
  }
}

void main() {
  var library = Library();

  stdout.write('Enter your name: ');
  var name = stdin.readLineSync()!;
  stdout.write('Are you a member or librarian? ');
  var userType = stdin.readLineSync()!.toLowerCase();

  var user = User(name, userType);

  if (userType == 'librarian') {
    while (true) {
      print('Librarian Menu:');
      print('1. Add Book');
      print('2. Remove Book');
      print('3. Search Books');
      print('4. List Available Books');
      print('5. Add User');
      print('6. Remove User');
      print('7. List Users');
      print('8. Exit');
      stdout.write('Choose an option: ');
      var choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          stdout.write('Enter title: ');
          var title = stdin.readLineSync();
          stdout.write('Enter author: ');
          var author = stdin.readLineSync();
          stdout.write('Enter ISBN: ');
          var isbn = stdin.readLineSync();
          stdout.write('Is the book available? (yes/no): ');
          var availability = stdin.readLineSync()?.toLowerCase() == 'yes';

          var book = Book(title, author, isbn, availability);
          library.addBook(book);
          break;

        case '2':
          stdout.write('Enter ISBN of the book to remove: ');
          var isbnToRemove = stdin.readLineSync();
          library.removeBook(isbnToRemove!);
          break;

        case '3':
          stdout.write('Enter title to search: ');
          var searchTitle = stdin.readLineSync();
          stdout.write('Enter author to search: ');
          var searchAuthor = stdin.readLineSync();
          library.searchBooks(title: searchTitle, author: searchAuthor);
          break;

        case '4':
          library.listAvailableBooks();
          break;

        case '5':
          stdout.write('Enter name: ');
          var userName = stdin.readLineSync();
          stdout.write('Enter user type (member/librarian): ');
          var userType = stdin.readLineSync()!;
          var newUser = User(userName!, userType.toLowerCase());
          library.addUser(newUser);
          break;

        case '6':
          stdout.write('Enter name of the user to remove: ');
          var userName = stdin.readLineSync();
          library.removeUser(userName!);
          break;

        case '7':
          library.listUsers();
          break;

        case '8':
          print('Exiting...');
          return;

        default:
          print('Invalid option. Please try again.');
      }

      print('\n');
    }
  } else if (userType == 'member') {
    while (true) {
      print('Member Menu:');
      print('1. Search Books');
      print('2. List Available Books');
      print('3. Borrow Book');
      print('4. Return Book');
      print('5. View Borrowed Books');
      print('6. Exit');
      stdout.write('Choose an option: ');
      var choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          stdout.write('Enter title to search: ');
          var searchTitle = stdin.readLineSync();
          stdout.write('Enter author to search: ');
          var searchAuthor = stdin.readLineSync();
          library.searchBooks(title: searchTitle, author: searchAuthor);
          break;

        case '2':
          library.listAvailableBooks();
          break;

        case '3':
          stdout.write('Enter ISBN of the book to borrow: ');
          var isbn = stdin.readLineSync();
          library.borrowBook(isbn!, user);
          break;

        case '4':
          stdout.write('Enter ISBN of the book to return: ');
          var isbnToReturn = stdin.readLineSync();
          library.returnBook(isbnToReturn!, user);
          break;

        case '5':
          print('Your borrowed books: ${user.borrowedBooks}');
          break;

        case '6':
          print('Exiting...');
          return;

        default:
          print('Invalid option. Please try again.');
      }

      print('\n');
    }
  } else {
    print('Invalid user type. Please restart the program.');
  }
}

