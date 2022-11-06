# Project-Romanizer
Simple conversions between arabic and roman numerals in multiple programing languages.

- [Project-Romanizer](#project-romanizer)
  - [Description](#description)
  - [Roman numeral system](#roman-numeral-system)
    - [Subtractive notation](#subtractive-notation)
    - [Large values](#large-values)
    - [Zero values](#zero-values)
    - [Fractions](#fractions)

## Description
The problem of converting different numbers between their representatiosn in aribic and roman numerals is a common test for developing programers. As someone who enjoys the use of roman numerals in certain situations I find this challenge appealing to me compared to the other popular introdultory challenges. I have decided reciently to begin expanding my familiarity with new languages and so I will attempt to reproduce the solutions in various selected languages. The gial is not for this to be a comprehensive list of all possible programing enviornments, or the most computationally efficient method of implementing the program in any particular situation. It is a simple method of exploring the languages given.

## Roman numeral system
The roman numeral system is a base 10 number system which divides each significant figure into two domains, with a symbol denoting the upper and lower halves of the domain. For relatively small values these domains are denoted as:

|domain: | ones | tens | hundreds | thousands | ten-thousands | hundred-thousands |
|--------|:----:|:----:|:--------:|:---------:|:-------------:|:-----------------:|
|base    |  I   |  X   |    C     |    ↀ     |       ↂ      |        ↈ         |
|upper   |  V   |  L   |    D     |    ↁ     |        ↇ       |                   |

For each domain these symbols would be used as a tally to show the value of each decimal place of the number.
</br>
For example: the number 62 has a tenths place of 60 which is the 1<sup>st</sup> place in the upper half of the tens domain so the tenths place is written as *LX*, the ones place is 2<sup>nd</sup> in the lower half of the ones domain so the ones place is written *II*, taken together the whole number is written *LXII*.

### Subtractive notation
Of course roman numerals were made up by humans, and so there are deviations and irregularities to be found. The first of these is the issue of subtractive abbreviations for certain values which would otherwise require 4 consecutive iterations of a symbol, these abbreviations are as follows:

| value  | 4  | 9  | 40 | 90  | 400 | 900 |
|--------|----|----|----|-----|-----|-----|
| symbol | IV | IX | XL | XC  | CD  | Cↀ |

Each of these compositions can be written as "*a* before *b*", so in the case of 90 the symbol *XC* is read as "10 before 100".

### Large values
I am choosing to a system of large values based on the *apostrophus* system which was in use during the roman empire, this system does not include values passed 100,000 in value as this would have been used as a shorthand way to communicate simply the idea of "*very big number*". Other than the aesthetic element this means that I will be forcing myself to include non-ASCII standard unicode characters in the various implementations of the project.

### Zero values
So far as I can tell there are two conventions for representing the quantity 0 in the roman system, this first of these which appears to be contemporary to the roman era is the use the full latin word *"nulla"* literally meaning none to represent the value. A more contemporary choice is to use the character *Z* instead following the convention of the apothecaries' system of weights and measures which is based on roman standards of measurement. I will choose to use the apothecaries' notation as it restricts as many digits as possible to a single character. If this choice should change in the future the implementations should be able to accommodate the change.

### Fractions
The roman decimal system is duodecimal and divides the domain into a lower and upper domain just like the higher digits. In this case the upper symbol is *S* denoting the value of 1/2, with patterns of dots used as the base of the range. These patterns are as follows:

| fraction: | 1/12 | 1/6 | 1/4 | 1/3 | 5/12 |
|-----------|:----:|:---:|:---:|:---:|:----:|
| pattern:  |  ·   |  :  |  ∴  |  ∷  |  ⁙   |
