# Instructions

Rotational Cipher, also known as [Caesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher). It's one of the simplest and most widely known encryption techniques. It is a type of substitution cipher where each letter in the plaintext is replaced by a letter in a position down the alphabet depending on the value of the key. For example, with a rotation of 3, D would be replaced by A, B would be replaced by E, and so on. The cipher is named after Julius Caesar, who used it in his private correspondences.

## Task

Create an implementation of the Rotational Cipher.

The Caesar cipher is a simple shift cipher that relies on
transposing all the letters in the alphabet using an integer key
between `0` and `26`. Using a key of `0` or `26` will always yield
the same output due to modular arithmetic. The letter is shifted
for as many values as the value of the key.

The general notation for rotational ciphers is `ROT + <key>`.
The most commonly used rotational cipher is `ROT13`.

A `ROT13` on the Latin alphabet would be as follows:

```text
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: nopqrstuvwxyzabcdefghijklm
```

It is stronger than the Atbash cipher because it has 27 possible keys, and 25 usable keys.

Ciphertext is written out in uppercase and in the same formatting as the input including spaces and punctuation.

## Examples

- ROT5  `omg` gives `TRL`
- ROT0  `c` gives `C`
- ROT26 `Cool` gives `COOL`
- ROT13 `The quick brown fox jumps over the lazy dog.` gives `GUR DHVPX OEBJA SBK WHZCF BIRE GUR YNML QBT.`
- ROT13 `Gur dhvpx oebja sbk whzcf bire gur ynml qbt.` gives `THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.`
