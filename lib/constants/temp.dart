class Vehicle extends SpecialPower{
  String name;
  String _engine;
  int tyres;
  double fuel;

  Vehicle(this.name, this._engine, this.tyres, this.fuel);

  void startEngine() {
    if(fuel<=0) {
      print("No Fuel, Can't start!");
    }
    else print("Engine Started!");
  }

  void reFuel(double amt) {
    fuel += amt;
    print("Fuel level is $fuel");
  }

  void runVehicle(double amt) {
    fuel = fuel - amt;
    print("Fuel level is $fuel");
  }

  @override
  void runSpecialPower() {

  }

}

class Car extends Vehicle{

  Car(super.name, super.engine, super.tyres, super.fuel);

  void playMusic() {
    print("Playing Music");
  }

}

abstract class SpecialPower {
  void runSpecialPower();
}

void main() {
  Vehicle vehicle = Vehicle("Car", "1200", 4, 15);
  vehicle.startEngine();
  vehicle.reFuel(15);

  vehicle.runVehicle(30);

  vehicle.startEngine();

  Car car = Car("CRV", "1200", 4, 30);

  car.playMusic();

}