# CSV Normalizer

## Built with

* I used Ruby since I'm most comfortable with that programming language.

## Development Process

* [1. Initial Research](#1-initial-planning)
* [2. My approach](#2-my-approach)
* [3. Challenges and Successes](#3-challenges-and-successes)
* [4. Future Additions](#4-future-additions)
* [5. How to run this script](#5-how-to-run-this-script)

### 1. Initial Research

* Bash: I knew that the code should execute with this command `./normalizer < sample.csv > output.csv`. So I did some research to get familiar with the shell's redirection operators. I created a file called `normalize.rb` and updated its file permissions with `chmod`. I also added the `#!` comment to the top of `normalize.rb` file so that you'd be able to run/execute the script from the shell.

* Encodings: Two articles really helped me gain a better understanding of UTF encodings and the purpose they serve. Those articles were ["What Every Programmer Absolutely, Positively Needs To Know About Encodings And Character Sets To Work With Tex"](http://kunststube.net/encoding/) by David C. Zentgraf and ["How to Detect and Read UTF-8 Characters in Text Strings ..."](https://www.instructables.com/id/Programming--how-to-detect-and-read-UTF-8-charact/) by an unknown author. My main takeaways were that:

    - Unicode defines a table of code points for characters.
    - There are several ways to encode Unicode code points into bits.
    - UTF-8 is one of the ways to encode Unicode code points into bits.

### 2. My approach

* Read data from `$stdin`.
* Put data into a csv.
* Loop over the data: checking that the string is valid UTF-8 and performing the required changes on the string.
* Generate a new CSV with the valid UTF-8 and normalized content.


### 3. Challenges and Successes

There seemed to be a lot of debate on the internet about whether detecting the encoding of a string is possible. This worried me, but then I realized "detecting encoding" wasn't something I needed to do. This exercise says I can assume that the input document is in UTF-8. My task is to handle/work-around invalid UTF-8 characters.

I kept running into an `invalid byte sequence in UTF-8 (ArgumentError)` error when I tried to work with the data from `$stdin`. I was able to bypass that error using a solution I found [online](https://github.com/mikel/mail/commit/6d2bb257cab9b508af51b62b8bb496c9a7c7f37b). I forced the data from `$stdin` to binary encoding. After that change I was able to loop over the data.

### 4. Future Additions

I haven't figured this out yet, but based on the exercise prompt, my guess is that enforcing encoding isn't a necesary step. With more time, I'd continue to research ways to avoid that. I'd also figure out a way to print a warning to stderr and drop the row from output when an unparseable string is found.

### 5. How to run this script

These instructions assume you're on a mac. Also note that this script uses Ruby 2.6.

1. Open a terminal window and clone this repository.
2. Once that's successfully done, you can navigate to the projects directory on your local machine.
3. Run the following command: `chmod +x normalize.rb`. This command updates the permissions of the `normalize.rb` file so that you have the power to run the code in the file.
4. Install dependencies with `bundle install`
5. Finally, you can run `./normalizer.rb < sample.csv > output.csv` to test this code. You can run all tests with `bundle exec rspec`.
