class BankAccount {
  String? accountNumber;
  String? owner;
  double? balance;

  BankAccount(this.accountNumber, this.owner, this.balance);

  void deposit(double amount) {
    if (amount <= 0) {
      print('Amount is not valid');
    } else {
      balance = balance! + amount;
      print('Deposited: $amount. New balance: $balance');
    }
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Invalid amount');
    } else if (amount > balance!) {
      print('Insufficient funds.');
    } else if (balance! - amount < 2000) {
      print('You have to maintain a minimum balance of 2000.');
    } else {
      balance = balance! - amount;
      print('Withdrawal of $amount successful. New balance: $balance');
    }
  }

  void checkBalance() {
    print('The current balance is: $balance');
  }

  void calculateInterest(double rate) {
    if (rate < 0) {
      print('Invalid rate.');
    } else {
      double interest = balance! * (rate / 100);
      balance = balance! + interest;
      print('Interest of $interest added at a rate of $rate%. New balance: $balance');
    }
  }

  void transferMoney(BankAccount recipient, double amount) {
    if (amount <= 0) {
      print('Please enter an amount greater than 0');
    } else if (balance! - amount < 2000) {
      print('Balance cant drop below 2000');
    } else {
      balance = balance! - amount;
      recipient.deposit(amount);
      print('Transferred: $amount to ${recipient.owner}. New balance is: $balance');
    }
  }
}

void main() {
  BankAccount myAccount1 = BankAccount('123456789', 'Shekhar Rana', 5000.0);
  BankAccount myAccount2 = BankAccount('987654321', 'Sagar', 2000.0);

  myAccount1.checkBalance();
  myAccount2.checkBalance();

  myAccount1.transferMoney(myAccount2, 1000.0);  

  myAccount1.withdraw(4000);
  // myAccount1.calculateInterest(-2.0);  
  // myAccount1.deposit(1000);
  myAccount1.checkBalance();
  myAccount2.checkBalance();
}
