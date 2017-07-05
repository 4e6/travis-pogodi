# travis-pogodi

An alternative implementation of `travis_wait` script.
To surpass Travis no-output timeout `travis-pogodi` regularly prints message to stdout.
Unlike `travis_wait` it doesn't block output of the command.

```
travis-pogodi -- ls -l
```
