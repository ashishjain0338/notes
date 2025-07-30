---
sidebar_position: 3
---

# Introduction

Follow the code-comments to understand variables, if-else, loops

```java
package basics;

import java.lang.reflect.Array;

/*
* General Observations
* If-else Syntax is same as C++
* Switch Syntax is same as C++
* While, for(;;), for(int x: nums) Loop Syntax is same as C++ 
*/
public class introduction {
    public static void understand_variables(){
        int  a = 3;
        double b = 11.0/2;
        boolean c = true;
        char d = 'd';
        String e = "abcd";

        System.out.println("Your varibles values are : " + a + ", " + b + ", " + c + ", " + d + ", " + e);
        // Typecasting
        int f = (int) b;
        System.out.println("After typecasting the value changes from "+  b +  " --> " + f);

    }

    public static void pyramid(int n, char spacer){
        int num = 1;
        for(int i =1 ;i <= n; i++){
            String out = "";
            for(int spacer_loop = n - i;  spacer_loop >= 0; spacer_loop--){
                out += spacer;
            }
            for(int z = 0; z < i; z++){
                out = out + num + spacer;
                num++;
            }

            System.out.println(out);
        }
    }
        
    public static void main(String[] args){
        understand_variables();
        pyramid(5, ' ');
    }
}

```