#!/usr/bin/env fish
# Command input from nvim to zellij.

set tmpfile (mktemp /tmp/nvim_input.XXXXXX)

# 1. nvim で編集 (シンプルUI + 初期インサートモード)
nvim -c "set nonumber norelativenumber laststatus=0 showtabline=0 signcolumn=no noruler" +startinsert "$tmpfile"

# 2. 編集内容があれば、バックグラウンドで元のペインへ送信
if test -f "$tmpfile" -a -s "$tmpfile"
    # setsid + timeout を使用して独立プロセスとして実行（万が一のハングアップ防止）
    setsid -f timeout 3s fish -c 'sleep 0.15; zellij action write-chars -- (cat "$argv[1]" | string collect) 2>>/tmp/nvim_input_error.log; rm -f "$argv[1]"' "$tmpfile" </dev/null >/dev/null 2>&1
else
    rm -f "$tmpfile"
end

