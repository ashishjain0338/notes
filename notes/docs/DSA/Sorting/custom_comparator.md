---
sidebar_position: 2
---

# Custom Sorting Fxn


## Syntax
```cpp
bool comp(data_type a, data_type b){
    /*
        Question: Should a come before b
        OR
        Is ordering 'ab' good,
        If so, return true else false
    */
}
```

Refer the code below for more info:
```cpp
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

class Person
{
public:
    string name;
    int age = 0;

    Person(string name, int age)
    {
        this->name = name;
        this->age = age;
    }

    string to_string()
    {
        return "Person(name=" + name + ", age=" + std::to_string(age) + ")";
    }
};

bool comp(Person a, Person b)
{
    /*
        Answer the question:
        Should a come before b,
        is ab good or not?
    */
    if (a.age < b.age)
        return true;
    return false;
}

int main()
{
    vector<int> testcase{3, 2, 9, 7, 3, 2, 1};
    vector<vector<int>> testcases{
        {3, 2, 9, 7, 8},
        {101, 4, 2, 6, 98, -1, 0, 56}};

    for (int tc_index = 0; tc_index < testcases.size(); tc_index++)
    {
        vector<int> tc = testcases[tc_index];
        vector<Person> input;
        cout << "Testcase-" << tc_index + 1 << endl;
        for (int i = 0; i < tc.size(); i++)
        {
            input.push_back(Person("p" + std::to_string(i + 1), tc[i]));
        }
        sort(input.begin(), input.end(), comp);

        for (Person p : input)
        {
            // cout<<p.to_string()<<", ";
            cout << p.age << ", ";
        }
        cout << endl;
    }

    return 0;
}
```