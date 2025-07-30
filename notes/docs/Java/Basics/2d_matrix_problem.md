---
sidebar_position: 4
---

# Matrix Rotation with Constraints

Problem Statement:
You are given a square matrix N x N of integers. You need to rotate the matrix `90 degrees clockwise` in-place (i.e., without using another 2D matrix).


However, there's a twist:
1. Only rotate the matrix if it contains at least one `prime number`.
2. If not, leave it unchanged and print "No prime found".

Example:
```
a, b, c         g, d, a
d, e, f   -->   h, e, b
g, h, i         i, f, c
```

### Check the Solution Below:

```java
package basics;

public class problem_I {

    /*
     * Problem Statement-I:
     * You are given a square matrix N x N of integers.
     * You need to rotate the matrix 90 degrees clockwise in-place (i.e., without
     * using another 2D matrix).
     * However, there's a twist:
     * Only rotate the matrix if it contains at least one prime number.
     * If not, leave it unchanged and print "No prime found".
     */
    public static void problemI(int[][] arr) {
        System.out.println("-------------- Running Problem-I with Input as ------------");
        array_printer(arr);
        int n = arr.length;
        boolean has_prime = false;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (isPrime(arr[i][j])) {
                    has_prime = true;
                    break;
                }
            }
        }
        if (!has_prime) {
            System.out.println("No Prime Detected Exiting");
            return;
        }
        /*
         * a, b, c g, d, a
         * d, e, f h, e, b
         * g, h, i --> i, f, c
         * 
         */
        // Step-1: Swap ith row, column as {g, c}, {h, f}
        for (int col = n - 1; col >= 0; col--) {
            for (int row = 0; row < col; row++) {
                // Swap {row, col} with {col, row}
                int temp = arr[row][col];
                arr[row][col] = arr[col][row];
                arr[col][row] = temp;
            }
        }
        // Step-2: Reverse each row
        for(int row = 0; row < n; row++){
            reverse(arr[row]);
        }

        System.out.println("Your Output is :");
        array_printer(arr);


    }

    public static void array_printer(int arr[][]) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[0].length; j++) {
                System.out.print(arr[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static void reverse(int arr[]){
        int l = 0, r = arr.length - 1;
        while(r >= l){
            int temp = arr[r];
            arr[r] = arr[l];
            arr[l] = temp;
            r--;
            l++;
        }
    }

    public static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }

        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;

    }

    public static void main(String[] args) {
        int[][][] problemI_testcases = {
                {
                        { 1, 2, 3 },
                        { 4, 5, 6 },
                        { 7, 8, 9 }
                },
                {
                        { 4, 6 },
                        { 7, 8 }
                },
                {
                        { 1 }
                },
                {
                        { 13 }
                }
        };
        for (int[][] tc : problemI_testcases) {
            problemI(tc);
        }
    }
}
```