tfm.exec.disableAutoNewGame();
tfm.exec.disableDebugCommand();

troll={"@6135200","@5932565","@6110650","@6526938","@6498941","@6085234","@5018552","@5528077","@5018625","@5858647","@1395371","@6207985","@6218403","@6329560","@6345898","@6179538","@5622009","@5875455","@6192664","@5018731","@5858583","@5858585","@5966424","@5966445","@5704644","@6173496","@5436800","@6329565","@5018771","@6184390","@5858595","@5966432","@6094395","@5836826","@5858595","@5858625","@5858639","@3195916","@6124832","@5602310","@6244710","@6250422","@6299335","@5595910","@6526776","@6498946","@6813933","@585864","@6147952","@6474382","@3765697","@6192402","@6575209","@6222662","@7053281","@6975013","@3352785","@2959211","@4117984","@6551334","@6548448","@6290639","@6290664","@5836056","@549590","@6162603","@6207848","@6127710","@6127719"}

function eventNewPlayer(plr)
	tfm.exec.setUIMapName("Vanilla com mapas troll")
	tfm.exec.chatMessage("<VP>We do a little trolling.</b>",plr)
end

function eventNewGame()
	tfm.exec.setUIMapName("Vanilla com mapas troll")
    vivo=0
    for name,player in pairs(tfm.get.room.playerList) do
        vivo=vivo+1
    end
end


function eventPlayerDied(name)
	tfm.exec.chatMessage("<VP>We do a little trolling.</b>",name)
    vivo=vivo-1
end

function eventPlayerWon(name)
    vivo=vivo-1
end

function eventLoop(tempoPassado, tempoFaltando)
    if vivo == 0 or tempoFaltando < 1000 then
		if math.random(2) == 1 then
        	tfm.exec.newGame(tostring(math.random(1,70)));
		else
			tfm.exec.newGame(mapas[math.random(#troll)]);
		end
    end
end

if math.random(2) == 1 then
	tfm.exec.newGame(tostring(math.random(1,70)));
else
	tfm.exec.newGame(mapas[math.random(#troll)]);
end
