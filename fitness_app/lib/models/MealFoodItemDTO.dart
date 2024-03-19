class MealFoodItemDTO {
    String alimentName;
    int quantity;

    MealFoodItemDTO({
    this.alimentName="",
    this.quantity=0,
  });

   @override
  String toString() {
    return 'alimentName: $alimentName, quantity: $quantity';
  }
}