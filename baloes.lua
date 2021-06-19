-- Coloque seu nome entre as aspas para poder utilizar os comandos
admin = "Yuri400#0000"

tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.newGame("@7566151")
system.disableChatCommandDisplay("tamanho")
system.disableChatCommandDisplay("resetar")

baloes = {}
info = {}

for i=2801, 2814 do
	table.insert(baloes,i)
end



function eventNewPlayer(n)
	info[n] = { delay = 0 }
	tfm.exec.bindKeyboard(n,69,true,true)
end

table.foreach(tfm.get.room.playerList, eventNewPlayer)
 
function eventKeyboard(p,key,down,x,y)
	vivos=0
	object_id = 35 -- flecha
	power = 30
	
	if key==69 and os.time() > info[p].delay then
		info[p].delay = os.time() + 2000
		if tfm.get.room.playerList[p].isFacingRight then
			tfm.exec.addShamanObject(object_id,x+20,y-10,0,power,0)
		else
			tfm.exec.addShamanObject(object_id,x-20,y-10,0,-power,0)
		end
	end
end

function randomPlayer()
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
