# dotfiles

## vim & tmux
### Italic font
based on [gutoyr/tmux_italic.md](https://gist.github.com/gutoyr/4192af1aced7a1b555df06bd3781a722)

1. Check:
```
echo -e "\e[3mitalic\e[23m"
infocmp $TERM | grep sitm
infocmp $TERM | grep ritm
```

2. Settings:
```
tic screen-256color.terminfo
export TERM=screen-256color
```

3. Add to .vimrc:
```
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
```

## link.sh

    $ chmod +x link.sh
    $ ./link.sh


