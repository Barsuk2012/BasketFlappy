# Загрузка проекта в твой репозиторий Barsuk2012/OrbJump

Репозиторий уже создан и пуст — это самый удобный случай, ничего чистить не надо.

---

## Способ 1 — в один клик (рекомендую)

1. Скачай папку `hoopflight` (или архив `hoopflight.zip`) и распакуй, например, в
   `C:\Users\ИМЯ\Documents\hoopflight`
2. Убедись, что установлен Git: https://git-scm.com/download/win (обычная установка, все «Далее»).
3. Зайди в папку проекта и запусти двойным кликом **`ЗАГРУЗИТЬ_НА_GITHUB.bat`**
4. Скрипт спросит:
   - имя и почту (только в самый первый раз — это подпись под коммитами);
   - что сохраняем — можно просто нажать Enter.
5. Откроется окно входа GitHub → **Sign in with your browser** → войди под `Barsuk2012`.
6. В конце увидишь «ГОТОВО». Открывай https://github.com/Barsuk2012/OrbJump — файлы там.

Дальше после **каждой** правки игры просто запускай этот же `.bat` ещё раз и пиши,
что изменил. Это и есть твоя резервная копия и история версий.

---

## Способ 2 — руками, если хочется понимать

Открой папку проекта, в адресной строке проводника напиши `cmd`, нажми Enter и вставь по строкам:

```bat
git config --global user.name "Barsuk"
git config --global user.email "почта@от.гитхаба"

git init
git add .
git commit -m "Первая версия Hoop Flight"
git branch -M main
git remote add origin https://github.com/Barsuk2012/OrbJump.git
git push -u origin main
```

Каждый следующий раз хватит трёх команд:

```bat
git add .
git commit -m "коротко что сделал"
git push
```

---

## Способ 3 — GitHub Desktop, вообще без консоли

1. Установи https://desktop.github.com и войди под `Barsuk2012`.
2. **File → Add local repository** → выбери папку проекта → «create a repository» → **Create**.
3. Внизу слева впиши Summary → **Commit to main**.
4. Вверху **Publish repository** → сними галочку «Keep this code private», если хочешь публичный →
   в поле Name напиши `OrbJump` → **Publish**.

---

## Если push ругается

| Сообщение | Что делать |
|---|---|
| `Authentication failed` | не вошёл в аккаунт. Запусти `.bat` заново и войди через браузер |
| `Updates were rejected` / `fetch first` | в репозитории уже что-то есть. Выполни `git pull --rebase origin main`, потом снова push |
| `remote origin already exists` | `git remote set-url origin https://github.com/Barsuk2012/OrbJump.git` |
| Просит логин и пароль в консоли | пароль от сайта не подойдёт. Нужен GitHub Desktop или токен: GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic) → Generate new token → права `repo` |
| Залил случайно лишнее | `.gitignore` уже настроен: папка `.godot/`, ключи `.keystore`, готовые `.apk` не попадают в репозиторий |

---

## Мелочь про название

Репозиторий называется **OrbJump**, а игра внутри — **Hoop Flight**. Это никак не мешает,
GitHub на название проекта не смотрит. Но если хочешь единое имя, скажи — переименую игру
в OrbJump везде: в `project.godot`, в заголовке меню, в README и в имени APK.
