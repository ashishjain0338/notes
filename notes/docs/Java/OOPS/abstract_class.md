---
sidebar_position: 3
---

# Abstract Class

An abstract class is like a person saying:
1. You can't create an object of me directly.
2. If you want to use me, you must inherit me in a subclass.
3. Any subclass must provide concrete implementations for all my abstract methods.

Follow the code-comments to know more:

```java
// AbstractClass.java

package oops.abstract_class;

/*
* Abstract is a restricted class, You can't make objects of abstract class,
* But can only be inherited from.
*/
abstract class AbstractClass {
    int base1 = 10;

    /*
     * Abstract Methods can't have any body, only definations
     * The Body is provided from subclass (which will inherit it)
     */
    abstract void sayHi();

    /*
     * Abstract class can have normal methods too
     */
    public void sayHiGiveItATry(){
        System.out.println("Yes, I can say Hi, Just slightly restriced");
    }


}
```

```java
// ChildClass.java

package oops.abstract_class;

public class ChildClass extends AbstractClass{

    /*
     * Since the Super(Parent) Class is abstract class with abstract method 'sayHi',
     * This class MUST provide the body
     * If you comment out the below function, It won't function
     */
    public void sayHi(){
        System.out.println("Hi, from the Child Class");
    }

    // You can any other function too
    public void abc(){
        System.out.println("ABC called");
    }

    public static void main(String[] args){
        ChildClass mychildObj = new ChildClass();
        mychildObj.sayHi();// Will call the child's defination
        mychildObj.sayHiGiveItATry();// Will call the abstract class's normal method
        mychildObj.abc();// Like a normal method
        System.out.println(mychildObj.base1);// Abstract Attribtes are available to child as normal
    }
}
```