---
sidebar_position: 5
---

# Enum

An enum is a special "class" that represents a group of constants.

Follow the code-comments to know more

```java
package basics;

enum Month{
    January,
    Feburary,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    October,
    Novemeber,
    December
}

public class enumClass {
    
    public static void main(String[] args){
        // Accessing Single Value
        System.out.println(Month.December);
        // Accessing All Values
        for(Month m: Month.values()){
            System.out.println(m);
        }
    }
}

```