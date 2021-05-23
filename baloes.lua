tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.newGame("@7566151")

-- Coloque seu nome entre as aspas para poder utilizar os comandos

admin="Yuri400#0000"

baloes={"2801","2802","2803","2804","2805","2806","2807","2808","2809","2810","2811","2812","2813","2814"}

system.disableChatCommandDisplay("tamanho")
system.disableChatCommandDisplay("resetar")

local info = {}
eventNewPlayer = function(n)
    info[n] = { delay = 0 }
    tfm.exec.bindKeyboard(n,69,true,true)
end
table.foreach(tfm.get.room.playerList, eventNewPlayer)
 
vivos=0
 
object_id = 35 -- id do objeto
 
power = 30 -- velocidade do objeto
 
function eventKeyboard(p,key,down,x,y)
    if key==69 and os.time() > info[p].delay then
        info[p].delay = os.time() + 2000
        if tfm.get.room.playerList[p].isFacingRight then
          peidei = tfm.exec.addShamanObject(object_id,x+20,y-10,0,power,0)
        else
          qcheireesse = tfm.exec.addShamanObject(object_id,x-20,y-10,0,-power,0)
        end
    end
end
randomPlayer = function()
    local p = {}
    for k in next, tfm.get.room.playerList do
        p[#p + 1] = k
    end
    return p[math.random(#p)]
end

function eventLoop(tp,tf)
		if tf < 1 then
			tfm.exec.newGame("@7566151")
		elseif tp < 10000 then
			tfm.exec.addShamanObject(baloes[math.random(#baloes)],math.random(0,800),1100)
end
end

function eventPlayerWon(p)
tfm.exec.newGame("@7566151")
end

function eventChatCommand(n, message)
			if n == admin then
				 if message:sub(0,7) == "tamanho" then
				for name in next, tfm.get.room.playerList do
    tfm.exec.changePlayerSize(name,message:sub(9))
end
			elseif message == "resetar" then
				tfm.exec.newGame("@7566151")
end
end
end
