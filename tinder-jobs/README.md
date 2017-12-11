# README

# Jbbr
> It's dating for jobs

Jbbr allows job applicants and employers to remain anonymous throughout the job matching process, diminishing the effects of implicit bias and allowing jobs to be filled the way they should be filled: on merit alone.

## Installing / Getting started

Jbbr is built in Rails with a Bootstrap front-end. First, ensure you have Ruby 2.3.3+ and Rails 5.1.4+ and up installed on your machine. Then run the following commands:

```shell
git clone git@github.com:christofer198/tinderjobs.git
bundle install # ensures dependencies
rails db:migrate # initializes the database
rails db:seed # seeds the database
rails s # launches server
```

Then you can go to localhost:3000 on your browser to see the home page!

## Developing

To develop on the project, run the same steps as above and simply push up to your fork using git.

```shell
git add .
git commit -am "my first commit"
git push
```

You've now added to your fork of the repository!

## Features

What can you do with Jbbr?
* There is a login/logout page for keeping track of user sessions
* As an applicant (default view), you can "swipe" through jobs that are posted, filtered by industry and zip code
* You can also create new or join an existing company, and post jobs on that company's behalf. If there are applications that come in, you can begin swiping applicants.
* In both cases, you can view your matches on the match page!

## Contributing

If you'd like to contribute, please fork the repository and use a feature
branch. Send us some pull requests!

## Licensing

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
