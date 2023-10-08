//
//  Day_13_Abstract_Class.swift
//  
//
//  Created by SK on 08/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-abstract-classes/problem

/// Task:
/// Given a Book class and a Solution class, write a MyBook class that does the following:
///
/// - Inherits from Book
/// - Has a parameterized constructor taking these  parameters:
///     -   string title
///     -   string author
///     -   int price
///
/// Implements the Book class' abstract display() method so it prints these 3 lines:
///     -   "Title:", a space, and then the current instance's title.
///     -   "Author:", a space, and then the current instance's author.
///     -   "Price:", a space, and then the current instance's price.
///
///Note: Because these classes are being written in the same file, you must not use an access modifier (e.g.: public) when declaring MyBook or your code will not execute.

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;
class Book{
    protected:
        string title;
        string author;
    public:
        Book(string t,string a){
            title=t;
            author=a;
        }
        virtual void display()=0;

};

// Write your MyBook class here
class MyBook : public Book {
    protected:
    int price = 0;
    //   Class Constructor
    //
    //   Parameters:
    //   title - The book's title.
    //   author - The book's author.
    //   price - The book's price.
    //
    // Write your constructor here
    public:
    MyBook(string t, string a, int p): Book(t, a) {
        this->price = p;
    }
    
    //   Function Name: display
    //   Print the title, author, and price in the specified format.
    //
    // Write your method here
    void display() override {
        cout<<"Title: "<<title<<"\n";
        cout<<"Author: "<<author<<"\n";
        cout<<"Price: "<<price<<"\n";
    }
};
// End class

int main() {
    string title,author;
    int price;
    getline(cin,title);
    getline(cin,author);
    cin>>price;
    MyBook novel(title,author,price);
    novel.display();
    return 0;
}
