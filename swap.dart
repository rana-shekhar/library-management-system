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

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print('Book added: $book');
  }

  void removeBook(String title) {
    var bookToRemove = books.firstWhere(
      (book) => book.title == title);
     
    
    if (bookToRemove != null) {
      books.remove(bookToRemove);
      print('Book removed: $bookToRemove');
    } else {
      print('No book with title "$title" found.');
    }
  }

  void searchBooks({String? title, String? author}) {
    var results = books.where((book) {
      bool matchesTitle = title != null && book.title?.contains(title) == true;
      bool matchesAuthor = author != null && book.author?.contains(author) == true;
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

  void borrowBook(String isbn) {
    var bookToBorrow = books.firstWhere(
      (book) => book.isbn == isbn);
      
    
    if (bookToBorrow != null) {
      if (bookToBorrow.isAvailable) {
        bookToBorrow.isAvailable = false;
        print('Book borrowed: $bookToBorrow');
      } else {
        print('The book is currently not available.');
      }
    } else {
      print('No book with ISBN "$isbn" found.');
    }
  }

  void returnBook(String isbn) {
    var bookToReturn = books.firstWhere(
      (book) => book.isbn == isbn,
      orElse: () => null,
    );
    if (bookToReturn != null) {
      if (!bookToReturn.isAvailable) {
        bookToReturn.isAvailable = true;
        print('Book returned: $bookToReturn');
      } else {
        print('The book was not borrowed.');
      }
    } else {
      print('No book with ISBN "$isbn" found.');
    }
  }
}

void main() {
  var library = Library();
  
  // Adding books
  library.addBook(Book('1984', 'George Orwell', '1234567890', true));
  library.addBook(Book('To Kill a Mockingbird', 'Harper Lee', '0987654321', true));

  // Listing available books
  library.listAvailableBooks();

  // Searching for books
  library.searchBooks(title: '1984');
  library.searchBooks(author: 'Harper Lee');

  // Borrowing a book
  library.borrowBook('1234567890');

  // Trying to borrow the same book again
  library.borrowBook('1234567890');

  // Returning a borrowed book
  library.returnBook('1234567890');

  // Trying to return the same book again
  library.returnBook('1234567890');

  // Removing a book
  library.removeBook('To Kill a Mockingbird');

  // Listing available books again
  library.listAvailableBooks();
}

