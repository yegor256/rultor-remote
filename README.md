<img src="http://doc.rultor.com/images/logo.svg" width="64px" height="64px"/>

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![Managed by Zerocracy](https://www.0crat.com/badge/C3SAYRPH9.svg)](https://www.0crat.com/p/C3SAYRPH9)
[![DevOps By Rultor.com](http://www.rultor.com/b/yegor256/rultor-remote)](http://www.rultor.com/p/yegor256/rultor-remote)
[![We recommend RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![Build Status](https://travis-ci.org/yegor256/rultor-remote.svg)](https://travis-ci.org/yegor256/rultor-remote)
[![Build status](https://ci.appveyor.com/api/projects/status/qinkj0i7h6ralg7w?svg=true)](https://ci.appveyor.com/project/yegor256/rultor-remote)
[![PDD status](http://www.0pdd.com/svg?name=yegor256/rultor-remote)](http://www.0pdd.com/p?name=yegor256/rultor-remote)
[![Gem Version](https://badge.fury.io/rb/rultor.svg)](http://badge.fury.io/rb/rultor)
[![Maintainability](https://api.codeclimate.com/v1/badges/12ac6688bb3135a835dc/maintainability)](https://codeclimate.com/github/yegor256/rultor-remote/maintainability)
[![Coverage Status](https://img.shields.io/coveralls/yegor256/rultor-remote.svg)](https://coveralls.io/r/yegor256/rultor-remote)

[![Hits-of-Code](https://hitsofcode.com/github/yegor256/rultor-remote)](https://hitsofcode.com/view/github/yegor256/rultor-remote)
[![Availability at SixNines](https://www.sixnines.io/b/efd7)](https://www.sixnines.io/h/efd7)

Install it first:

```bash
$ gem install rultor
```

Run it locally and read its output:

```bash
$ rultor --help
```

To encrypt one file for Rultor:

```bash
$ rultor encrypt -p yegor256/rultor secret.txt
```

Where `yegor256/rultor` is the name of your Github project and `secret.txt`
is the file you need to encrypt. Result will be saved into `secret.txt.asc`.
Read more about Rultor [`decrypt`](http://doc.rultor.com/reference.html#decrypt)
configuration option.

Make sure you have [gpg](https://www.gnupg.org/documentation/manpage.html) and
[bcrypt](http://bcrypt.sourceforge.net/) installed on your machine
(only Unix or Mac OS at the moment).

## How to contribute?

Fork the repository, make changes, submit a pull request.
We promise to review your changes same day and apply to
the `master` branch, if they look correct.

Please run Rake build before submitting a pull request (make sure you
have [bundler](http://bundler.io/) installed):

```
$ bundle install
$ bundle exec rake
```

Make sure you're using Ruby 2.0+.
