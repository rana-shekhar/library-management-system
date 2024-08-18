// class inventoryItems{
// List<Item> items = []
// }


class InventoryItem {
  String itemName;
  int quantity;
  double pricePerUnit;

  InventoryItem(this.itemName, this.quantity, this.pricePerUnit);


  void addStock(int additionalUnits) {
    if (additionalUnits > 0) {
      quantity += additionalUnits;
      print('$additionalUnits units of "$itemName" added. New quantity: $quantity');
    } else {
      print('Invalid  units.  add a positive quantity.');
    }
  }


  void removeStock(int unitsToRemove) {
    if (unitsToRemove > 0 && unitsToRemove <= quantity) {
      quantity -= unitsToRemove;
      print('$unitsToRemove units of "$itemName" removed.  quantity: $quantity');
    } else if (unitsToRemove > quantity) {
      print('Not enough stock. Only $quantity units of "$itemName" available.');
    } else {
      print('Invalid  units.  remove a positive quantity.');
    }
  }

 
  double calculateValue() {
    return quantity * pricePerUnit;
  }

  void displayDetails() {
    print('Item: $itemName');
    print('Quantity: $quantity');
    print('Price per Unit: ₹$pricePerUnit');
    print('Total Value: ₹${calculateValue()}');
  }
}
class Inventory {
  List<InventoryItem> items = [];

  void additem (InventoryItem item){
    // if()
    items.add(item);
    print('item ${item.itemName} added to inventory');
  }
  // void removeItem(String itemName){
  //   items.removeWhere(itemName);
  //   print('item $itemName is removed from the inventory');
  // }
    void displayAllItems(){
      if(items.isEmpty){
        print('no item.');
      }else{
        for(InventoryItem item in items){
          item.displayDetails();
        }
      }
    }
}
void main() {
Inventory myInventory = Inventory();
  InventoryItem item1 = InventoryItem('Laptop', 10, 50000.0);
  
  InventoryItem item2 = InventoryItem('headphones', 5, 500.0);
myInventory.additem(item1);
myInventory.additem(item2);
  // item1.displayDetails();
  // item1.addStock(5);
  // item1.removeStock(3);
  // item1.removeStock(20);
  // item1.displayDetails();
  // item2.displayDetails();
  myInventory.displayAllItems();
}