[![Build Status](https://travis-ci.org/macathena/homebrew-moira.svg?branch=master)](https://travis-ci.org/macathena/homebrew-moira)

moira
=====
Finally, the moira clients available for macOS/OS X that isn't meant for cats.

Installation:
```sh
brew tap macathena/moira
brew install moira
```

If you desire to install a copy of moira as-developed by IS&T, located at
[github.mit.edu](https://github.mit.edu/ops/moira), you may do so by tapping and
and:

```sh
brew install moira-dev
```

instead. Either formula will conflict with the other of course, and when
attempting to install one with the other, Homebrew will see the conflict and
not attempt the install with notification.

Users wishing to install `moira-dev` will need to have keys with
[github.mit.edu](https://github.mit.edu/settings/keys).
