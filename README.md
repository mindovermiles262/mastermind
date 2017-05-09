# Mastermind
Mastermind is a code-breaking game invented in the 1970's by Mordecai Meirowitz.  The game is played using a decoding board, six different colored code pegs, and two different colored key pegs.  The CODEBREAKER tries to guess the pattern of the master code. After each guess one color of key is used to identify the number of pegs in the correct position and color. The other color of key peg is used to identify a peg that is the correct color, but not in the correct position. CODEBREAKER gets 12 tries to decode the secret code before losing the game.

Written for [The Odin Project's](http://www.theodinproject.com) Ruby course. More information [here](http://www.theodinproject.com/courses/ruby-programming/lessons/oop)

## Use
To use this program, download `mastermind.rb` file, then run in terminal via `ruby mastermind.rb`

Alternativly you may run this program using the included Sinatra framework by `bundle install` then `ruby app.rb` and navigating to `localhost:4567`

## Requirements
* Sinatra v2.0
* Sinatra-Contrib v2.0

## Development Languages
* Ruby v2.3

## TODO
1. ~~Add play again?~ Completed 02/27/2017
2. ~~Fix indexing. When master code = 1122 and guess = 1221, should be: 2 correct, 2 out of position.  (Indexing finds first instance of guess)~~ Completed 02/27/2017
3. ~~Include CSS Styling~~
4. ~~Add Correct answer to Game Over Screen~~
5. ~~Render partials for header and footer~~
6. Deploy to Heroku

## Contributing
Please follow a "fork-and-pull" workflow when Contributing

1. Fork the repo on GitHub
2. Clone the project to your own machine
3. Commit changes to your own branch
4. Push your work back up to your fork
5. Submit a Pull request so that we can review your changes

## Copyright Notice
Copyright 2017 Andy Duss

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
