---
sidebar_position: 6
---

# Aggregation: has-a (weak)

1. Aggregation is a weak `has-a` relationship.
2. One class uses/contains another, but both can exist independently. The contained object can outlive the container or be shared among multiple containers.
3. UML Notation: `o--` or `Hollow diamond (◇)` at the container class. `Container-Class o-- Contained-Class`
4. Example: Car `has-a` Engine.
```bash
Car o-- Engine
```

Following the code, for more details:

```java
// Car.java
package oops.aggregation;

public class Car{
    Engine engineObj;

    Car(Engine engineObj){
        // Engine is passed from outside the Car
        this.engineObj = engineObj;
    }

    public static void main(String[] args){
        /*
         * Note: that Engine is created outside class, 
         * And it is passed in during car-object creation.
         */
        Engine engineObj = new Engine(2);
        Car carObj = new Car(engineObj);
        carObj.engineObj.drive();
        carObj.engineObj.drive();
        carObj.engineObj.drive();
    }
}
```

```java
//Engine.java
package oops.aggregation;

public class Engine {
    private float fuel = 0;
    
    Engine(float fuel){
        this.fuel = fuel;
    }

    void drive(){
        if(this.fuel <= 0){
            System.out.println("Not Enough Fuel");
            return;
        }
        System.out.println("Drove one unit");
        this.fuel--;
    }
}
```
