---
sidebar_position: 4
---

# Interface

1. Interface is like a `complete-abstract` class.
2. Keyword `implements` is used instead of `extends` and `interface` instead of `abstract`


Follow the code-comments to know more:

```java
// InterfaceClass.java

package oops.interface_class;

/*
* Interface class is a complete abstract class
* (No Objects, No Method Body(Strictly), Only Method Definations)
* Abstract classes can contain Normal-Method (like sayHiGiveItATry), but interface's can't
*/
interface InterfaceClass {
    // You don't need to specify it as abstract method, It will be by default
    public void sayHi();
}
```

```java
// ChildClass.java

package oops.interface_class;

/*
 * For Interfaces the keyword is implements instead of extends
 */
public class ChildClass implements InterfaceClass{

    /*
     * The class must implement all the methods of Interface
     */
    public void sayHi(){
        System.out.println("Hi, from the Child Class");
    }

    // You can have any other function too
    public void abc(){
        System.out.println("ABC called");
    }

    public static void main(String[] args){
        ChildClass mychildObj = new ChildClass();
        mychildObj.sayHi();// Will call the child's defination
        mychildObj.abc();// Like a normal method as normal
    }
}
```