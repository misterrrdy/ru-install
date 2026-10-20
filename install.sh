#!/bin/bash
set -e

PACK_URL="https://github.com/misterrrdy/ru-install/releases/latest/download/install-pack.zip"
DEST="$HOME/Установка_программ"

echo "==> Скачиваю программы..."
mkdir -p "$DEST"
cd "$DEST"
curl -fsSL "$PACK_URL" -o pack.zip
unzip -o -q pack.zip
rm -f pack.zip

echo "==> Ставлю RuSwitcher..."
rm -rf /Applications/RuSwitcher.app
ditto "$DEST/RuSwitcher.app" /Applications/RuSwitcher.app
xattr -dr com.apple.quarantine /Applications/RuSwitcher.app

echo "==> Ставлю Govori..."
rm -rf /Applications/Govori.app
ditto "$DEST/Govori.app" /Applications/Govori.app
xattr -dr com.apple.quarantine /Applications/Govori.app

open /Applications/RuSwitcher.app
open /Applications/Govori.app

echo ""
echo "======================================================"
echo "  ПРОГРАММЫ УСТАНОВЛЕНЫ"
echo "======================================================"
echo ""
echo "Теперь нужно разрешить им доступ. По очереди:"
echo ""
echo "1) RuSwitcher — значок клавиатуры сверху справа."
echo "   Системные настройки -> Конфиденциальность"
echo "   -> Универсальный доступ -> включить RuSwitcher."
echo ""
echo "2) Govori — значок микрофона сверху справа."
echo "   Системные настройки -> Конфиденциальность"
echo "   -> включить: Микрофон, Универсальный доступ,"
echo "      Мониторинг ввода."
echo "   Затем в окне Govori: вкладка Подключение —"
echo "   вставь сервер и токен (их даст владелец)."
echo ""
echo "Подробнее — в файлах INSTALL_*.md в папке:"
echo "$DEST"
echo ""
echo "Готово. Открываю Системные настройки..."
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
