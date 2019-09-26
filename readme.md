# CSV Normalizer

## Built with

* Ruby

## Development Process

* [1. Initial Research](#1-initial-planning)
* [2. My approach](#2-my-approach)
* [3. Challenges and Successes!](#3-challenges-and-successes)
* [4. Future Additions](#5-future-additions)


### 1. Initial Research

* Bash: I knew that the code should execute with this command `./normalizer < sample.csv > output.csv`. So I did some research to get familiar with the shell's redirection operators. I created a file called `normalize.rb` and updated its file permissions with `chmod`. I also added the `#!` comment to the top of `normalize.rb` so that you'd be able to run/execute the script from the shell.

* Encodings: Two articles were really helped me gained a better understanding of UTF encodings and the purpose they serve. Those articles were ["What Every Programmer Absolutely, Positively Needs To Know About Encodings And Character Sets To Work With Tex"](http://kunststube.net/encoding/) by David C. Zentgraf and ["How to Detect and Read UTF-8 Characters in Text Strings ..."](https://www.instructables.com/id/Programming--how-to-detect-and-read-UTF-8-charact/) by an unknown author. My main takeaways were that:

    - Unicode defines a table of code points for characters.
    - There are several ways to encode Unicode code points into bits.
    - UTF-8 is one of the ways to encode Unicode code points into bits.

* 

### 2. My approach

* Read the CSV from `$stdin`
* 


### 3. Challenges

There seemed to be a lot of debate on the internet about whether detecting the encoding of a string is possible. This worried me, but then I realized "detecting encoding" wasn't something I needed to do. This exercise says I can assume that the input document is in UTF-8. My task is to handle/work-around invalid UTF-8 characters.


### 4. Future Additions


## Instructions for running script on mac

1. Open a terminal window and clone this repository.
2. Once that's successfully done, you can navigate to the projects directory on your local machine.
3. Run the following console command: `chmod +x normalize.rb`. This command updates the permissions of the `normalize.rb` file so that you have the power to run the code in the file.
4. Finally, you can run `./normalizer < sample.csv > output.csv` to test this code.
