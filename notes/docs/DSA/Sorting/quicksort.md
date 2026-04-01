---
sidebar_position: 1
---

# Quicksort

Simple Concept:
1. Take an element KA `pivot`.
2. Move elements less than pivot to the left and greater than to the right or (the opposite for descending order).
3. Now Divide the array in two partitions:
```
    Parition-I: left, pivot - 1
    Parition-II: pivot + 1, right
```
4. Repeat the same for the two partitions

## Complexity

- Time-Complexity: O(nlogn)
- Worst-Case: O(n^2) `When array is already sorted (pivot leads to one parition always empty)`
- Space-Complexity: O(logn) `Stack-size`



## Code

```cpp
#include<iostream>

using namespace std;

void swap(int arr[], int a, int b){
    int tmp = arr[a];
    arr[a] = arr[b];
    arr[b] = tmp;
}

int partition(int arr[], int left, int right){
    // Lets select a pivot
    int pivot = arr[right];
    int good_left_index = left;
    for(int i = left; i < right; i++){
        if(arr[i] < pivot){
            // This point needs to be in left partition
            swap(arr, good_left_index, i);
            good_left_index++;
        }
    }
    // all the elements lesser than pivot exists on index less than 'good_left_index'
    // Move th pivot to the 'good_left_index'
    swap(arr, good_left_index, right);
    return good_left_index;
}

void quick_sort(int arr[], int left, int right){
    if(left < right){
        int p = partition(arr, left, right);
        quick_sort(arr, left, p - 1);
        quick_sort(arr, p + 1, right);
    }
    
}


int main(){
    int test1[10] = {7, 2, 9, 1, 5, 10, 3, 8, 6, 4};
    quick_sort(test1, 0, 9);
    for(auto ele: test1){
        cout<<ele<<", ";
    }
    cout<<endl;
    return 0;
}
```