# trim

Read from stdin and remove a prefix from each line.

trim is a tool for removing prefixes from blocks of text. It reads
from stdin and proceeds to remove the passed prefix from each line.
If the prefix argument is omited it defaults to `#`.

Installation
------------

Download the [latest release][releases] or check the available
[packages][packages]. You can also compile the source code in the
master branch.

[releases]: https://github.com/soveran/trim/releases
[packages]: https://github.com/soveran/trim/wiki/Distribution-Packages

Install trim into `/usr/local/bin` with the following command:

    $ make install

You can use `make PREFIX=/some/other/directory install` if you wish
to use a different destination. If you want to remove trim from
your system, use `make uninstall`.

### Examples

```
$ cat foo.rb
  # def foo
  #   puts "foo"
  # end

$ cat foo.rb | trim
  def foo
    puts "foo"
  end

$ cat bar.lua
  -- local function foo()
  --   print("foo")
  -- end

$ cat bar.lua | trim --
  local function foo()
    print("foo")
  end
```

If you use vis, you can select a block of text and run this command:

```
:|trim
```

You can also pass a string to use for the comment:

```
:|trim --
```

Usage is similar with vim:

```
:'<,'>!trim
```

As vim gives a special meaning to some characters, you may have to
escape them:

```
:'<,'>!trim \e%
```

Contributing
------------

If you find a bug, please create an issue detailing the ways to
reproduce it. If you have a suggestion, create an issue detailing
the use case.
