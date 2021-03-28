# mkinitcpio-msg

> Display a message in early boot


## Installation

Run `make install` and add `msg` to `HOOKS` in `/etc/mkinitcpio.conf`.

Then edit `/etc/mkinitcpio-msg` to set your custom message.

Don't forget to run `mkinitcpio -P` to regenerate all your initial ramdisks.

Arch users can also find this hack in the AUR as [mkinitcpio-msg-git].


## Usage

If you're familiar with `/etc/issue`, then you'll be right at home editing
`/etc/mkinitcpio-msg`.  Since this file is just being cat out to stdout, you
can use standard control sequences and clever hook placement to make some fancy
custom messages.  I'll be showcasing something simple, but the only limit is
that of your imagination!

### Example

What I want to do is place the following message at the top of my screen when
the initial ramdisk is loaded:

```
 _____________________________________
/ I'd just like to interject for a    \
| moment.  What you're refering to as |
| Linux, is in fact, GNU/Linux, or as |
| I've recently taken to calling it,  |
\ GNU plus Linux.                     /
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

To achieve this, I'll have to do one of two things, firstly in
`/etc/mkinitcpio.conf` I will have to put the `msg` hook immediately after the
`base` hook.  What this will do is load the message immediately after the
initialization of the ramdisk environment.

Secondly I'll have to get rid of the message that says: `:: running early hook
[msg]`. I can do this by clearing the screen with the `[2J` standard control
sequence.

For this to work, the escape code needs to be interpreted correctly and not
literally, so editing `/etc/mkinitcpio-msg` with a standard text editor won't
work.  One way of circumventing this is by using the `echo` command.  I could
then store my message in a temporary file called `msg` and run the following:

```sh
echo -n -e "\e[2J" > /etc/mkinitcpio-msg
cat msg >> /etc/mkinitcpio-msg
mkinitcpio -P
```

The output on the screen will then look something like this:

```
 _____________________________________
/ I'd just like to interject for a    \
| moment.  What you're refering to as |
| Linux, is in fact, GNU/Linux, or as |
| I've recently taken to calling it,  |
\ GNU plus Linux.                     /
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
:: running early hook [udev]
Starting version XXX.Y-Z-arch
:: running hook [udev]
:: Triggering uevents..
:: running hook [keymap]
:: Loading keymap...done.
:: running hook [encrypt]

...
```


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
[mkinitcpio-msg-git]: https://aur.archlinux.org/packages/mkinitcpio-msg-git
