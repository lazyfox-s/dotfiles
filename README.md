# dotfiles

> [!WARNING]
> 本リポジトリの設定は日本語環境（`ja_JP.UTF-8` / 東アジアの曖昧幅文字: East Asian Ambiguous Width）を前提としています。非日本語ロケールや設定の異なるターミナル環境では、文字幅やアイコンの扱いによりプロンプトやステータスライン等の表示レイアウトが崩れる可能性があります。
>
> The configurations in this repository assume a Japanese locale environment (`ja_JP.UTF-8` / East Asian Ambiguous Width). In non-Japanese locales or terminals with different character width handling, prompts, status lines, and icons may be misaligned or broken due to ambiguous character width differences.

---

## 🚀 Quick Start

```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply lazyfox-s
```

> [!NOTE]
> 初回適用時に Git のユーザー名・メールアドレスの入力を求められます。

---

## 💻 Environment

- **OS**:
  - Linux (Manjaro Linux)
  - Windows (WSL / WSL2)
- **Locale**: 日本語環境 (`ja_JP.UTF-8`)

---

## 🛠️ Tools

- [Neovim](https://neovim.io/) (`nvim`)
- [Fish](https://fishshell.com/) (`fish`)
- [Starship](https://starship.rs/)
- [Zellij](https://zellij.dev/)
- [kitty](https://sw.kovidgoyal.net/kitty/)

---

## 🔤 Fonts

- [UDEV-Gothic_NF](https://github.com/yuru7/udev-gothic) (UDEV Gothic Nerd Fonts)
- Linux 環境では chezmoi apply 時にインストールスクリプトが実行され、`~/.local/share/fonts` に配置されます。
- Windows / WSL 環境では、ホスト側のターミナル（kitty や Windows Terminal など）にも `UDEV Gothic NF` をインストール・適用してください。

---

## 📁 Optional Directories

- `~/.local/share/agent-memory`: AIエージェントがナレッジやログを記録/参照するためのディレクトリ
- `~/Documents/howm`: Obsidian の Vault (`Obsidian.nvim` で使用)

## 📜 Commit Guidelines

```text
<emoji> <type>(<scope>): <subject>
```

[COMMIT_CONVENTION.md](./COMMIT_CONVENTION.md)
