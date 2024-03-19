import 'dart:ffi';
import 'dart:typed_data';

class MealSummaryDTO {
  double kcal;
  double carbohidrates;
  double proteins;
  double fibers;
  double vitA;
  double vitB;
  double vitC;
  double magnezium;
  double sodium;

  MealSummaryDTO({
    this.kcal=0.0,
    this.carbohidrates=0.0,
    this.proteins=0.0,
    this.fibers=0.0,
    this.vitA=0.0,
    this.vitB=0.0,
    this.vitC=0.0,
    this.magnezium=0.0,
    this.sodium=0.0,
  });
}