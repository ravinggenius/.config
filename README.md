## Dotfiles et cetera

NOTICE The `./setup.sh` script hasn't been fully tested, as it was developed after the fact. Pull requests are most welcome.


### Usage

```shell
git clone --origin github-ravinggenius git@github.com:ravinggenius/.config.git ~/.config
cd ~/.config
# carefully review setup script. it does not ask first
./setup.sh
```


### Opinions (AKA Facts)

* [git aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases) are better than shell aliases.
* Personal details should not be part of this repository. This presents a small problem when configuring name/email for git. Therefore the setup script prompts for that information and sets [universal](https://fishshell.com/docs/current/index.html#variables) [variables](https://fishshell.com/docs/current/index.html#variables) in Fish.
