---
sidebar_position: 5
---

# Composition: has-a (strong)

1. Composition is a strong `has-a` relationship.
2. One class owns another class. If the owner is destroyed, the owned object is also destroyed.
3. UML Notation: `*--` or `Solid diamond (♦)` at the container class. `Container-Class *-- Contained-Class`
4. Example: Car `has-a` Engine. If you destroy car, engine will also get destroyed.
```bash
Car *-- Engine
```

Following the code, for more details:

```java
// Car.java
package oops.composition;

public class Car{
    Engine engineObj;

    Car(float fuel){
        // Engine is created inside Car
        this.engineObj = new Engine(fuel);
    }

    public static void main(String[] args){
        Car carObj = new Car(2);
        carObj.engineObj.drive();
        carObj.engineObj.drive();
        carObj.engineObj.drive();
        /*
         * Keep in Mind, If I destroy "carObj", "EngineObj" is also deleted,
         * Showing, "Strong (has-a) relationship"
         */
    }
}
```

```java
// Engine.java
package oops.composition;

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
