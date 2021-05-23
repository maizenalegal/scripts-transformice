for index, value in next, {'AutoShaman', 'AutoNewGame', 'AutoTimeLeft', 'PhysicalConsumables', 'AfkDeath'} do
    tfm.exec['disable' .. value]()
end
for i, v in next, {"skip", "forceskip", "afk", "skiptoggle","ajuda"} do
    system.disableChatCommandDisplay(v)
end
tfm.exec.setRoomMaxPlayers(20)
tfm.exec.newGame("@7731076", true)

vivos = 0
afks = 0
plrs = {}
skips = 0
podeSkip = true
--primeiraVez = true
admin1 = "Yuri400#0000"
admin2 = "Sr_timbo#6367"

for name,player in pairs(tfm.get.room.playerList) do
    plrs[name] = {
        powerUp = 2,
        vidas = 1,
        estaAfk = false,
        usouPowerUp = false,
        votouSkip = false,
        --primeiraVez = true,
        seMovendo = 0,
        naoMovendo = 0,
        mostrarMsg = true
    }
end

sangues = {"15ef8a9af77.png","15ef8aaa9c6.png","15ef8ab01f6.png","15ef8abd01f.png","15ef8ac0c82.png","15ef8ac9b50.png","15ef8accd61.png","15ef8ad03ec.png","15ef8ad2e52.png","15ef8ad5ba3.png","15ef8ad8721.png","15ef8add6f9.png"}

ui.addTextArea(1,"<a href='event:pup1'><CH>Vida dupla</a>",nil,30,50,0,0,0xffffff,0x39ff14,1,true)
ui.addTextArea(2,"<a href='event:pup2'><CH>Teleporte</a>",nil,30,80,0,0,0xffffff,0x39ff14,1,true)
--ui.addTextArea(3,"<a href='event:lojinha'><CH>Lojinha</a>",nil,30,370,0,0,0xffffff,0x808080,1,true)

function eventTextAreaCallback(id,n,evnt)
    if not plrs[n] then return end
    if plrs[n].usouPowerUp == true then
        tfm.exec.chatMessage("<PT>» <N>Você já usou seu power up!",n)
    return end
    if id == 1 then
        if plrs[n].powerUp == 1 then
            tfm.exec.chatMessage("<PT>» <N>Você já está usando este power up.",n)
        else
            plrs[n].powerUp = 1
            plrs[n].vidas = 2
            tfm.exec.chatMessage("<PT>» <N>O power up foi trocado.",n)
        end
    elseif id == 2 then
        if plrs[n].powerUp == 2 then
            tfm.exec.chatMessage("<PT>» <N>Você já está usando este power up.",n)
        else
            plrs[n].powerUp = 2
            tfm.exec.chatMessage("<PT>» <N>O power up foi trocado. Aperte E para usar.",n)
            plrs[n].vidas = 1
        end
    elseif id == 3 then
        ui.addTextArea(4,"<font size='30'>                     Lojinha                     <font size='20'><a href='event:fecharLojinha'>x", n,130,60,600,300,0x353839,0x000000,1,true)
    elseif evnt == "fecharLojinha" then
        ui.removeTextArea(4)
    end
end

function eventPlayerDied(n)
    if not plrs[n] then return end
    if plrs[n].vidas == 1 then
        vivos = vivos - 1
    elseif plrs[n].vidas == 2 then
        tfm.exec.respawnPlayer(n)
        plrs[n].vidas = plrs[n].vidas - 1
    end
    tfm.exec.chatMessage("<PT>» <N>Você morreu! ¯\\_(ツ)_/¯",n)
    if tfm.get.room.playerList[n].y < 390 then
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 40, tfm.get.room.playerList[n].y - 50, nil)
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 60, tfm.get.room.playerList[n].y - 50, nil)
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 50, tfm.get.room.playerList[n].y - 40, nil)
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 50, tfm.get.room.playerList[n].y - 60, nil)
    end
    print(vivos)
    if vivos == 0 then
        tfm.exec.newGame("@7731076", true)
    end
end

function eventPlayerWon(n)
    if not plrs[n] then return end
    if plrs[n].vidas == 1 and plrs[n].powerUp == 1 then
        plrs[n].vidas = 2
    end
    tfm.exec.chatMessage("<PT>» <N>"..n.." chegou na toca!")
    vivos = vivos - 1
    if vivos == 0 then
        tfm.exec.newGame("@7731076", true)
    end
end

function eventNewPlayer(n)
    if not plrs[n] then
        plrs[n] = {
            powerUp = 2,
            vidas = 1,
            estaAfk = false,
            usouPowerUp = false,
            votouSkip = false,
            --primeiraVez = true,
            seMovendo = 0,
            naoMovendo = 0,
            mostrarMsg = true
        }
    end
	ui.setMapName("<J>#<N>collapse                                                                                                                                                                                    ")
    for i, v in next, {69, 87, 65, 83, 68, 39, 37, 38, 40, 32} do
        system.bindKeyboard(n,v,true)
    end
    ui.addTextArea(1,"<a href='event:pup1'><CH>Vida dupla</a>",n,30,50,0,0,0xffffff,0x39ff14,1,true)
    ui.addTextArea(2,"<a href='event:pup2'><CH>Teleporte</a>",n,30,80,0,0,0xffffff,0x39ff14,1,true)
    tfm.exec.chatMessage("<PT>» <N>Bem-vindo ao <J>#<N>collapse, aqui, você deve sobreviver e desviar das pedras até chegar na toca. Use o comando !ajuda para ajuda.<BR>Caso você encontre algum bug, fale com <VP><b>Yuri400#0000</b>",n)
end

function eventNewGame()
    ui.setMapName("<J>#<N>collapse                                                                                                                                                                                    ")
    tfm.exec.setGameTime(60)
    --primeiraVez = true
    vivos = 0
    skips = 0
	
	for i=1,10 do
    	tfm.exec.addPhysicObject(math.random(0,100000000),math.random(300,2700), 350,{
            type = 5,
            width = math.random(30,70),
            height = math.random(30,50),
            foreground = true,
            dynamic = false
        })
	end

    for name,player in pairs(tfm.get.room.playerList) do
        if not plrs[n] then break end
        system.bindKeyboard(name,69,true)
        if plrs[name].estaAfk == true then
            tfm.exec.killPlayer(name)
            tfm.exec.chatMessage("<PT>» <N>Você morrerá enquanto estiver no modo afk, caso queira desativar o modo afk, digite <PT><b>!afk</b>.",name)
        end
        vivos = vivos + 1
        tfm.exec.giveMeep(name)
        plrs[name].usouPowerUp = false
        plrs[name].votouSkip = false
    end
end

function eventLoop(tp,tf)

    choverObjetos = true

    tPassado = tp
    tFaltando = tf

    if choverObjetos then
        tfm.exec.addShamanObject("85",math.random(0,3000), 100)
        tfm.exec.addPhysicObject(math.random(0,100000000),math.random(0,3000), 100,{
        type = 5,
        width = math.random(30,70),
        height = math.random(30,100),
        foreground = true,
        dynamic = true,
        angle = math.random(0,360)})
    end

    tfm.exec.displayParticle(math.random(26,27),math.random(0,3000), 300)
    tfm.exec.displayParticle(math.random(26,27),math.random(0,3000), 300)

    if tf < 100 then
        tfm.exec.chatMessage("<PT>» <N>Acabou o tempo!")
        tfm.exec.newGame("@7731076", true)
    end
	if #tfm.get.room.playerList == 1 or #tfm.get.room.playerList == afks - 1 then return end
	local time = os.time()
	for k, v in next, tfm.get.room.playerList do
		if not plrs[k] then return end
		if not v.isDead then
			if plrs[k].seMovendo == 0 then
				if v.vx == 0 then
					if plrs[k].naoMovendo < 3 then
						plrs[k].naoMovendo = plrs[k].naoMovendo + .5
					else
						plrs[k].seMovendo = os.time() + 5000
						if plrs[k].mostrarMsg then
							tfm.exec.chatMessage("<PT>» <N>Você morrerá caso não se mover constantemente! Digite !stop para não receber mais essa mensagem.", k)
						end
						plrs[k].naoMovendo = 0
					end
				end
			else
				if time > plrs[k].seMovendo then
                    plrs[k].estaAfk = true
                    --primeiraVez = false
                    tfm.exec.killPlayer(k)
                   -- if plrs[name].primeiraVez then
                        --plrs[name].primeiraVez = false
                        afks = afks + 1
                        tfm.exec.chatMessage("<PT>» <N>Você entrou no modo afk por não se mover constantemente, caso queira desativar o modo afk, digite <PT><b>!afk</b>.",k)
                    --end
				end
			end
		end
	end
end

function eventChatCommand(n, cmd)
    if not plrs[n] then return end
    if cmd == "afk" then
        if plrs[n].estaAfk == false then
            afks = afks + 1
            plrs[n].estaAfk = true
            tfm.exec.killPlayer(n)
            tfm.exec.chatMessage("<PT>» <N>Você entrou no modo afk, caso queira desativar o modo afk, digite <PT><b>!afk</b>.",n)
        else
            afks = afks - 1
            plrs[n].estaAfk = false
            tfm.exec.chatMessage("<PT>» <N>Você saiu do modo afk, você voltará na próxima partida.",n)
        end

    elseif cmd == "skip" then
        if plrs[n].votouSkip then
            tfm.exec.chatMessage("<PT>» <N>Você já votou para pular a partida.",n)
        elseif podeSkip == false then
            tfm.exec.chatMessage("<PT>» <N>O comando de skip está desativado para esta partida.",n)
        else
            if #tfm.get.room.playerList <= 4 and #tfm.get.room.playerList >= 2 then
                skips = skips + 1
            	tfm.exec.chatMessage("<PT>» <N>Você votou para pular a partida.",n)
            	if skips == #tfm.get.room.playerList - 2 then
                	tfm.exec.chatMessage("<PT>» <N>A partida foi pulada.")
                	tfm.exec.newGame("@7731076", true)
                end
            elseif #tfm.get.room.playerList >=5 then
            	skips = skips + 1
            	tfm.exec.chatMessage("<PT>» <N>Você votou para pular a partida." ,n)
            	if skips == math.floor(#tfm.get.room.playerList / 3) then
                	tfm.exec.chatMessage("<PT>» <N>A partida foi pulada.")
                	tfm.exec.newGame("@7731076", true)
                end
			else
                skips = skips + 1
            	tfm.exec.chatMessage("<PT>» <N>Você votou para pular a partida.",n)
            	if skips == 2 then
                	tfm.exec.chatMessage("<PT>» <N>A partida foi pulada.")
                	tfm.exec.newGame("@7731076", true)
                end
			end
    	end

    elseif cmd == "skiptoggle" then
        if n == admin2 or n == admin1 then
			if podeSkip == false then
				podeSkip = true
			elseif podeSkip then
				podeSkip = false
			end
        end

    elseif cmd == "forceskip" then
        if n == admin2 or n == admin1 then
			tfm.exec.chatMessage("<PT>» <N>A partida foi pulada forçadamente.")
			tfm.exec.newGame("@7731076", true)
        end

	elseif cmd == "ajuda" then
		tfm.exec.chatMessage("<PT>» <V>Como usar os powerups<N>: Para usar um powerup, você deve apertar E no teclado, você pode escolher um powerup clicando nos botões no canto superior esquerdo.<BR><PT>» <V>Comandos<N>: <VP>!afk<N> ativa o modo afk. <VP>!skip<N> vota para pular a partida.", n)

    elseif cmd == "stop" then
        plrs[n].mostrarMsg = false
        tfm.exec.chatMessage("<PT>» <N>Feito!")
    end
end

function eventKeyboard(n,k)
    plrs[n].seMovendo = true
    if k == 69 then
        if plrs[n].powerUp == 2 and plrs[n].usouPowerUp == false then
            tfm.exec.movePlayer(n, tfm.get.room.playerList[n].x + math.random(100,500),tfm.get.room.playerList[n].y)
            plrs[n].usouPowerUp = true
        elseif plrs[n].powerUp == 1 then
        else
            tfm.exec.chatMessage("<PT>» <N>Você já usou seu power up!",n)
        end
    end
end
