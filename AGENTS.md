# Agent Guidelines for dotfiles (chezmoi)

本リポジトリは chezmoi で管理されている dotfiles プロジェクトです。
Antigravity は本リポジトリ内で作業を行う際、以下のガイドラインおよび制約を遵守してください。

## 1. 環境・前提条件
- **OS**: Linux (Manjaro Linux) / Windows (WSL2)
- **Locale**: 日本語環境 (`ja_JP.UTF-8` / 東アジアの曖昧幅文字: East Asian Ambiguous Width 前提)
- **主要ツール構成**:
  - Neovim (`dot_config/nvim`): `lazy.nvim` によるプラグイン管理
  - Fish (`dot_config/fish`): メインシェル
  - Starship (`dot_config/starship.toml`): プロンプト設定
  - Zellij (`dot_config/zellij`): ターミナルマルチプレクサ
  - kitty (`dot_config/kitty`): ターミナルエミュレータ
- **フォント**: UDEV Gothic NF (`UDEV-Gothic_NF`)

## 2. chezmoi 運用のルール
- **ファイル編集**: 設定変更時は `$HOME` 直下のファイルを直接編集せず、必ず本リポジトリ内の対応するファイルを編集すること。
- **ファイル命名規約**:
  - `dot_` プレフィックスが付いたファイル/ディレクトリは `$HOME/.<名前>` に展開される（例: `dot_config/nvim` → `~/.config/nvim`）。
  - `.tmpl` が付いているファイルは Go テンプレート構文が含まれているため、テンプレート変数や OS 分岐条件を壊さないよう注意すること。
- **セットアップスクリプト**: `run_once_install_*.cmd.tmpl` などを変更・追加する際は、OS 判定（Linux / WSL / Windows）および実行権限に留意すること。

## 3. コミットメッセージ規約
コミットメッセージを作成・提案する際は、必ず [COMMIT_CONVENTION.md](./COMMIT_CONVENTION.md) のフォーマットに従ってください。

```text
<emoji> <type>(<scope>): <subject>
```

### Type & Emoji 対応表
| 絵文字 | Type | 用途 |
| :---: | :--- | :--- |
| ✨ | `add` | プラグイン、新設定、キーマップ、エイリアス、関数の追加 |
| 🔧 | `change` | 既存の設定値・オプションの変更、キーマップの差し替え |
| 🔥 | `remove` | 不要になった設定、プラグイン、関数の削除 |
| 🐛 | `fix` | エラーの解消、壊れた設定、OS・バージョン差分の修正 |
| ⚡️ | `perf` | 起動高速化、遅延読み込み（lazy load）などのパフォーマンス改善 |
| 🎨 | `style` | カラースキーム、フォント、ステータスライン、プロンプト等の外見 |
| ♻️ | `refactor` | 設定ファイルの分割・モジュール化・整理（挙動は変えない） |
| ⬆️ | `update` | プラグインやパッケージのバージョン・`lazy-lock.json` 更新 |
| 📦 | `setup` | chezmoi 設定、インストールスクリプト、`Brewfile` 等の変更 |
| 📝 | `docs` | README やドキュメント類の追加・修正 |

### Scope ルール
- 対象のツール名やカテゴリを小文字で指定する（例: `nvim`, `fish`, `kitty`, `starship`, `chezmoi`, `brew` など）。
- リポジトリ全体に関わる変更やスコープが自明でない場合はスコープを省略可（例: `📦 setup: ...`）。

## 4. 各ツールの設定方針・注意事項
- **Neovim (`dot_config/nvim`)**:
  - プラグイン追加時は `lazy.nvim` の作法に従い、可能な限り遅延読み込み（`event`, `cmd`, `ft`, `keys` 等）を設定して高速な起動を維持すること。
  - プラグイン更新時は `lazy-lock.json` の変更差分に注意すること。
- **Fish (`dot_config/fish`)**:
  - 外部コマンド呼び出しのオーバーヘッドを意識し、シェルの高速起動を維持すること。
- **ターミナル・表示系 (`kitty`, `starship`, `zellij`)**:
  - 日本語環境（East Asian Ambiguous Width）における記号・Nerd Fonts アイコンの文字幅やレイアウト崩れに注意すること。
