kitty + complete setup fish | source
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval (eval /home/hwatson/anaconda3/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<
set -gx PATH ~/go/bin ~/.npm/bin ~/anaconda3/bin ~/anaconda3/condabin ~/.nimble/bin ~/.fzf/bin /usr/local/go/bin $PATH  # commented out by conda initialize  # commented out by conda initialize
set -g theme_display_date no
activate base
