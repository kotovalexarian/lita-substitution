Lita::Handlers::Substitution
============================

[![Gem Version](https://badge.fury.io/rb/lita-substitution.svg)](http://badge.fury.io/rb/lita-substitution)
[![Build Status](https://travis-ci.org/braiden-vasco/lita-substitution.svg)](https://travis-ci.org/braiden-vasco/lita-substitution)
[![Coverage Status](https://coveralls.io/repos/braiden-vasco/lita-substitution/badge.svg)](https://coveralls.io/r/braiden-vasco/lita-substitution)

Shell-like command substitution for the [Lita](http://lita.io) chat bot.

Allows you to use the output of commands as arguments to another command.
Hypothetical example:

```
You: lita hello
Lita: Hello, World!
You: lita upcase qwerty
Lita: QWERTY
You: lita upcase $(hello)
Lita: HELLO, WORLD!
```

You can get the most power by using it with
[lita-key-value](https://github.com/jimmycuadra/lita-key-value):

```
You: lita kv set text $(get some text)
Lita: Set text to Here is some text.
You: lita upcase $(kv get text)
Lita: HERE IS SOME TEXT.
```

Usage
-----

At first, see the documentation for Lita: http://docs.lita.io/

### Installation

Add **lita-substitution** to your Lita instance's Gemfile:

```ruby
gem 'lita-substitution', '~> 0.1.0'
```
