[![Made By Teamed.io](http://img.teamed.io/btn.svg)](http://www.teamed.io)
[![DevOps By Rultor.com](http://www.rultor.com/b/yegor256/rultor-remote)](http://www.rultor.com/p/yegor256/rultor-remote)

[![Build Status](https://travis-ci.org/yegor256/rultor-remote.svg)](https://travis-ci.org/yegor256/rultor-remote)
[![Gem Version](https://badge.fury.io/rb/rultor.svg)](http://badge.fury.io/rb/rultor)
[![Dependency Status](https://gemnasium.com/yegor256/rultor-remote.svg)](https://gemnasium.com/yegor256/rultor-remote)
[![Code Climate](http://img.shields.io/codeclimate/github/yegor256/rultor-remote.svg)](https://codeclimate.com/github/yegor256/rultor-remote)
[![Coverage Status](https://img.shields.io/coveralls/yegor256/rultor-remote.svg)](https://coveralls.io/r/yegor256/rultor-remote)

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
[bcrypt](http://bcrypt.sourceforge.net/) installed on your machine.
