# esx_gunshot
## Beskrivning
Ger möjligheten att kolla ifall en person avfyrat ett vapen (genom GSR-test).

## Implementering
Vid installation har alla möjlighet att göra testet genom /guntest, se rad 16-21 i client.lua. För att implementera scriptet i polisernas meny från esx_policejob, gör följande:

**1.** Radera rad 16-21 i client.lua
**2.** Gå till 
```LUA
title    = _U('citizen_interaction'),
```
**3.** Lägg till en ny knapp
```LUA
        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'citizen_interaction',
          {
            title    = _U('citizen_interaction'),
            align    = 'top-left',
            elements = {
              {label = _U('id_card'),       value = 'identity_card'},
              {label = _U('search'),        value = 'body_search'},
              {label = 'GSR-test',        value = 'gsr'}, -- Ny knapp tillagd här
            },
          },
          function(data2, menu2)
```

**4.** Definera meny-itemet "gsr" under menyn
```LUA
              if data2.current.value == 'identity_card' then
                OpenIdentityCardMenu(player)
              end

              if data2.current.value == 'body_search' then
                OpenBodySearchMenu(player)
              end
              
              if data2.current.value == 'gsr' then
                TriggerEvent('esx_guntest:checkGun' source)
              end
```

**5.** Klart!
