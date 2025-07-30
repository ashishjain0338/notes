---
sidebar_position: 2
---
# Hello World

Let's start with writing an hello world program:

```java
/*
 * The File must start with a class with class-name same as the filename
 */
public class helloworld{
    /*
     * int main(){}
     * is changed to
     * public static void main(String[] args)
     * i.e.:
     * 1. It must be public & Static
     * 2. It must return nothing (void)
     * 3. It must accept arry of Strings
     * 4. Be named main
     */
    public static void main(String[] args){
        System.out.println("Hello World");
    }
}
```

## Compile & Run

```bash
java helloworld.java
```