#Hiresly

####Version 2.0, November, 15, 2015
By Austin Kincaid

###Description
A web platform where Software Developers and employers meet.

Employers can view Software Developers and see how they work on real problems. The same employers can send custom tests to Developers for a more personalized display of abilities.

Developers get the chance to prove their abilities and maintain an active and working portfolio. Ultimately, these developers are invited for interviews and businesses grow with proven talent.
[Visit Here](https://hiresly.herokuapp.com/)

_Goals for future updates_
* _Implement pre-seeded tests for new Developers to take_
* _Implement an 'interests' feature to allow favoriting developers within a 'role envelope'_
* _Implement behavior for problem difficulty_
* _Deliver list of developers through pagination instead of all at once_
* _Deliver all lists with pagination to reduce page overload_

###Setup
1. Clone the repo
2. To bundle the gems, type `bundle` into the terminal
3. To launch Postgres, type `postgres` into the terminal
4. To create the database, type `rake db:create` into the terminal
5. To create the tables in the database, type `rake db:migrate` into the terminal
6. Launch server by typing `rails s` into the terminal and going to `localhost:3000` in your browser

###Technologies Used
This app uses Ruby on Rails, Postgres, and ActiveRecord. Test tools are RSpec, Capybara, and Poltergeist.

###Legal

Copyright (c) 2015 Austin Kincaid

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
