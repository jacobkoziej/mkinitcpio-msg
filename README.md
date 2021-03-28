# mkinitcpio-msg

> Display a message in early boot


## Installation

Run `make install` and add `msg` to `HOOKS` in `/etc/mkinitcpio.conf`.

Then edit `/etc/mkinitcpio-msg` to set your custom message.


## Inspiration

I was growing tired of keeping a post-it note on my laptop with my contact
information.  One day I thought to myself if it would be possible to display
this information when loading the initial ramdisk environment.  I managed to
stumble upon [mkinitcpio-bootmsg] and [mkinitcpio-bootmsg] while browsing the
AUR, but neither functioned the way I would have liked, so I just decided to
hack together my own implementation of this simple task.


## Copyright & Licensing

Copyright (C) 2021  Jacob Koziej <jacobkoziej@gmail.com>

Distributed under the [GPLv3].


[GPLv3]: LICENSE.md
[mkinitcpio-archlogo]: https://github.com/eworm-de/mkinitcpio-archlogo
[mkinitcpio-bootmsg]: https://github.com/ntruessel/mkinitcpio-bootmsg
