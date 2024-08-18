//Create a ShoppingCart class with properties items (a list of strings) and totalAmount.
//Implement methods to addItem, removeItem, and calculateTotal.
//Ensure that the total amount cannot be negative, and items cannot be removed if the cart is empty

class ShoppingCart {
  List<String> items = [];
  double totalAmount = 0.0;

  void addItem(String item, double price) {
    if (price <= 0) {
      print('price of item cant be zero.');
    } else {
      items.add(item);
      totalAmount += price;
      print('The $item of $price is added.');
    }
  }

  void removeItem(String item, double price) {
    if (items.isEmpty) {
      print('The cart is empty');
    } 
    else if (items.contains(item)) {
      items.remove(item);
      totalAmount -= price;
      print('The $item costing $price is removed from the cart.');
    } else {
      print('The item is not found in the cart.');
    }
  }
  void calculateTotal(){
    print('total amount of the cart is: $totalAmount');
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();
  
  cart.addItem('headphones', 2000);
  cart.addItem ('laptop', 50000);
  cart.calculateTotal();
  
  cart.removeItem('laptop', 50000);
   cart.calculateTotal();
}