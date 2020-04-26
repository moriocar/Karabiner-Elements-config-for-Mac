local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      -- hs.timer.usleep(1000)
      -- hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end


-- toggle input source Kana/Eisuu
local function isInputSourceKana()
  return hs.keycodes.currentMethod() == 'Hiragana' -- or 'Romaji'
end

local function handleKana()
   return function()
      local keycode = 104 -- 104: かな, 102: 英数
      if isInputSourceKana() then
         keycode = 102
      end
      hs.eventtap.event.newKeyEvent({}, keycode, true):post()
      kana = not kana
   end
end


-- カーソル移動
remapKey({'option'}, 'l', keyCode('right'))
remapKey({'option'}, 'j', keyCode('left'))
remapKey({'option'}, 'k', keyCode('down'))
remapKey({'option'}, 'i', keyCode('up'))
--remapKey({'option'}, 'h', keyCode('home'))
remapKey({'option'}, 'h', keyCode('a', 'ctrl'))
--remapKey({'option'}, ';', keyCode('end'))
remapKey({'option'}, ';', keyCode('e', 'ctrl'))

-- テキスト編集
remapKey({'option'}, 'u', keyCode('delete'))
remapKey({'option'}, 'o', keyCode('forwarddelete'))
remapKey({'option'}, 'w', handleKana())
-- remapKey({'option'}, '3', keyCode('3', 'shift'))

-- コマンド
remapKey({'option'}, 'z', keyCode('z', 'cmd'))
remapKey({'option'}, 'e', keyCode('escape'))

-- カーソル移動(+shift)
remapKey({'option', 'shift'}, 'l', keyCode('right', 'shift'))
remapKey({'option', 'shift'}, 'j', keyCode('left', 'shift'))
remapKey({'option', 'shift'}, 'k', keyCode('down', 'shift'))
remapKey({'option', 'shift'}, 'i', keyCode('up', 'shift'))
remapKey({'option', 'shift'}, 'h', keyCode('home', 'shift'))
remapKey({'option', 'shift'}, ';', keyCode('end', 'shift'))

-- カーソル移動(+shift)
remapKey({'option', 'cmd'}, 'l', keyCode('right', 'cmd'))
remapKey({'option', 'cmd'}, 'j', keyCode('left', 'cmd'))
remapKey({'option', 'cmd'}, 'k', keyCode('down', 'cmd'))
remapKey({'option', 'cmd'}, 'i', keyCode('up', 'cmd'))
remapKey({'option', 'cmd'}, 'h', keyCode('home', 'cmd'))
remapKey({'option', 'cmd'}, ';', keyCode('end', 'cmd'))

