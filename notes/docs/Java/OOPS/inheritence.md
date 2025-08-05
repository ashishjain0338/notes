---
sidebar_position: 2
---

# Inheritance

Let's cover a basic level of inheritence
Following Section Cover the following:
1. `extends` keyword
2. `private` vs `public` vs `protected`
3. `super` keyword


Follow the code-comments to refersh it up:
```java
// BaseClass.java

package oops.inheritence;

public class BaseClass {
    public int base1 = 0;
    private int base2 = 0;
    /* 
    Accessible within the same package or in subclasses — 
    but not by unrelated classes in different packages.
    */ 
    protected int base3 = 0;

    public BaseClass(){}

    public BaseClass(int base1,int base2,int base3){
        this.base1 = base1;
        this.base2 = base2;
        this.base3 = base3;
    }

    public void sayHi(){
        System.out.printf(
        """
        ---------------------------------------------------
        Hello from Base-Class, My Attributes are %d, %d, %d
        ---------------------------------------------------
        """, base1, base2, base3);
    }

    protected void sayHiAgain(){
        System.out.printf(
        """
        ---------------------------------------------------
        Hello from Base-Class, My Attributes are %d, %d, %d
        ---------------------------------------------------
        """, base1, base2, base3);
    }

}
```

And the child-class is as:
```java
// ChildClass.java

package oops.inheritence;

// extends is used to specify Parent Class
public class ChildClass extends BaseClass {
    public int child1 = 0;

    public ChildClass(int b1, int b2, int b3, int c1) {
        // super is used to refer to Parent
        super(b1, b2, b3);// Will call parent Constructors
        child1 = c1;
    }

    public void sayHi() {
        System.out.printf(
            """
            ----------------------------------------------
            Hello from Child-Class, My Attributes are %d
            ----------------------------------------------
            """, child1);
    }

    public void askParentToSayHi(){
        // super can also be used to call parent methods as well as attributes
        super.sayHi();
    }


    public static void main(String[] args) {
        ChildClass myChildObj = new ChildClass(10, 20, 30, 40);
        /*
         * We can ascess:
         * Child attributes, Parents Public & Protected Attributes
         * But not parent Private attributes
         */
        System.out.println(myChildObj.base1 + ", " + myChildObj.base3 + ", " + myChildObj.child1);
        myChildObj.sayHi();// Will Call Child Class Method
        myChildObj.sayHiAgain();// Since, Child has no definations, It will call Base Class's Method
        myChildObj.askParentToSayHi();// Will call Parent Class Method
    }
}
```


## Understanding Protected
-----

Accessible within the same package or in subclasses — but not by unrelated classes in different packages.

Let's understand with current scenario:
```bash

# Consider the folder-structure
oops:.
├───external_package
│       ExtPkgClass.java
│
├───inheritence
│       AnyOtherClass.java
│       BaseClass.java
│       ChildClass.java
```

Follow the code-comments of the other file's code:

```java
// AnyOtherClass.java
package oops.inheritence;

public class AnyOtherClass {
    public static void main(String[] args){
        // Within Same Package Protected Attributes are available
        ChildClass myChildObjOutside = new ChildClass(-10, -20, -30, -40);
        System.out.println(myChildObjOutside.base3);
        BaseClass myBase = new BaseClass(2, 3, 4);
        System.out.println(myBase.base3);
    }
}
```

```java
package oops.external_package;

import oops.inheritence.ChildClass;
import oops.inheritence.BaseClass;

public class ExtPkgClass {
    public static void main(String[] args){
        ChildClass myChildObjOutside = new ChildClass(-10, -20, -30, -40);
        myChildObjOutside.base1 = 9; // Will Work
        // Won't Work because base3 is protected and not available in another package
        // System.out.println(myChildObjOutside.base3);
        BaseClass myBase = new BaseClass(2, 3, 4);
        myBase.base1 = 9; // Will Work
        // Won't Work because base3 is protected and not available in another package
        // System.out.println(myBase.base3);
        // myBase.sayHiAgain();
    }
    
}
```