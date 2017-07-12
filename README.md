# travis-pogodi

[![Build Status](https://travis-ci.org/4e6/travis-pogodi.svg?branch=master)](https://travis-ci.org/4e6/travis-pogodi)


![Wolf](http://img0.liveinternet.ru/images/attach/c/10/127/350/127350084_104456268_02.png)

An alternative implementation of [Travis CI][no-output-timeout] `travis_wait` script.
To surpass Travis no-output timeout `travis-pogodi` regularly prints message to stdout.
Unlike `travis_wait` it doesn't block output of the command it executes.

```
travis-pogodi [OPTIONS] CMD [-- ARGS]

Available options:
  -h,--help                Show this help text
  -m,--message ARG         message printed to
                           stdout (default: Nu, Travis, pogodi!)
  -n,--interval ARG        interval between messages in seconds (default: 600)
```

```
$ travis-pogodi -n1 -- sleep 2
Nu, Travis, pogodi!
```

[no-output-timeout]: https://docs.travis-ci.com/user/common-build-problems/#Build-times-out-because-no-output-was-received
