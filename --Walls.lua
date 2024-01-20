--[[Walls]]
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","MinimalistMode","PhysicalConsumables","AfkDeath"} do
            tfm.exec["disable"..f]()
end

local translations = {
    ['br'] = {
        warning = "ATENÇÃO",
        welcome = "<Rose>Bem-vindo(a) ao minigame <J>#walls</ROSE>.<VP><CE><BR>Neste minigame você terá que tomar cuidado para não cair com o meep de seus oponentes. Se quiser vencer, derrube-os e seja o ultimo rato vivo!<BR><ROSE>Cuidado com as paredes! Explosões também surgirão ao decorrer do tempo!<BR><J>Envie seus mapas neste tópico:<BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1",
        tribe = "\n\n\n<J><p align='center'>Tribo: </J><BL>",
        rounds = "</BL></p></J>\n\n\n<font size='17'>Rodadas jogadas: <V>",
        wons = "</V>\nRodadas vencidas: <V>",
        warning1 = "<ROSE>Explosões foram adicionadas!</ROSE>",
        warning2 = "<ROSE>As paredes ficaram mais rápidas</ROSE>!",
        close_p = "Fechar",
    },
    ['en'] = {
        warning = "WARNING",
        welcome = "<ROSE>Welcome to <J>#walls.</J><VP><CE><BR>In this minigame you will have to be careful not to fall by your opponents' meep. If you want to win, be the last mouse alive! <BR> <ROSE> Watch out for the walls! Explosions will appear over time! <BR> <J> Submit your maps in this topic:<BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1",
        tribe = "\n\n\n<J><p align='center'>Tribe: </J><BL>",
        rounds = "</BL></p></J>\n\n\n<font size='17'>Rounds played: <V>",
        wons = "</V>\nRounds won: <V>",
        warning1 = "<ROSE>Explosions have been added!</ROSE>",
        warning2 = "<ROSE>Walls became faster!</ROSE>",
        close_p = "Close",
    },
    ['fr'] = {
        warning = "ATTENTION",
        welcome = "<ROSE>Bienvenue sur <J>#walls.</J><VP><CE><BR>Dans ce mini-jeu vous devrez faire attention à ne pas tomber avec le meep de votre adversaire. Si vous voulez gagner, soyez la dernière souris en vie ! <BR> <ROSE> Attention aux murs ! Des explosions seront déclenchées au fil du temps ! <BR> <J> Envoyez vos cartes sur ce sujet : <BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1",
        tribe = "\n\n\n<J><p align='center'>Tribu: </J><BL>",
        rounds = "</BL></p></J>\n\n\n<font size='17'>Parties jouées: <V>",
        wons = "</V>\nParties gagnées: <V>",
        warning1 = "<ROSE>Les explosions ont été ajoutées!</ROSE>",
        warning2 = "<ROSE>Les murs sont devenus plus rapides!</ROSE>", 
        close_p = "Fermer",
    },
    ['es'] = {
        warning = "PELIGRO",
        welcome = "<Rose>Bienvenido(a), al minijuego <J>#walls<Rose>.<VP><CE><BR>En este minijuego tendrás que tener cuidado, podrías caer por el meep de tu oponente. ¡Si quieres ganar, derríbalo y sé el último ratón vivo!<BR><ROSE>¡Cuidado con las paredes! ¡Explotarán cada cierto tiempo!<BR><J>Envía tus mapas a este hilo:<BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1",
        tribe = "\n\n\n<J><p align='center'>Tribu: </J><BL>",
        rounds = "</BL></p></J>\n\n\n<font size='17'>Rondas jugadas: <V>",
        wons = "</V>\nRondas ganadas: <V>",
        warning1 = "<ROSE>¡Las explosiones empezaron!</ROSE>",
        warning2 = "<ROSE>¡Las paredes serán más rápidas</ROSE>!",
        close_p = "Cerrar",
    }
}

system.disableChatCommandDisplay(cmd, true)

w = 262
w1 = 262
x = 809
x1 = -267
data = {}
local time = os.time();
local run = os.time();
local contagem = 1000;
local max_time = 170
local tempo = os.time();
local s=1
local players = {}
isBonusTaken = false
local adm = {["Rafapkzz#8588"] = true,["Brsowl#0000"] = true,["Rianmojang1#0000"] = true, ["Ghost#6398"] = true, ["Lays#1146"] =true}

local mod = {["Artsyemir#0000"] = true, ["Tsohg#1253"]= true}

local maps = {
    7947056, 7507808, 7507577, 7508407, 7508527, 7507436, 7497394, 7507299, 7507681, 7507669, 7507735,  7506902, 7937063, 7946764, 7946765,7947711,7947712,7947713,7947714,7506270, 7506352, 7506584, 7506587, 7507050, 7508721,

};
tfm.exec.newGame(maps[math.random(#maps)])

local powers = {

    size = function(playerName)
       tfm.exec.changePlayerSize(playerName, math.random(1, 9)/ 10)
    end,
    freeze = function(playerName)
       tfm.exec.freezePlayer(playerName, true, true)
    end,
    cheese = function(playerName)
        tfm.exec.giveCheese(playerName)
    end,
    transformation = function (playerName)
        tfm.exec.giveTransformations(playerName, true) 
    end,

   
}

function addBonus()
    
    local xBonus = math.random(50, 750)
    local yBonus = math.random(50, 350)
    local playerWhoGotBonus = nil

    tfm.exec.addBonus(0, xBonus, yBonus, 3, 0, false, nil)
    bonusImage = tfm.exec.addImage("16bc54cf1cd.png", "!1", xBonus, yBonus, nil, 1, 1, 0, 1, 0.5, 0.5, false)
end

function eventPlayerBonusGrabbed(playerName, bonusID)
    if isBonusTaken then return end

    if bonusID == 3 then
        playerWhoGotBonus = playerName
        isBonusTaken = true
        tfm.exec.removeBonus(0, nil)
    end

    if bonusImage then
        tfm.exec.removeImage(bonusImage)
    end
end


function applyRandomPower(playerName)
    local randomPower = table.random(powers)
    randomPower(playerName)
end

function table.random(tbl)
    local keys = {}
    for key in pairs(tbl) do
        table.insert(keys, key)
    end
    local randomKey = keys[math.random(#keys)]
    return tbl[randomKey]
end

function split(t,s)
    local a={}
    
    for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
        table.insert(a,i)
    end
    return a
end

function translate(name, key)
    local lang = (data[name] and data[name].lang or tfm.get.room.community)
    lang = (translations[lang] and lang or 'en')
    return translations[lang][key] or nil
end

function eventPlayerDied(name)
    local alivePlayers = {}

    for k, v in pairs(tfm.get.room.playerList) do
        if not v.isDead then
            table.insert(alivePlayers, k)
        end
    end

    if #alivePlayers == 1 then
        local winner = alivePlayers[1]

        tfm.exec.giveCheese(winner)
        tfm.exec.playerVictory(winner)
        tfm.exec.setGameTime(3)
        tfm.exec.chatMessage("<J>" ..winner.. " won")

    elseif #alivePlayers == 0 then
        tfm.exec.setGameTime(3)
        tfm.exec.newGame(maps[math.random(#maps)])
        tfm.exec.chatMessage("<J>No one won </J>")

    end
end

function eventLoop(t, r)
    if r <= 0 then 
        tfm.exec.newGame(maps[math.random(#maps)])
    end
    
    if t >= 60000 and t <= 60500 then
        table.foreach(tfm.get.room.playerList, function(k)
            tfm.exec.chatMessage(translate(k, 'warning1'), k)
        end)
    end
    
    if t >= 100000 and t <= 100500 then
        table.foreach(tfm.get.room.playerList, function(k)
            tfm.exec.chatMessage(translate(k, 'warning2'), k)
        end)
    end
    if t >= 60000 and t <= 65000 or t >= 100000 and t <= 105000 then
        if tempo<os.time()-contagem then
            table.foreach(tfm.get.room.playerList, function(k)
            if s == 1 then
                    ui.addTextArea(50, "<font size='110' color='#001'>"..translate(k, 'warning'), name, 104, 101, 579, 142, 0x940000, 0x000000, 0, true)
                    ui.addTextArea(51, "<font size='110' color='#940000'>"..translate(k, 'warning'), name, 107, 98, 579, 142, 0x940000, 0x000000, 0, true)
                elseif s == 2 then
                    ui.addTextArea(50, "<font size='110' color='#001'>"..translate(k, 'warning'), name, 104, 101, 579, 142, 0x4d0000, 0x000000, 0, true)
                    ui.addTextArea(51, "<font size='110' color='#4d0000'>"..translate(k, 'warning'), name, 107, 98, 579, 142, 0x940000, 0x000000, 0, true)
                    s = 0
                end
            s=s+1
        end)
    end
end
    if t >= 65000 and t <= 70000 then
        ui.removeTextArea(50, nil)
        ui.removeTextArea(51, nil)
    end

    if t >= 65000 then
        if run < os.time()-5000 then
            xex = math.random(w1, x)
            yex = math.random(0, 380)
            tfm.exec.explosion(xex, yex, 50, 100, true)
            tfm.exec.displayParticle(12,xex,yex)
            run = os.time();
        end
    end
    
    if t <= 1000 then
        tfm.exec.setGameTime(max_time)
        for k, v in next,
            tfm.get.room.playerList do
            tfm.exec.respawnPlayer(k) -- As vezes buga e alguem morre
            tfm.exec.giveMeep(k)
        end
    end
    
    if t >= 105000 then
        if time < os.time()-500 then
            ui.addTextArea(99, "", nil, x1, -576, w, 1360, 0x6a7495, 0x6a7495, 1, true)
            w = w+5
            ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
            w1 = w1+5
            x = x-3
            time = os.time();
            ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
        end
    end
    if t >= 3000 and t <= max_time*1000 then
            if time < os.time()-1000 then
                ui.addTextArea(99, "", nil, x1, -576, w, 1360, 0x6a7495, 0x6a7495, 1, true)
                w = w+3
                ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
                w1 = w1+3
                x = x-3
                time = os.time();
                ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
            end
        for name, p in pairs(tfm.get.room.playerList) do
            if p.x >= x+5 then
                tfm.exec.killPlayer(name)
            elseif p.x <= w+5 then
                tfm.exec.killPlayer(name)
            end
        end
    end
    if playerWhoGotBonus then
        applyRandomPower(playerWhoGotBonus)
        playerWhoGotBonus = nil
    end
end

function eventChatCommand(name, cmd)
    local arg = split(cmd, " ")

    if arg[1] == "help"  then
        help(name)
    elseif arg[1] == "snow" then
        tfm.exec.snow(0, 1)
    end

    if mod[name] then
            if arg[1] == "map" and arg[2] ~= nil then
                tfm.exec.newGame(arg[2])

            elseif arg[1] == "commands" then
                modHelp(name)

            elseif arg[1] == "map" and arg[2] == nil then
                tfm.exec.newGame(maps[math.random(#maps)])

            elseif arg[1] == "kill" and arg[2] ~= nil then --must be used as punishment of hacking or whatever never to have advantage
                tfm.exec.killPlayer(arg[2])
        end
    end

    if adm[name] then
            if arg[1] == "freeze" and arg[2] ~= nil then 
                tfm.exec.freezePlayer(arg[2], true, true)
            
            elseif arg[1] == "map" and arg[2] ~= nil then
                tfm.exec.newGame(arg[2])

            elseif arg[1] == "map" and arg[2] == nil then
                tfm.exec.newGame(maps[math.random(#maps)])
            
            elseif arg[1] == "kill" and arg[2] ~= nil then --must be used as punishment of hacking or whatever never to have advantage
                tfm.exec.killPlayer(arg[2])

            elseif arg[1] == "size" and arg[2] ~= nil and arg[3] then
                tfm.exec.changePlayerSize(arg[2], arg[3])

            elseif arg[1] == "commands" then
                admHelp(name)
            
            elseif arg[1] == "ms" then
                tfm.exec.chatMessage("<VI>[#Walls] </VI><J>"..table.concat(arg," ", 2), nil)

            elseif arg[1] == "maxplayers" and tonumber(arg[2]) <=50 then
                tfm.exec.setRoomMaxPlayers(arg[2])
            
            elseif arg[1] == "maxplayers" and tonumber(arg[2]) > 50 then
                tfm.exec.chatMessage("max is 50 noob", name)

            elseif arg[1] == "respawn" and arg[2] ~= nil then
                tfm.exec.respawnPlayer(arg[2])
                tfm.exec.chatMessage("<Vi>!Player: " ..arg[2].. " respawned by: " ..name, adm[name] and mod[name])

            elseif arg[1] == "time" and tonumber(arg[2]) ~= nil then
                tfm.exec.setGameTime(arg[2], true)

            elseif arg[1] == "time" and tonumber(arg[2]) == nil then
                tfm.exec.chatMessage("Invalig args noob", name)

            elseif arg[1] == "link" and arg[2] ~= nil and arg[3] ~= nil and arg[3] ~= arg[2] then
                tfm.exec.linkMice(arg[2], arg[3], true)

            elseif arg[1] == "unlink" and arg[2] ~= nil and arg[3] ~= nil then
                tfm.exec.linkMice(arg[2], arg[3], false)    
        end            
    end 
end



function sendMenu(id, text, target, x, y, width, height, alpha)
    ui.addTextArea(id, '', target, x+-2, y+18, width+24, height+14, 0x2E221B, 0x2E221B, alpha)
    ui.addTextArea(id+1, '', target, x+-1, y+19, width+22, height+12, 0x986742, 0x986742, alpha)
    ui.addTextArea(id+2, '', target, x+2, y+22, width+16, height+6, 0x171311, 0x171311, alpha)
    ui.addTextArea(id+3, '', target, x+3, y+23, width+14, height+4, 0x0C191C, 0x0C191C, alpha)
    ui.addTextArea(id+4, '', target, x+4, y+24, width+12, height+2, 0x24474D, 0x24474D, alpha)
    ui.addTextArea(id+5, '', target, x+5, y+25, width+10, height+0, 0x183337, 0x183337, alpha)
    ui.addTextArea(id+6, text, target, x+6, y+26, width+8, height+-2, 0x122528, 0x122528, alpha)
    ui.addTextArea(id+7, '', target, x+15, y+height-20+25, width-10, 15, 0x5D7D90, 0x5D7D90, alpha)
    ui.addTextArea(id+8, '', target, x+15, y+height-20+27, width-10, 15, 0x11171C, 0x11171C, alpha)
    ui.addTextArea(id+9, '<p align="center"><a href="event:close@'..id..'"><N>'..translate(target, 'close_p')..'</a>', target, x+15, y+height-20+26, width-10, 15, 0x3C5064, 0x3C5064, alpha)
end

function closeMenu(id, name)
    for i = id, id + 9 do
        ui.removeTextArea(i, name)
    end
end

function eventTextAreaCallback(id, name, link)
    if link:sub(0,5) == 'close' then
        id = link:sub(7)
        closeMenu(id, name)
        ui.removeTextArea(90, name)
    end
end

function admHelp(playerName) 
    tfm.exec.chatMessage("<R>Admin commands</R>\n <J>!commands - to show available adm commands\n !map or !map [mapcode] - load an official random map or load one\n !kill [player] - kills a player - must be only used as punishment\n !freeze [player] - freezes a player\n !size [player] [number 1 - 5] or [random] - gives the player a random or a given size\n !ms - Chat message\n !maxplayers [1 - 50] - set max players in the room\n !respawn [player] - respawn a player\n !time [number] - change maps time\n !link or !unlink [player1] [player2] - link or unlink two players\n", playerName)
end


function modHelp(playerName) 
    tfm.exec.chatMessage("<VI>Mod commands</VI>\n <J>!commands - to show available mod commands\n !map or !map [mapcode] - load a official random map or load one\n !kill [player] - kills a player - must be only used as punishment\n" , playerName) 
end


tfm.exec.setRoomMaxPlayers(25)

function eventNewGame(name)
isBonusTaken = false


w = 4
w1 = 4
x = 792
x1 = 4
ui.removeTextArea(50, nil)
ui.removeTextArea(51, nil)
ui.removeTextArea(99, nil)
ui.removeTextArea(100, nil)
addBonus()

ui.addTextArea(10001,"",nil,-244,-18,252,651,0x6A7495,0x6A7495,1,true)ui.addTextArea(10002,"",nil,805,-6,242,651,0x6A7495,0x6A7495,1,true)ui.addTextArea(10003,"",nil,-481,-185,1532,200,0x6A7495,0x6A7495,1,true)ui.addTextArea(10004,"",nil,-467,413,1532,283,0x6A7495,0x6A7495,1,true)

    for playerName, playerData in pairs(tfm.get.room.playerList) do
        tfm.exec.linkMice(playerName, playerName, false)
        tfm.exec.changePlayerSize(playerName, 1)
        tfm.exec.giveTransformations(playerName, false) 

    end

    for k, v in next, adm do
        tfm.exec.setNameColor(k, 0xFF0000)
    end

    for k, v in next, mod do
        tfm.exec.setNameColor(k, 0x7929A2)
    end

end

function eventNewPlayer(name)
     tfm.exec.chatMessage(translate(name, 'welcome'), name)
end 

table.foreach(tfm.get.room.playerList, eventNewPlayer)

function eventTextAreaCallback(id, nick, call)
    if call=="cerrar" then
        for i = 0, 17, 1 do
        ui.removeTextArea(i, nick)
        end
    end
end

function help(name)
  
    if tfm.get.room.playerList[name].community == "br" then
            ui.addTextArea(0, "", name, 235, 60, 320, 260, 0x073247, 0x121212, 1, true)
            ui.addTextArea(1, "<p align='center'><font size ='18' color='#00C17C'>Ajuda<b>", name, 360, 60, 90, 25, 0x073247, 0x121212, 1, true)
            ui.addTextArea(2, "<p align='center'><font size ='15' color='#316CCC'><b>#Walls", name, 235, 60, 88, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(3, "<p align='center'><V><a href='event:cerrar'><font color='#F93018'><b>X", name, 495, 60, 60, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(4, "<p align='center'><VP> Bem-vindo(a) ao minigame <BV>#Walls<VP>! <br><br>Neste minigame você terá que tomar cuidado com o meep de seus oponentes.<br><br>Se quiser vencer, derrote seus oponentes e seja o ultimo rato vivo!<br><ROSE>Cuidado com as paredes! <br><br>Explosões também surgirão ao decorrer do tempo!<CS> <br><br>Criado por: <R>Rafapkzz#8588<CS>, <R>Brsowl#0000<CS> e <R>Rianmojang1#0000<CS>.<br><br>Créditos: <R>Hugotitas#0000<CS>.", name, 248, 100, 300, 265, 0, 0, 0, true)
    elseif tfm.get.room.playerList[name].community == "es" then
            ui.addTextArea(0, "", name, 235, 60, 320, 260, 0x073247, 0x121212, 1, true)
            ui.addTextArea(1, "<p align='center'><font size ='18' color='#00C17C'>Ayuda<b>", name, 360, 60, 90, 25, 0x073247, 0x121212, 1, true)
            ui.addTextArea(2, "<p align='center'><font size ='15' color='#316CCC'><b>#Walls", name, 235, 60, 88, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(3, "<p align='center'><V><a href='event:cerrar'><font color='#F93018'><b>X", name, 495, 60, 60, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(4, "<p align='center'><VP> ¡Bienvenido al minijuego <BV>#Walls<VP>! <br><br>En este minijuego, debes tener cuidado con los meep de tus oponentes.<br><br>¡Si quieres ganar, derrota a tus oponentes y sé el último ratón vivo!<br><ROSE>¡Cuidado con los muros!! <br><br>¡Las explosiones también aparecerán con el tiempo!<CS> <br><br>Creado por: <R>Rafapkzz#8588<CS>, <R>Brsowl#0000<CS> e <R>Rianmojang1#0000<CS>.<br><br>Créditos: <R>Hugotitas#0000<CS>.", name, 248, 100, 300, 265, 0, 0, 0, true)
     elseif tfm.get.room.playerList[name].community == "pl" then
            ui.addTextArea(0, "", name, 235, 60, 320, 260, 0x073247, 0x121212, 1, true)
            ui.addTextArea(1, "<p align='center'><font size ='18' color='#00C17C'>Pomoc<b>", name, 360, 60, 90, 25, 0x073247, 0x121212, 1, true)
            ui.addTextArea(2, "<p align='center'><font size ='15' color='#316CCC'><b>#Walls", name, 235, 60, 88, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(3, "<p align='center'><V><a href='event:cerrar'><font color='#F93018'><b>X", name, 495, 60, 60, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(4, "<p align='center'><VP> Witamy w <BV>#Walls<VP>! <br><br>W tej minigrze musisz uważać na meepów przeciwników.<br><br>Jeśli chcesz wygrać, pokonaj przeciwników i zostań ostatnią żywą myszą!<br><br><ROSE>Uważaj na ściany!<br>Z czasem dojdzie do eksplozji!<CS> <br><br>Utworzono: <R>Rafapkzz#8588<CS>, <R>Brsowl#0000<CS> i <R>Rianmojang1#0000<CS>.<br><br>Kredyty: <R>Hugotitas#0000<CS>.", name, 248, 100, 300, 265, 0, 0, 0, true)
    elseif tfm.get.room.playerList[name].community == "tr" then
            ui.addTextArea(0, "", name, 235, 60, 320, 260, 0x073247, 0x121212, 1, true)
            ui.addTextArea(1, "<p align='center'><font size ='18' color='#00C17C'>YARDIM<b>", name, 360, 60, 90, 25, 0x073247, 0x121212, 1, true)
            ui.addTextArea(2, "<p align='center'><font size ='15' color='#316CCC'><b>#Walls", name, 235, 60, 88, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(3, "<p align='center'><V><a href='event:cerrar'><font color='#F93018'><b>X", name, 495, 60, 60, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea (4, "<p align = 'center'> <BV> #Walls'a <VP> Hoş Geldiniz<VP>! <br><br> Bu mini oyunda rakiplerinizin Meep gücüne kapılmamak için dikkatli olmalısın.<br><br>Eğer kazanmak istiyorsan, rakiplerini yenilgiye uğrat ve hayatta kalan son fare ol!. <br> <ROSE>Duvarlara dikkat et! <br><br>Bir süre içinde duvarlar daralacak!<CS> <br> <br> Oluşturanlar: <R> Rafapkzz#8588<CS>, <R> Brsowl#0000<CS> ve <R>Rianmojang1#0000<CS>.<br> <br > Katkıda bulunanlar: <R> Hugotitas#0000<CS>. ", name, 248, 100, 300, 265, 0, 0, 0, true)
    else
            ui.addTextArea(0, "", name, 235, 60, 320, 260, 0x073247, 0x121212, 1, true)
            ui.addTextArea(1, "<p align='center'><font size ='18' color='#00C17C'>Help<b>", name, 360, 60, 90, 25, 0x073247, 0x121212, 1, true)
            ui.addTextArea(2, "<p align='center'><font size ='15' color='#316CCC'><b>#Walls", name, 235, 60, 88, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea(3, "<p align='center'><V><a href='event:cerrar'><font color='#F93018'><b>X", name, 495, 60, 60, 20, 0x073247, 0x121212, 1, true)
            ui.addTextArea (4, "<p align = 'center'> <VP> Welcome to the<BV> #Walls<VP>! <br><br> In this minigame you have to be careful about the meep your opponents.<br><br>If you want to win, defeat your opponents and be the last living mouse! <br> <ROSE>Watch out for the walls! <br><br>Explosions will also come up as you go!<CS> <br> <br> Created by: <R> Rafapkzz#8588<CS>, <R> Brsowl#0000<CS> and <R>Rianmojang1#0000<CS>.<CS> <br> <br > Credits: <R> Hugotitas#0000<CS>. ", name, 248, 100, 300, 265, 0, 0, 0, true)

    end
end