---
sidebar_position: 7
---

# Singleton Class

1. Singleton Class is a class which can only be intiated once.
2. It needs to have a `private constructor` ensuring noone can create the object from outside.

## Eager Initialization
1. In this approach, the singleton instance is created at the time of class loading.
2. The instance is stored in a `private static final` field, ensuring it is available whenever required.
3. Since it is created upfront, it is `inherently thread-safe`.
4. Drawback: The instance is created even if it’s never used, which may waste resources if the object is heavy.

## Lazy Initialization
1. In this approach, the singleton instance is created only when it is first requested.
2. The class provides a `getInstance()` method, which checks if the object already exists.
    1. If not, it creates a new instance.
    2. If yes, it returns the existing one.
3. This technique delays creation until needed, also known as `Lazy Loading`.
4. Drawback: In multi-threaded environments, special care (like synchronization or double-checked locking) is needed to ensure thread safety.

## Code
Refer to the code-comments below for more insights:
```java
// Config.java
package oops.singleton_class;

public class Config {

    /*
     * Method-A: Eager Intialisation, Instance is created as when class is loaded
     * Multi-threading Safe
     * Final keyword below ensures the variable is never reassigned (The value assigned now is the file)
     * We can't provide arguments to constructors on runtime
     */
    // private static final Config CLASS_INSTANCE = new Config("Eager");
    private static Config CLASS_INSTANCE = null;
    String id;
    /*
     * Private Constructor to avoid outside Intialisation
     */
    private Config(String id){
        this.id = id;

    }

    public static Config getInstance(String id){
        /*
         * Method-B: Lazy-Loading: Create Instance only when it is needed:
         * Not Thread-Safe for multi-threaded environment
         */
        if(CLASS_INSTANCE == null){
            CLASS_INSTANCE = new Config(id);
        }
        return CLASS_INSTANCE;
    }
    
    public String toString(){
        return "Config id: " + id;
    }
}
```

```java
// Main.java
package oops.singleton_class;

public class Main {
    public static void main(String[] args){
        Config configObj1 = Config.getInstance("alpha");
        System.out.println(configObj1);
        Config configObj2 = Config.getInstance("beta");
        System.out.println(configObj2);
    }
}
```