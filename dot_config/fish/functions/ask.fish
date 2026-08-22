function ask --description 'Generate shell command from natural language using Ollama'
    if test (count $argv) -eq 0
        echo "使用方法: ask <やりたいこと>"
        echo "例: ask カレントディレクトリ以下の .log ファイルをすべて削除"
        return 1
    end

    if not type -q ollama
        set_color red
        echo "エラー: ollama コマンドが見つかりません。" >&2
        set_color normal
        return 1
    end

    set -l query (string join " " $argv)
    set -l system_prompt "あなたはLinuxおよびFishシェルのコマンド生成エキスパートです。ユーザーの要望を満たす実行可能なコマンドを1行のみ出力してください。マークダウンのコードブロック（```など）や解説、挨拶、前置きは一切含めず、コマンド文字列のみを出力してください。"

    # 問い合わせ中表示
    set_color --dim
    echo "問い合わせ中 (qwen2.5-coder:3b)..."
    set_color normal

    # パイプ (stdin) 経由で渡すことでスピナーや制御文字の出力を抑止
    set -l prompt (printf "システム: %s\nユーザー: %s\n" "$system_prompt" "$query")
    set -l raw_output (printf "%s\n" "$prompt" | ollama run qwen2.5-coder:3b 2>/dev/null)
    set -l exit_code $status

    if test $exit_code -ne 0 -o (count $raw_output) -eq 0
        set_color red
        echo "エラー: コマンド生成に失敗しました。Ollama が起動しているか確認してください (例: ollama serve)。" >&2
        set_color normal
        return 1
    end

    # 行ごとに精査し、コードブロックや空行を除外して最初の有効なコマンド行を取得
    set -l cmd ""
    for line in $raw_output
        set -l trimmed (string trim -- $line)

        # 空行、またはフェンス記号（``` 等）のみの行はスキップ
        if test -z "$trimmed"; or string match -q -r '^```' -- $trimmed
            continue
        end

        # 行頭・行末のマークダウン記号やインラインバッククォートを除去
        set -l cleaned (echo "$trimmed" | string replace -r '^```[a-zA-Z]*\s*' '' | string replace -r '\s*```$' '')
        set cmd (string trim -c '`' -- "$cleaned" | string trim)

        if test -n "$cmd"
            break
        end
    end

    if test -z "$cmd"
        set_color red
        echo "エラー: 有効なコマンドを生成できませんでした。" >&2
        set_color normal
        return 1
    end

    # コマンドライン（プロンプト入力行）にセットして再描画
    commandline -r -- "$cmd"
    commandline -f repaint
end
