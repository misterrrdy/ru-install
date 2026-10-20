#!/bin/bash
# Установка RuSwitcher и Govori. Одной командой.
set -e

PACK_URL="https://github.com/misterrrdy/ru-install/releases/latest/download/install-pack.zip"
DEST="$HOME/Установка_программ"

echo "==> 1/3 Ставлю OpenCode 1.18.25..."
curl -fsSL https://opencode.ai/install | bash
export PATH="$HOME/.opencode/bin:$HOME/.local/bin:$PATH"

echo "==> 2/3 Скачиваю программы..."
mkdir -p "$DEST"
cd "$DEST"
curl -fsSL "$PACK_URL" -o pack.zip
unzip -o -q pack.zip
rm -f pack.zip

echo "==> 3/3 Ставлю и запускаю OpenCode (модель Big Pickle)..."

opencode --auto --dir "$DEST" \
"Прочитай файл SETUP_BY_OPENCODE.md в этой папке и выполни всё, что в нём написано.
Я не программист. Делай всё сам: скопируй программы в /Applications, сними карантин,
запусти их. Где нужно нажать кнопку или включить переключатель в настройках macOS,
просто скажи мне, что именно нажать."
