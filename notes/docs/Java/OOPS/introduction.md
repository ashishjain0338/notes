---
sidebar_position: 1
---

# Introduction

OOPS in Java is similar to C++

Follow the code-comments to refresh it up

```java
// Car.java

package oops;

// General Notation is to ClassName as PascalCase (MyApplication)
public class Car {
    String brand = "";
    double fuel = 0, mileage = 0;
    
    // Encapsulation: These variables should not be modified outside the class i.e "sensitive-data hidden from user"
    private double s = 0, v = 0, t = 0;
    /*
     * Constructor:
     * No Return Type and Same Name as Class
     */
    public Car(String brand, double fuel, double mileage){
        // Java has same 'this' operator as C++
        this.brand = brand;
        this.fuel = fuel;
        this.mileage = mileage;
    }
    /*
     * Static V/s Public
     * Static method can be called without creating the objects of the class,
     * Basically, If your fxn logic, doesn't need objects attributes context better to use static.
     * Public Method can only be accessed by objects
     */
    static void sayHi(){
        System.out.println("Hi Car");
    }

    public void print(){
        String message = String.format("""
                ---------------------------------------------------------------------
                Car Brand : %s,
                Fuel : %.2f l, Current Mileage : %.2f km/l,
                Distance: %.2f km, Current-Speed: %.2f Km/hr, Total-Time: %.2f hrs. 
                ---------------------------------------------------------------------
                """, brand, fuel, mileage, s, v, t);
        System.out.println(message);
    }

    private double fuelUsed(double distance){
        return distance/mileage;
    }

    public double accelerate(double a, double time){
        if(this.fuel <= 0){
            System.out.println("Insufficient Fuel");
            return -1;
        }
        System.out.println("Attempting to accelarte " + a + " km/hr for t = " + time + " hrs");
        double estimatedDistance = v*time + a*time*time/2.0;
        double estimatedFuel = fuelUsed(estimatedDistance);
        if(estimatedFuel <= this.fuel){
            // Update
            this.fuel -= estimatedFuel;
            this.t += time;
            this.s += estimatedDistance;
            this.v += a*time;
            return s;
        }
        System.out.println("Fuel is not sufficient");
        estimatedDistance = this.fuel * this.mileage;
        /*
         * s = ut + 1/2*at^2
         * 1/2*at^2 + ut - s
         * 
         * Discrimant = u^2 + 2*a*s
         * t = (-u +- sqrt(Discrimant))/2*a
         */
        // Solving the quaratic
        double D_sqrt = Math.sqrt(v*v + 2.0*a*estimatedDistance);
        double t1 = (-v + D_sqrt)/a,  t2 = (-v - D_sqrt)/a;
        double estimatedTime = (t2 < 0 ? t1 : t2);
        System.out.println("Your Car Will only run till time = " + estimatedTime);

        this.s += estimatedDistance;
        this.t += estimatedTime;
        this.fuel = 0;
        this.v += a*estimatedTime;
        return s;
    }

    
}

```

And the Runner:

```java
// runner.java

package oops;

public class runner {
    public static void main(String[] args){
        
        System.out.println("Hello World from runner");
        Car myCar = new Car("Toyota", 100, 25);
        myCar.print();
        double run[][] = {
            {10, 1},
            {20, 1},
            {20, 5},
            {-20, 5},
            {30, 10},
            {-30, 5}
        };
        for(double cur[]: run){
            double status = myCar.accelerate(cur[0], cur[1]);
            if(status != -1)
                myCar.print();
        }
    }
}

```