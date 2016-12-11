# 7

A stack based programming language with AOT checking

```forth
# =====================================
# Example program
# =====================================

@define double (x -> x) {
  2 *
}

10 20 double

swap print

40 50 double print swap print
```

## Features

* Functional Combinators (Joy)
* Stack language
* Type system
* AOT Checking

# Goals

* A powerful language with a simple conceptual model (ala LISP)
* Practical (good support for IO operations on files, sockets, HTTP etc)
* Implement a type checking algorithm

# Theory

### Type Checking

Seven aims to introduce a type system to a forth/joy like stack language.

### Language Primatives

* Lists
* Strings
* Numbers
* Procedures
* Variables
