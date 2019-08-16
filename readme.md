# Dotfiles

## Setup
Install resources and applications

```sh
$ sudo softwareupdate -i -r
$ sh install.sh
$ sh os.sh
```

Tell Git who you are.
> I prefer doing it in a separate gitlocal file, which is included in my gitconfig.

```
$ git config -f ~/.gitlocal user.email "{Your email}"
$ git config -f ~/.gitlocal user.name "{Your name}"
```