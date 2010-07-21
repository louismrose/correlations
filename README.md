## Correlations

Generates a value indicating the correlation between the words in a list of phrases.

For example, given the following phrases and their frequencies:

    448 of the
    241 in the
    152 Sir Henry

And the following word frequencies:

    3408 the
    1655 of
    929 in
    350 sir
    156 henry
    
Correlations will generate the following values:

    3.99 of the
    3.82 in the
    139.77 Sir Henry 

## Installation

Assuming that git and ruby are installed, correlations can be installed by cloning this git repository:

    git clone git://github.com/louismrose/correlations.git

If you're behind a firewall, you may need to use HTTP:

    git clone http://github.com/louismrose/correlations.git

## Usage

From within the correlations directory, the script is invoked using:

    ./correlations.sh phrases.txt words.txt
    
This assumes two text files called phrases.txt and words.txt in the correlations directory, and prints the correlations to STDOUT. Each line of phrases.txt and words.txt must contain a frequency (number) followed by a phrase / word (string). See above for exemplar phrases and words.

## Thresholds

Passing a threshold argument causes the script to ignore phrases that contain a word with a frequency less than the threshold:

    ./correlations.sh -threshold 5 phrases.txt words.txt
    
The above command will ignore all phrases containing words that occur less than 5 times (according to words.txt)

Copyright &copy; 2010 [Louis Rose](http://www.cs.york.ac.uk/~louis), released under the MIT license