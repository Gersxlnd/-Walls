--[[Walls]]
--[[Timers library i found on github https://seniru.github.io/Timers4TFM/]]--
--DO NOT CHANGE ANYTHING HERE--
local a={}a.__index=a;a._timers={}setmetatable(a,{__call=function(b,...)return b.new(...)end})function a.process()local c=os.time()local d={}for e,f in next,a._timers do if f.isAlive and f.mature<=c then f:call()if f.loop then f:reset()else f:kill()d[#d+1]=e end end end;for e,f in next,d do a._timers[f]=nil end end;function a.new(g,h,i,j,...)local self=setmetatable({},a)self.id=g;self.callback=h;self.timeout=i;self.isAlive=true;self.mature=os.time()+i;self.loop=j;self.args={...}a._timers[g]=self;return self end;function a:setCallback(k)self.callback=k end;function a:addTime(c)self.mature=self.mature+c end;function a:setLoop(j)self.loop=j end;function a:setArgs(...)self.args={...}end;function a:call()self.callback(table.unpack(self.args))end;function a:kill()self.isAlive=false end;function a:reset()self.mature=os.time()+self.timeout end;Timer=a

for _, f in next, { "AutoShaman", "AutoScore", "AutoNewGame", "AutoTimeLeft", "MinimalistMode", "PhysicalConsumables", "AfkDeath" } do
    tfm.exec["disable" .. f]()
end

--tfm.exec.chatMessage = print --chatMessages as print to test

local translations = {
    ['br'] = {
        warning = "ATENÇÃO",
        welcome =
        "<Rose>Bem-vindo(a) ao minigame <J>#walls</ROSE>.<VP><CE><BR>Neste minigame você terá que tomar cuidado para não cair com o meep de seus oponentes. Se quiser vencer, derrube-os e seja o ultimo rato vivo!<BR><ROSE>Cuidado com as paredes! Explosões também surgirão ao decorrer do tempo!<BR><J>Envie seus mapas neste tópico:<BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1.<BR><PT>Digite !help para ver mais informações",
        warning1 = "<ROSE>Explosões foram adicionadas!</ROSE>",
        warning2 = "<ROSE>As paredes ficaram mais rápidas</ROSE>!",
        close_p = "Fechar",
        help_1 = "<p align='center'><font size ='14' color='#00C17C'>Ajuda<b>",
        help_2 =
        "<p align = 'center'><VP>  Bem vindo ao<BV> #Walls<VP>! \n Neste minigame você tem que estar atento aos meeps dos oponentes.<br><br>Se você quer ganhar, derrote seus oponentes e seja o ultimo rato vivo! <br> <br><ROSE>#Walls</ROSE><J> é um module de código aberto. Se você quiser contribuir, cheque o nosso repositorio github.com/Gersxlnd/-Walls <br><br><ROSE>Fique atento com as paredes! <br><br>Explosões também surgirão conforme você avança!<CS> <br> <br> Criado por: <R> Rafapkzz#8588<CS>, <R> Pro#1435<CS> & <R>Rianmojang1#0000<CS>.<CS> <br> <br > Créditos: <R> Hugotitas#0000.<CS><J>",
        mapList = "Lista de map atual: ",
        translation_ = "Você mudou seu idioma padrão para: ",
        won = " ganhou!",
        noWon = "<J>Ninguém ganhou!",
        commands =
        "<VI>Commands</VI> <br><br><BV>!help -</BV>  <J> isso mostra a aba de ajuda. </J> <br><br><BV>!snow -</BV> <J> remove neve se houver </J><br><br><BV>!langue [região] -</BV> <J> mude seu idioma para o idioma selecionado. </J><br><br><BV>!maplist -</BV> <J> é enviado uma lista dos maps oficiais do #Walls para você.</J>",
    },
    ['en'] = {
        warning = "WARNING",
        welcome =
        "<ROSE>Welcome to <J>#walls.</J><VP><CE><BR>In this minigame you will have to be careful not to fall by your opponents' meep. If you want to win, be the last mouse alive! <BR> <ROSE> Watch out for the walls! Explosions will appear over time! <BR> <J> Submit your maps in this topic:<BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1<BR><PT>Type !help to see more informations",
        warning1 = "<ROSE>Explosions have been added!</ROSE>",
        warning2 = "<ROSE>Walls became faster!</ROSE>",
        close_p = "Close",
        help_1 = "<p align='center'><font size ='14' color='#00C17C'>Help<b>",
        help_2 =
        "<p align = 'center'> <VP>  Welcome to the<BV> #Walls<VP>! \n <br> In this minigame you have to be careful about the meep your opponents.<br><br>If you want to win, defeat your opponents and be the last living mouse! <br> <br><ROSE>#Walls</ROSE><J> is an open source module. If you want to contribute check our repository github.com/Gersxlnd/-Walls <br><br><ROSE>Watch out for the walls! <br><br>Explosions will also come up as you go!<CS> <br> <br> Created by: <R> Rafapkzz#8588<CS>, <R> Pro#1435<CS> and <R>Rianmojang1#0000<CS>.<CS> <br> <br > Credits: <R> Hugotitas#0000.<CS><J>",
        mapList = "Current map list: ",
        translation_ = "You changed your default language to: ",
        won = " won!",
        noWon = "<J>No one won!",
        commands =
        "<VI>Commands</VI> <br><br><BV>!help -</BV>  <J> it will show you a help tab. </J> <br><br><BV>!snow -</BV> <J> it removes snow if there is any </J><br><br><BV>!langue [region] -</BV> <J> changes your language to the selected one. </J><br><br><BV>!maplist -</BV> <J>you will get the official map list of #Walls.</J>",

    },
    ['fr'] = {
        warning = "ATTENTION",
        welcome =
        "<ROSE>Bienvenue sur <J>#walls.</J><VP><CE><BR>Dans ce mini-jeu vous devrez faire attention à ne pas tomber avec le meep de votre adversaire. Si vous voulez gagner, soyez la dernière souris en vie ! <BR> <ROSE> Attention aux murs ! Des explosions seront déclenchées au fil du temps ! <BR> <J> Envoyez vos cartes sur ce sujet : <BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1.<BR><PT>Tape !help pour plus d'informations.",
        warning1 = "<ROSE>Les explosions ont été ajoutées!</ROSE>",
        warning2 = "<ROSE>Les murs sont devenus plus rapides!</ROSE>",
        close_p = "Fermer",
        help_1 = "<p align='center'><font size ='14' color='#00C17C'>Aide<b>",
        help_2 =
        "<p align = 'center'> <VP>  Bienvenue dans<BV> #Walls<VP>! \n <br> Dans ce mini-jeu vous devez faire attention aux meep de vos adversaires. <br><br>Si vous voulez gagner, battez vos adversaires et soyez la dernière souris en vie ! <br> <br><ROSE>#Walls</ROSE><J> est un module open source. Si vous voulez contribuer, allez voir notre répertoire : github.com/Gersxlnd/-Walls <br><br><ROSE>Attention aux murs ! <br><br>Des explosions vont se produire au fur et à mesure! <CS> <br> <br> Créé par : <R> Rafapkzz#8588<CS>, <R> Brsowl#0000<CS> et <R>Rianmojang1#0000<CS>.<CS> <br> <br > Crédits: <R> Hugotitas#0000.<CS><J>",
        mapList = "Liste des cartes actuelles: ",
        translation_ = "Votre nouvelle langue par défaut est : ",
        won = " a gagné!",
        noWon = "<J>Personne n'a gagné!",
        commands =
        "<VI>Commands</VI> <br><br><BV>!help -</BV>  <J> ouvre l'écran d'aide. </J> <br><br><BV>!snow -</BV> <J> retire la neige </J><br><br><BV>!langue [region] -</BV> <J> change la langue pour celle sélectionnée. </J><br><br><BV>!maplist -</BV> <J> ouvre la maplist officielle de #Walls.</J>",
    },
    ['es'] = {
        warning = "PELIGRO",
        welcome =
        "<Rose>Bienvenido(a), al minijuego <J>#walls<Rose>.<VP><CE><BR>En este minijuego tendrás que tener cuidado, podrías caer por el meep de tu oponente. ¡Si quieres ganar, derríbalo y sé el último ratón vivo!<BR><ROSE>¡Cuidado con las paredes! ¡Explotarán cada cierto tiempo!<BR><J>Envía tus mapas a este hilo:<BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1<BR><PT>Escriba !help para ver más información",
        warning1 = "<ROSE>¡Las explosiones empezaron!</ROSE>",
        warning2 = "<ROSE>¡Las paredes serán más rápidas</ROSE>!",
        close_p = "Cerrar",
        help_1 = "<p align='center'><font size ='14' color='#00C17C'>Ayuda<b>",
        help_2 =
        "<p align = 'center'> <VP>  ¡Bienvenido a<BV> #Walls<VP>! \n <br> En este minijuego debes tener cuidado con los meeps de tus oponentes..<br><br>Si quieres ganar, derrotar a tus oponentes y ser el último ratón vivo! <br> <br><ROSE>#Walls</ROSE><J>  es un código fuente abierto. Si quieres contribuir, consulta nuestro repositorio github.com/ Gersxlnd /-Walls <br><br><ROSE>¡Cuidado con las paredes! <br><br>¡También surgirán explosiones a medida que avanzas!<CS> <br> <br> Creado por: <R> Rafapkzz#8588<CS>, <R> Pro#1435<CS> and <R>Rianmojang1#0000<CS>.<CS> <br> <br > Créditos: <R> Hugotitas#0000.<CS><J>",
        mapList = "Lista de mapas actual: ",
        translation_ = "Cambiaste tu idioma predeterminado a: ",
        won = " ganó!",
        noWon = "<J>Nadie ganó!",
        commands =
        "<VI>Commands</VI> <br><br><BV>!help -</BV>  <J> mostrará una pestaña de ayuda. </J> <br><br><BV>!snow -</BV> <J> quita la nieve si la hay </J><br><br><BV>!langue [region] -</BV> <J> cambia tu idioma al seleccionado. </J><br><br><BV>!maplist -</BV> <J>obtendrás la lista oficial de mapas de #Walls.</J>",
    },
    ['tr'] = {
        warning = "UYARI",
        welcome =
        "<ROSE>Hoş geldiniz <J>#walls.</J><VP><CE><BR> Bu mini oyunda rakiplerinizin meep gücüne düşmemeye dikkat etmeniz gerekecek. Kazanmak istiyorsanız hayatta kalan son fare olun! <BR> <ROSE> Duvarlara dikkat edin! Patlamalar zamanla ortaya çıkacak! <BR> <J>Haritalarınızı bu konu başlığına gönderin:<BR><VP>https://atelier801.com/topic?f=6&t=898941&p=1#m1.<BR><PT> Daha fazla bilgi için !help yazın",
        warning1 = "<ROSE>Patlamalar eklendi!</ROSE>",
        warning2 = "<ROSE>Duvarlar daha hızlı halde!</ROSE>",
        close_p = "Kapat",
        help_1 = "<p align='center'><font size ='14' color='#00C17C'>Yardım<b>",
        help_2 =
        "<p align = 'center'> <VP><BV> #Walls'a<VP> Hoş geldiniz<VP>! \n <br> Bu mini oyunda rakiplerinizin meep gücüne düşmemeye dikkat etmeniz gerekecek. Kazanmak istiyorsanız hayatta kalan son fare olun! <br> <br><ROSE>#Walls</ROSE><J> açık kaynak kodudur. Katkıda bulunmak istiyorsanız kaynağımıza göz atın github.com/Gersxlnd/-Walls <br><br><ROSE> Duvarlara dikkat edin! <br><br> Siz ilerledikçe patlamalar da ortaya çıkacak!<CS> <br> <br>Tarafından oluşturuldu: <R> Rafapkzz#8588<CS>, <R> Pro#1435<CS> ve <R>Rianmojang1#0000<CS>.<CS> <br> <br > Katkıda bulunanlar: <R> Hugotitas#0000.<CS><J>",
        mapList = "Güncel harita listesi: ",
        translation_ = "Varsayılan dilinizi değiştirdiniz: ",
        won = " kazandı!",
        noWon = "<J>Kimse kazanmadı!",
        commands =
        "<VI>Commands </VI> <br><br><BV>!help -</BV>  <J>Size yardım ekranını gösterecek. </J> <br><br><BV>!snow -</BV> <J> Kar efektini kapatır. </J><br><br><BV>!langue [ülke kodu] -</BV> <J> Mevcut dilinizi seçilen dille değiştirir. </J><br><br><BV>!maplist -</BV> <J> #Walls'un resmi harita listesini göreceksiniz.</J>",
    },
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
local s = 1
local players = {}
isBonusTaken = false
local banned = {}
local zKey = 90
local canUseBox = {}
boxUsed = false
local adm = { ["Rafapkzz#8588"] = true, ["Brsowl#0000"] = true, ["Rianmojang1#0000"] = true, ["Ghost#6398"] = true, ["Lays#1146"] = true }

local mod = { ["Tsohg#1253"] = true, ["Artsyemir#0000"] = true, ["Potjkb#0000"] = true }

local maps = {
    7947056, 7507808, 7507577, 7508407, 7508527, 7507436, 7497394, 7507299, 7507681, 7507669, 7507735, 7937063, 7946764, 7946765, 7947711, 7947712, 7947713, 7947714, 7506270, 7506352, 7506584, 7506587, 7507050, 7508721, 7948209, 7948212, 7948208, 7948204, 7938846, 7942778, 7942780, 7942781, 7942793
};
-- to perm 7942778, 7942780, 7942781, 7942793
tfm.exec.newGame(maps[math.random(#maps)])

local powers = {
    size = function(playerName)
        local randomSize = math.random(1, 9) / 10
        tfm.exec.changePlayerSize(playerName, randomSize)
        tfm.exec.chatMessage("<J>Your size is now:<ROSE> " ..randomSize, playerName)
    end,
    freeze = function(playerName)
        tfm.exec.freezePlayer(playerName, true, true)
        tfm.exec.chatMessage("<J>Bad luck. You are freezed", playerName)
    end,
    cheese = function(playerName)
        tfm.exec.giveCheese(playerName)
        tfm.exec.chatMessage("<J>Bad luck. You got cheese", playerName)
    end,
    transformation = function(playerName)
        tfm.exec.giveTransformations(playerName, true)
        tfm.exec.chatMessage("<J>You have now transformations powers", playerName)
    end,
    link = function(playerName)
        local playerList = {}
        for name, _ in next, tfm.get.room.playerList do
            if name ~= playerName and not table.contains(banned, name) then
                playerList[#playerList + 1] = name
            end
        end
        if #playerList > 0 then
            local playerTwo = playerList[math.random(#playerList)]
            tfm.exec.linkMice(playerName, playerTwo, true)
            tfm.exec.chatMessage("<J>You got linked with<ROSE> " ..playerTwo.. " <J>is it good? xD", playerName)
        else
            tfm.exec.chatMessage("<J>There is no other player to link.")
        end
    end,
    box = function (playerName)
        table.insert(canUseBox, playerName)
        tfm.exec.chatMessage("<J>You can use Z KEY to drop a box", playerName)
    end,
    nightMode = function (playerName)
        for name, _ in next, tfm.get.room.playerList do
            if name ~= playerName then
                tfm.exec.setPlayerNightMode(true, name)
                tfm.exec.chatMessage("<J>Everybody with night mode except "..playerName)
            end
        end
    end,
    balloon = function (playerName)
        local color = math.random(1, 4)
        tfm.exec.attachBalloon(playerName, true, color, false, 1)
        tfm.exec.chatMessage("<J>Congratz you got the most useles power THE BALLOON", playerName)
    end,
    vampire = function (playerName)
        tfm.exec.setVampirePlayer(playerName, true)
        tfm.exec.chatMessage("<J>Now you are a vampire. is it bad or good luck?", playerName) 
    end
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

function split(t, s)
    local a = {}

    for i, v in string.gmatch(t, string.format("[^%s]+", s or "%s")) do
        table.insert(a, i)
    end
    return a
end

function translate(name, key)
    local lang = (data[name] and data[name].lang or tfm.get.room.community)
    lang = (translations[lang] and lang or 'en')
    return translations[lang][key] or nil
end

function table.contains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
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
        tfm.exec.chatMessage("<J>" .. winner .. translate(name, "won"))
    elseif #alivePlayers == 0 then
        tfm.exec.setGameTime(3)
        tfm.exec.newGame(maps[math.random(#maps)])
        tfm.exec.chatMessage("<J>" .. translate(name, "noWon"))
    end
end

function eventKeyboard(name, keyCode, down, x, y, xPlayerVelocity, yPlayerVelocity)
    local message = ("You cannot use another box until the current box disappears. Wait 8 seconds")
    local message2 = ("Now you can use it again")

    if boxUsed then
        return ui.addTextArea(1234, message, name, 350, 330, 150, nil, 0x4E6D49, 0x998041, 1, false) 
    end

    if table.contains(canUseBox, name) then
        if keyCode == zKey then
            boxPower = tfm.exec.addShamanObject(2, x, y+10, 90, 0, 2, false, {})
            boxUsed = true
            local timer = a.new("boxUsed", function()
                tfm.exec.removeObject(boxPower)
                boxUsed = false
                ui.addTextArea(1234, message2, name, 350, 375, 150, nil, 0x4E6D49, 0x998041, 1, false)
            end, 8000, false)
        end
    end
end

function eventPlayerMeep(playerName, x, y)
    meepImage = tfm.exec.addImage("18b633bf5ce.png", "!0", x-20, y-20, playerName, 0.23, 0.26, -0.17, 1, 0, 0, false) 
    local timer = a.new("meepImage", function()
        tfm.exec.removeImage(meepImage)
    end, 300, false)
end

function eventLoop(t, r)
    Timer.process()
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
    if t >= 60000 and t <= 65000 then
        if tempo < os.time() - contagem then
            table.foreach(tfm.get.room.playerList, function(k)
                if s == 1 then --ui.addTextArea(id, text, targetPlayer, x, y, width, height, backgroundColor, borderColor, backgroundAlpha, fixedPos)
                    ui.addTextArea(50, "<font size ='80' color='#001'>WARNING", name, 190, 50, nil, nil, 0x940000,
                        0x000000, 0, true)
                    ui.addTextArea(51, "<font size ='80' color='#940000'>WARNING", name, 193, 47, nil, nil, 0x940000,
                        0x000000, 0, true)
                elseif s == 2 then
                    ui.addTextArea(50, "<font size ='80' color='#001'>WARNING", name, 190, 50, nil, nil, 0x4d0000,
                        0x000000, 0, true)
                    ui.addTextArea(51, "<font size ='80' color='#4d0000'>WARNING", name, 193, 47, nil, nil, 0x940000,
                        0x000000, 0, true)
                    s = 0
                end
                s = s + 1
            end)
        end
    end
    if t >= 65000 and t <= 70000 then
        ui.removeTextArea(50, nil)
        ui.removeTextArea(51, nil)
    end

    if t >= 65000 then
        if run < os.time() - 5000 then
            xex = math.random(w1, x)
            yex = math.random(0, 380)
            tfm.exec.explosion(xex, yex, 50, 100, true)
            explosionImage = tfm.exec.addImage("184e45e04bf.png", "!0", xex, yex, nil, 0.14, 0.16, 0.00, 1, 0, 0, false)
            local timer = a.new("explosionImage", function()
                tfm.exec.removeImage(explosionImage)
            end, 500, false)
            tfm.exec.displayParticle(12, xex, yex)
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
        if time < os.time() - 500 then
            ui.addTextArea(99, "", nil, x1, -576, w, 1360, 0x6a7495, 0x6a7495, 1, true)
            w = w + 5
            ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
            w1 = w1 + 5
            x = x - 3
            time = os.time();
            ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
        end
    end
    if t >= 3000 and t <= max_time * 1000 then
        if time < os.time() - 1000 then
            ui.addTextArea(99, "", nil, x1, -576, w, 1360, 0x6a7495, 0x6a7495, 1, true)
            w = w + 3
            ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
            w1 = w1 + 3
            x = x - 3
            time = os.time();
            ui.addTextArea(100, "", nil, x, -575, w1, 1360, 0x6a7495, 0x6a7495, 1, true)
        end
        for name, p in pairs(tfm.get.room.playerList) do
            if p.x >= x + 5 then
                tfm.exec.killPlayer(name)
            elseif p.x <= w + 5 then
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

    if arg[1] == "help" then
        help(name)
    elseif arg[1] == "snow" then
        tfm.exec.snow(0, 1)
    elseif arg[1] == "langue" then
        if arg[2] then
            arg[2] = arg[2]:lower()

            if not data[name] then
                data[name] = {}
            end

            data[name].lang = (translations[arg[2]] and arg[2] or data[name].lang)
            tfm.exec.chatMessage("<J>" .. translate(name, "translation_") .. arg[2], name)
        end
    elseif arg[1] == "maplist" then
        tfm.exec.chatMessage("<VI>[#Walls] " .. translate(name, "mapList") .. "</VI><J>" .. table.concat(maps, " ", 2),
            name)
    end

    if mod[name] then
        if arg[1] == "map" and arg[2] ~= nil then
            tfm.exec.newGame(arg[2])
        elseif arg[1] == "map" and arg[2] == nil then
            tfm.exec.newGame(maps[math.random(#maps)])
        elseif arg[1] == "kill" and arg[2] ~= nil then --must be used as punishment of hacking or whatever never to have advantage
            tfm.exec.killPlayer(arg[2])
            tfm.exec.chatMessage("<VI>[#Walls] </VI><ROSE>" .. arg[2] .. " <J>got killed by:<ROSE> " .. name, adm[name])
        elseif arg[1] == "ban" and arg[2] ~= nil then
            table.insert(banned, arg[2])
            tfm.exec.killPlayer(arg[2])
            tfm.exec.chatMessage("<VI>[#Walls]<J> " .. arg[2] .. " got banned. Reason: " .. table.concat(arg, " ", 3))
        elseif arg[1] == "unban" and tonumber(arg[2]) then
            table.remove(banned, arg[2])
        elseif arg[1] == "banneds" then
            tfm.exec.chatMessage(table.concat(banned, " "), name)
        end
    end

    if adm[name] then
        if arg[1] == "freeze" and arg[2] ~= nil then
            tfm.exec.freezePlayer(arg[2], true, true)
            tfm.exec.chatMessage("<VI>[#Walls] </VI><J>" .. arg[2] .. " got freezed by: " .. name, adm[name])
        elseif arg[1] == "map" and arg[2] ~= nil then
            tfm.exec.newGame(arg[2])
        elseif arg[1] == "map" and arg[2] == nil then
            tfm.exec.newGame(maps[math.random(#maps)])
        elseif arg[1] == "kill" and arg[2] ~= nil then --must be used as punishment of hacking or whatever never to have advantage
            tfm.exec.killPlayer(arg[2])
            tfm.exec.chatMessage("<VI>[#Walls] </VI><ROSE>" .. arg[2] .. " <J>got killed by:<ROSE> " .. name, adm[name])
        elseif arg[1] == "size" and arg[2] ~= nil and arg[3] then
            tfm.exec.changePlayerSize(arg[2], arg[3])
        elseif arg[1] == "ms" then
            tfm.exec.chatMessage("<VI>[#Walls] </VI><J>" .. table.concat(arg, " ", 2), nil)
        elseif arg[1] == "maxplayers" and tonumber(arg[2]) <= 50 then
            tfm.exec.setRoomMaxPlayers(arg[2])
            tfm.exec.chatMessage("<VI> Room limite is now: " .. arg[2], adm[name] and mod[name])
        elseif arg[1] == "maxplayers" and tonumber(arg[2]) > 50 then
            tfm.exec.chatMessage("<J>max is 50 noob", name)
        elseif arg[1] == "respawn" and arg[2] ~= nil then
            tfm.exec.respawnPlayer(arg[2])
            tfm.exec.chatMessage("<VI>!Player:<J> " .. arg[2] .. " <VI>respawned by:<J> " .. name, adm[name] and mod[name])
            tfm.exec.giveMeep(arg[2], true)
        elseif arg[1] == "ban" and arg[2] ~= nil then
            table.insert(banned, arg[2])
            tfm.exec.killPlayer(arg[2])
            tfm.exec.chatMessage("<VI>[#Walls]<J> " .. arg[2] .. " got banned. Reason: " .. table.concat(arg, " ", 3))
        elseif arg[1] == "unban" and tonumber(arg[2]) then
            table.remove(banned, arg[2])
        elseif arg[1] == "banneds" then
            tfm.exec.chatMessage(table.concat(banned, " "), name)
        elseif arg[1] == "time" and tonumber(arg[2]) ~= nil then
            tfm.exec.setGameTime(arg[2], true)
        elseif arg[1] == "time" and tonumber(arg[2]) == nil then
            tfm.exec.chatMessage("<J>Invalid args noob", name)
        elseif arg[1] == "link" and arg[2] ~= nil and arg[3] ~= nil and arg[3] ~= arg[2] then
            tfm.exec.linkMice(arg[2], arg[3], true)
        elseif arg[1] == "unlink" and arg[2] ~= nil and arg[3] ~= nil then
            tfm.exec.linkMice(arg[2], arg[3], false)
        end
    end
end

tfm.exec.setRoomMaxPlayers(25)

function eventNewGame(name)
    isBonusTaken = false
    w = 4
    w1 = 4
    x = 792
    x1 = 4
    canUseBox = {}

    ui.removeTextArea(50, nil)
    ui.removeTextArea(51, nil)
    ui.removeTextArea(99, nil)
    ui.removeTextArea(100, nil)
    ui.removeTextArea(1234, nil)
    
    for _, name in pairs(banned) do
        tfm.exec.freezePlayer(name)
        tfm.exec.chatMessage("<VI>[#Walls]<J> You have been banned and will be frozen each new game", name)
    end

    for i = 0, 12, 1 do
        ui.removeTextArea(i, name)
    end

    addBonus()

    ui.addTextArea(10001, "", nil, -244, -18, 252, 651, 0x6A7495, 0x6A7495, 1, true)
    ui.addTextArea(10002, "", nil, 805, -6, 242, 651, 0x6A7495, 0x6A7495, 1, true)
    ui.addTextArea(10003, "", nil, -481, -185, 1532, 200, 0x6A7495, 0x6A7495, 1, true)
    ui.addTextArea(10004, "", nil, -467, 413, 1532, 283, 0x6A7495, 0x6A7495, 1, true)

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
    system.bindKeyboard(name, zKey, true, true)
end

table.foreach(tfm.get.room.playerList, eventNewPlayer)

function eventTextAreaCallback(id, name, call)
    if call == "cerrar" then
        for i = 0, 17, 1 do
            ui.removeTextArea(i, name)
        end
    elseif call == "commands" then
        commandsHelp(name)
        for i = 0, 6, 1 do
            ui.removeTextArea(i, name)
        end
    elseif call == "Helps" then
        help(name)
        for i = 7, 12, 1 do
            ui.removeTextArea(i, name)
        end
    end
end

function help(name)
    local textArea_y = 50
    ui.addTextArea(0, "", name, 235, 50, 320, 320, 0x073247, 0x121212, 1, true)
    ui.addTextArea(1, "<p align='center'><font size ='14' color='#00C17C'>Help<b>", name, 320, textArea_y, nil, nil,
        0x073247, 0x121212, 1, true)
    ui.addTextArea(2, "<p align='center'><font size ='14' color='#316CCC'><b>#Walls", name, 235, textArea_y, nil, nil,
        0x073247, 0x121212, 1, true)
    ui.addTextArea(3, "<p align='center'><V><a href='event:cerrar'><font color='#F93018'><b>X", name, 495, textArea_y, 60,
        20, 0x073247, 0x121212, 1, true)
    ui.addTextArea(4, translate(name, "help_2"), name, 248, 100, 300, 265, 0, 0, 0, true)
    ui.addTextArea(6, "<p align='center'><a href='event:commands'><font size ='14' color='#00C17C'><b>Commands", name,
        375, textArea_y, nil, nil, 0x073247, 0x121212, 1, true)
end

function commandsHelp(name)
    local textArea_y = 50
    local textCommand = translate(name, "commands")
    local modCommandsMessage =
    "<VI>Mod commands</VI> <br><br> <BV>!ban [player] [reason] or !unban [number] -</BV> <J>Ban or unban a player<br><br> (use !banneds to see banned players and use the position in the line to unban them).</J> <br><br> <BV>!map or !map [mapcode] -</BV> <J>load a official random map or load one.</J><br><br> <BV>!kill [player] -</BV> <J>kills a player - must be only used as punishment.<br> <br>"

    local admCommandMessage =
    "<R>Admin commands</R> -- <CH>You can scroll it</CH><br><br><BV>!map or !map [mapcode] -</BV><J> load an official random map or load one.</J><br><br><BV>!kill [player] -</BV><J> kills a player - must be only used as punishment.</J><br><br><BV>!freeze [player] -</BV><J> freezes a player.</J><br><br><BV>!size [player] [number 1 - 5] or [random] -</BV><J> gives the player a random or a given size.</J><br><br><BV>!ms -</BV><J> Chat message</J><br><br><BV>!maxplayers [1 - 50] -</BV><J> set max players in the room.</J><br><br><BV>!respawn [player] -</BV><J> respawn a player.</J><br><br><BV>!time [number] -</BV><J> change maps time.</J><br><br><BV>!link or !unlink [player1] [player2] -</BV><J> link or unlink two player.<br><br>"

    ui.addTextArea(7, "", name, 235, 50, 320, 320, 0x073247, 0x121212, 1, true)
    ui.addTextArea(8, "<p align='center'><a href='event:Helps'><font size ='14' color='#00C17C'>Help<b>", name, 320,
        textArea_y, nil, nil, 0x073247, 0x121212, 1, true)
    ui.addTextArea(9, "<p align='center'><font size ='14' color='#316CCC'><b>#Walls", name, 235, textArea_y, nil, nil,
        0x073247, 0x121212, 1, true)
    ui.addTextArea(10, "<p align='center'><V><a href='event:cerrar'><font color='#F93018'><b>X", name, 495, textArea_y,
        60, 20, 0x073247, 0x121212, 1, true)
    ui.addTextArea(12, "<p align='center'><font size ='14' color='#00C17C'><b>Commands", name, 375, textArea_y, nil, nil,
        0x073247, 0x121212, 1, true)

    if adm[name] then
        ui.addTextArea(11, admCommandMessage .. modCommandsMessage .. translations['en'].commands, name, 248, 100, 300,
            265, 0, 0, 0, true)
    elseif mod[name] then
        ui.addTextArea(11, modCommandsMessage .. translations['en'].commands, name, 248, 100, 300, 265, 0, 0, 0, true)
    else
        ui.addTextArea(11, textCommand, name, 248, 100, 300, 265, 0, 0, 0, true)
    end
end