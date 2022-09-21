# Description

Given the position of two queens on a chess board, indicate whether or not they are positioned so that they can attack each other.

In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal.

A chessboard can be represented by an 8 by 8 array.

So if you are told the white queen is at (zero-indexed) row 4, column 2 and the black queen at (zero-indexed) row 1, column 5 then you know that the set-up is like so:

```text
  0 1 2 3 4 5 6 7
7 _ _ _ _ _ _ _ _ 7
6 _ _ _ _ _ _ _ _ 6
5 _ _ _ _ _ _ _ _ 5
4 _ _ W _ _ _ _ _ 4
3 _ _ _ _ _ _ _ _ 3
2 _ _ _ _ _ _ _ _ 2
1 _ _ _ _ _ B _ _ 1
0 _ _ _ _ _ _ _ _ 0
  0 1 2 3 4 5 6 7
```

You are also be able to answer whether the queens can attack each other.
In this case, that answer would be yes, they can, because both pieces share a diagonal.
