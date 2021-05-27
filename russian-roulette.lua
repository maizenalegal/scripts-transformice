--[[ Require By: Nettoork#0000]] 
do local a={}local b={}local c={}local d={}local e;e={['perfomance']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(f,g,h)local i=0;for v=1,f do local j=os.time()for k=1,g do h(g)end;i=i+os.time()-j end;return'Estimated Time: '..i/f..' ms.'end},['button']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(...)local l={...}local m=-543212345+l[1]*3;local n=l[9]and'0x2A424B'or'0x314e57'ui.addTextArea(m,'',l[4],l[5]-1,l[6]-1,l[7],l[8],0x7a8d93,0x7a8d93,1,true)ui.addTextArea(m-1,'',l[4],l[5]+1,l[6]+1,l[7],l[8],0x0e1619,0x0e1619,1,true)ui.addTextArea(m-2,'<p align="center"><a href="event:'..l[3]..'">'..l[2]..'</a></p>',l[4],l[5],l[6],l[7],l[8],n,n,1,true)end,['remove']=function(m,o)for k=0,2 do ui.removeTextArea(-543212345+m*3-k,o)end end},['ui-design']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(...)local l={...}if l[6]<0 or l[7]and l[7]<0 then return elseif not l[7]then l[7]=l[6]/2 end;local m=543212345+l[1]*8;ui.addTextArea(m,'',l[3],l[4],l[5],l[6]+100,l[7]+70,0x78462b,0x78462b,1,true)ui.addTextArea(m+1,'',l[3],l[4],l[5]+(l[7]+140)/4,l[6]+100,l[7]/2,0x9d7043,0x9d7043,1,true)ui.addTextArea(m+2,'',l[3],l[4]+(l[6]+180)/4,l[5],(l[6]+10)/2,l[7]+70,0x9d7043,0x9d7043,1,true)ui.addTextArea(m+3,'',l[3],l[4],l[5],20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(m+4,'',l[3],l[4]+l[6]+80,l[5],20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(m+5,'',l[3],l[4],l[5]+l[7]+50,20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(m+6,'',l[3],l[4]+l[6]+80,l[5]+l[7]+50,20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(m+7,l[2],l[3],l[4]+3,l[5]+3,l[6]+94,l[7]+64,0x1c3a3e,0x232a35,1,true)end,['remove']=function(m,o)for k=0,7 do ui.removeTextArea(543212345+m*8+k,o)end end},['text-area-custom']={AUTHOR='Nettoork#0000',_VERSION='2.0',dependencies={},['add']=function(...)local p={...}if type(p[1])=='table'then for k,v in next,p do if type(v)=='table'then if not v[3]then v[3]='nil'end;addTextArea(table.unpack(v))end end else if not p[3]then p[3]='nil'end;b[p[3]..'_'..p[1]]={...}ui.addTextArea(...)end end,['update']=function(m,q,o)if not o then o='nil'end;if not b[o..'_'..m]then return elseif type(q)=='string'then ui.updateTextArea(m,q,o)b[o..'_'..m][2]=q;return end;local r={text=2,x=4,y=5,w=6,h=7,background=8,border=9,alpha=10,fixed=11}for k,v in next,q do if r[k]then b[o..'_'..m][r[k]]=v end end;local s=b[o..'_'..m]ui.addTextArea(s[1],s[2],s[3],s[4],s[5],s[6],s[7],s[8],s[9],s[10],s[11])end,['remove']=function(m,o)if not o then o='nil'end;if b[o..'_'..m]then b[o..'_'..m]=nil end;ui.removeTextArea(m,o)end},['string-to-boolean']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['parse']=function(t)local u={}for k,v in next,t do u[v]=true end;return u end},['database']={AUTHOR='Nettoork#0000',_VERSION='1.1',dependencies={},['create']=function(w,x)if not c[w]then c[w]=x end end,['delete']=function(w)c[w]=nil end,['get']=function(w,...)local y,z={},{...}if not z[1]then return c[w]else for k,v in next,z do if c[w][v]then y[#y+1]=c[w][v]end end;return table.unpack(y)end end,['set']=function(w,...)local A=v;for k,v in next,{...}do if not A then A=v else c[w][A]=v;A=false end end end},['encryption']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['encrypt']=function(t,B,C)if not t or not B or not C or type(t)~='table'or B==''or C==''then return end;local D,E,F,G='','','',''for k in B:gmatch('.')do D=D..k:byte()end;for k in C:gmatch('.')do G=G..k:byte()end;math.randomseed(D)otherSeed=math.random(1000000)local H=pcall(function()for k,v in next,t do if type(v)=='string'or type(v)=='number'then if type(v)=='string'then v="'"..v.."'"end;F=F..' '..v..' '..k:upper()else return end end;F=F..' '..G;for k in F:gmatch('.')do local I=k:byte()+68+math.random(5)otherSeed=otherSeed+k:byte()math.randomseed(otherSeed)if I>=65 and I<=122 and not(I>=91 and I<=96)then I=string.char(I)end;E=E..I end end)math.randomseed(os.time())if not H then return else return E end end,['decrypt']=function(J,B,C)if not J or not B or not C or type(J)~='string'or B==''or C==''then return end;local D,E,K,G='','','',''for k in B:gmatch('.')do D=D..k:byte()end;for k in C:gmatch('.')do G=G..k:byte()end;math.randomseed(D)otherSeed=math.random(1000000)local H=pcall(function()for k in J:gmatch('.')do if k:byte()>=65 and k:byte()<=122 then local I=k:byte()-68-math.random(5)otherSeed=otherSeed+I;math.randomseed(otherSeed)E=E..string.char(I)else K=K..k;if K:len()>=3 then local I=tonumber(K)-68-math.random(5)otherSeed=otherSeed+I;math.randomseed(otherSeed)E=E..string.char(I)K=''end end end end)math.randomseed(os.time())if not H then return else local u,L,M,N,O={},0,0;for k,v in string.gmatch(E,'[^%s]+')do M=M+1 end;for k,v in string.gmatch(E,'[^%s]+')do L=L+1;if L==M and k~=G then return elseif N then if N:sub(-1)=="'"then u[k:lower()]=N:gsub("'",'')N=nil else N=N..' '..k end elseif O then u[k:lower()]=O;O=nil elseif k:sub(1,1)=="'"then N=k else O=k end end;return u end end},['sleep']={AUTHOR='Nettoork#0000',_VERSION='1.1',dependencies={},['loop']=function()local P={}for k,v in next,a do if not v[2]or v[2]<os.time()then if coroutine.status(v[1])=='dead'then P[#P+1]=k else local Q,R=coroutine.resume(v[1])v[2]=R end end end;if P[1]then for k,v in next,P do a[v]=nil end end end,['run']=function(S,T)if not T then T=500 end;a[#a+1]={coroutine.create(function()local U=function(V)coroutine.yield(os.time()+math.floor(V/T)*T)end;S(U)end),timeValue=nil}end},['wait-time']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['check']=function(W,X,Y,Z)if W and X then if not d[W]then d[W]={}end;if not d[W][X]then Z=0;d[W][X]=os.time()+(Y or 1000)end;if d[W][X]<=os.time()or Z and Z==0 then d[W][X]=os.time()+(Y or 1000)return true else return false end end end},['json']={AUTHOR='https://github.com/rxi',_VERSION='0.1.1',dependencies={},['encode']=function(_)local a0;local a1={["\\"]="\\\\",["\""]="\\\"",["\b"]="\\b",["\f"]="\\f",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t"}local a2={["\\/"]="/"}for a3,v in pairs(a1)do a2[v]=a3 end;local function a4(a5)return a1[a5]or string.format("\\u%04x",a5:byte())end;local function a6(_)return"null"end;local function a7(_,a8)local a9={}a8=a8 or{}if a8[_]then error("circular reference")end;a8[_]=true;if _[1]~=nil or next(_)==nil then local V=0;for a3 in pairs(_)do if type(a3)~="number"then error("invalid table: mixed or invalid key types")end;V=V+1 end;if V~=#_ then error("invalid table: sparse array")end;for k,v in ipairs(_)do table.insert(a9,a0(v,a8))end;a8[_]=nil;return"["..table.concat(a9,",").."]"else for a3,v in pairs(_)do if type(a3)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(a9,a0(a3,a8)..":"..a0(v,a8))end;a8[_]=nil;return"{"..table.concat(a9,",").."}"end end;local function aa(_)return'"'.._:gsub('[%z\1-\31\\"]',a4)..'"'end;local function ab(_)if _~=_ or _<=-math.huge or _>=math.huge then error("unexpected number value '"..tostring(_).."'")end;return _ end;local ac={["nil"]=a6,["table"]=a7,["string"]=aa,["number"]=ab,["boolean"]=tostring}a0=function(_,a8)local ad=type(_)local S=ac[ad]if S then return S(_,a8)end;error("unexpected type '"..ad.."'")end;return a0(_)end,['decode']=function(ae)local af;local a2={["\\/"]="/"}local function ag(...)local a9={}for k=1,select("#",...)do a9[select(k,...)]=true end;return a9 end;local ah=ag(" ","\t","\r","\n")local ai=ag(" ","\t","\r","\n","]","}",",")local aj=ag("\\","/",'"',"b","f","n","r","t","u")local ak=ag("true","false","null")local al={["true"]=true,["false"]=false,["null"]=nil}local function am(ae,an,ao,ap)for k=an,#ae do if ao[ae:sub(k,k)]~=ap then return k end end;return#ae+1 end;local function aq(ae,an,ar)local as=1;local at=1;for k=1,an-1 do at=at+1;if ae:sub(k,k)=="\n"then as=as+1;at=1 end end;error(string.format("%s at line %d col %d",ar,as,at))end;local function au(V)local S=math.floor;if V<=0x7f then return string.char(V)elseif V<=0x7ff then return string.char(S(V/64)+192,V%64+128)elseif V<=0xffff then return string.char(S(V/4096)+224,S(V%4096/64)+128,V%64+128)elseif V<=0x10ffff then return string.char(S(V/262144)+240,S(V%262144/4096)+128,S(V%4096/64)+128,V%64+128)end;error(string.format("invalid unicode codepoint '%x'",V))end;local function av(Q)local aw=tonumber(Q:sub(3,6),16)local ax=tonumber(Q:sub(9,12),16)if ax then return au((aw-0xd800)*0x400+ax-0xdc00+0x10000)else return au(aw)end end;local function ay(ae,k)local az=false;local aA=false;local aB=false;local aC;for aD=k+1,#ae do local aE=ae:byte(aD)if aE<32 then aq(ae,aD,"control character in string")end;if aC==92 then if aE==117 then local aF=ae:sub(aD+1,aD+5)if not aF:find("%x%x%x%x")then aq(ae,aD,"invalid unicode escape in string")end;if aF:find("^[dD][89aAbB]")then aA=true else az=true end else local a5=string.char(aE)if not aj[a5]then aq(ae,aD,"invalid escape char '"..a5 .."' in string")end;aB=true end;aC=nil elseif aE==34 then local Q=ae:sub(k+1,aD-1)if aA then Q=Q:gsub("\\u[dD][89aAbB]..\\u....",av)end;if az then Q=Q:gsub("\\u....",av)end;if aB then Q=Q:gsub("\\.",a2)end;return Q,aD+1 else aC=aE end end;aq(ae,k,"expected closing quote for string")end;local function aG(ae,k)local aE=am(ae,k,ai)local Q=ae:sub(k,aE-1)local V=tonumber(Q)if not V then aq(ae,k,"invalid number '"..Q.."'")end;return V,aE end;local function aH(ae,k)local aE=am(ae,k,ai)local aI=ae:sub(k,aE-1)if not ak[aI]then aq(ae,k,"invalid literal '"..aI.."'")end;return al[aI],aE end;local function aJ(ae,k)local a9={}local V=1;k=k+1;while 1 do local aE;k=am(ae,k,ah,true)if ae:sub(k,k)=="]"then k=k+1;break end;aE,k=af(ae,k)a9[V]=aE;V=V+1;k=am(ae,k,ah,true)local aK=ae:sub(k,k)k=k+1;if aK=="]"then break end;if aK~=","then aq(ae,k,"expected ']' or ','")end end;return a9,k end;local function aL(ae,k)local a9={}k=k+1;while 1 do local G,_;k=am(ae,k,ah,true)if ae:sub(k,k)=="}"then k=k+1;break end;if ae:sub(k,k)~='"'then aq(ae,k,"expected string for key")end;G,k=af(ae,k)k=am(ae,k,ah,true)if ae:sub(k,k)~=":"then aq(ae,k,"expected ':' after key")end;k=am(ae,k+1,ah,true)_,k=af(ae,k)a9[G]=_;k=am(ae,k,ah,true)local aK=ae:sub(k,k)k=k+1;if aK=="}"then break end;if aK~=","then aq(ae,k,"expected '}' or ','")end end;return a9,k end;local aM={['"']=ay,["0"]=aG,["1"]=aG,["2"]=aG,["3"]=aG,["4"]=aG,["5"]=aG,["6"]=aG,["7"]=aG,["8"]=aG,["9"]=aG,["-"]=aG,["t"]=aH,["f"]=aH,["n"]=aH,["["]=aJ,["{"]=aL}af=function(ae,an)local aK=ae:sub(an,an)local S=aM[aK]if S then return S(ae,an)end;aq(ae,an,"unexpected character '"..aK.."'")end;if type(ae)~="string"then error("expected argument of type string, got "..type(ae))end;local a9,an=af(ae,am(ae,1,ah,true))an=am(ae,an,ah,true)if an<=#ae then aq(ae,an,"trailing garbage")end;return a9 end}}local aN=1547917483395+2628*10^6;require=function(aO)if aO=='hide-warning'then aN=false else if aN and os.time()>aN then aN=false;print("<R>Warning! You may be using an outdated version of require, check in <i>atelier801.com/topic?f=6&t=880333</i> if this has a better version, otherwise you can disable this warning with require('hide-warning').</R>")end;if e[aO]then if e[aO]['INIT_SCRIPT']and type(e[aO]['INIT_SCRIPT'])=='function'then e[aO]['INIT_SCRIPT']()e[aO]['INIT_SCRIPT']=nil end;return e[aO]elseif aO=='libs'then return e else print('Library "'..aO..'" not found! <i>Require Version: 1.2.2 | Author: Nettoork#0000</i>')return false end end end end

sleep = require("sleep")

for index, value in next, {'AutoShaman', 'AutoNewGame', 'AutoTimeLeft', 'PhysicalConsumables', 'AfkDeath'} do
    tfm.exec['disable' .. value]()
end
tfm.exec.newGame("@7857146")
tfm.exec.setRoomMaxPlayers(30)

jogadores = 0
db = {}
neededPlayers = 6

sangues = {"15ef8a9af77.png","15ef8aaa9c6.png","15ef8ab01f6.png","15ef8abd01f.png","15ef8ac0c82.png","15ef8ac9b50.png","15ef8accd61.png","15ef8ad03ec.png","15ef8ad2e52.png","15ef8ad5ba3.png","15ef8ad8721.png","15ef8add6f9.png"}

words = {
	"FLLMALL",
	"Meu herói não usa capa, usa uma camisa com um F vermelho e um fone verde.",
	"CPVP",
	"tater",
	"louter",
	"jogos eduardo",
	"jogos miguel",
	"galinhas.club",
	"bebês.club",
	"MrCope123",
	"kitty review",
	"h"
}

translations = {
	br = {
		welcome = "Bem-vindo ao <J>#<R>russianroulette<N>. Use o comando <J>!<N>comandos para saber os comandos. Use o comando <J>!<N>tutorial para saber como o jogo funciona. Este é apenas um teste. Caso você ache algum glitch/bug, reporte para Yuri400#0000.",
		playerJoined = "entrou.",
		playerLeft = "saiu. ficou com medokkkkkkkkk",
		starting = "Jogo começando...",
		started = "O jogo começou. Boa sorte.",
		playerDied = " morreu.",
		playerSurvived = " sobreviveu. A arma não atirou.",
		yourTurn = ", é a sua vez. Você tem 5 segundos. Aperte espaço para atirar.",
		tookLong = " morreu por demorar demais para atirar.",
		choosePlayers = "Existem mais pessoas na sala do que o jogo suporta. As primeiras " ..neededPlayers.. " pessoas a falarem \"PLACEHOLDER\" entrarão no jogo.",
		gameEnd = "O jogo terminou!",
		commands = "" -- todo
	},
	en = {
		welcome = "Welcome to <J>#<R>russianroulette<N>. Use <J>!<N>commands to know the commands. Use <J>!<N>tutorial to know how to play the game. This is only a test. If you find any glitch/bug report it to Yuri400#0000.",
		playerJoined = " joined.",
		playerLeft = " left. lol scared",
		starting = "The game is starting...",
		started = "The game started. Good luck.",
		playerDied = " died.",
		playerSurvived = " survived. The gun didn't go off.",
		yourTurn = ", it's your turn. You have 5 seconds. Press space to shoot.",
		tookLong = " died due to tooking too long to shot.",
		choosePlayers = "There are more people in the room than the game supports. The first " ..neededPlayers.. " people to say \"PLACEHOLDER\" will enter the game.",
		gameEnd = "The game has ended!",
		commands = "" -- todo
	}
}

gameInfo = {
	alivePlayers = 0,
	turn = "",
	turnKey = "",
	word = words[math.random(#words)],
	gameStarted = false,
	choosingPlayers = false
}

translation = translations[tfm.get.room.community] or translations.en

function sendMsg(m, c, n)
	local colors = {
		green = "<PT>",
		red = "<R>",
		blue = "<BV>"
	}
	tfm.exec.chatMessage(colors[c].."» <N>" ..m, n)
end


function changeTurn(tookLong)
	if tookLong == true then
		print(db[gameInfo.turnKey].alive)
		print(db[gameInfo.turnKey].hasShot)
		tfm.exec.killPlayer(gameInfo.turn)
		db[gameInfo.turnKey].alive = false
		gameInfo.alivePlayers = gameInfo.alivePlayers - 1
		sendMsg(gameInfo.turn.. "" ..translation.tookLong, "blue")
	else
		-- obrigado stackoverflow eu te amo
		local keyset = {}
		for k in pairs(db) do
		    table.insert(keyset, k)
		end

		local key = keyset[math.random(#keyset)]
		while db[key].name == gameInfo.turn or db[key].alive == false do
			key = keyset[math.random(#keyset)]
		end

		gameInfo.turn = db[key].name
		gameInfo.turnKey = key

		sendMsg(db[key].name.. "" ..translation.yourTurn, "blue")
	end
end

function fireGun(n)
	if n == gameInfo.turn then
		db[gameInfo.turnKey].hasShot = true
		if math.random(6) == 1 then
			tfm.exec.killPlayer(n)
			gameInfo.alivePlayers = gameInfo.alivePlayers - 1
			db[n].alive = false
			sendMsg(n.. "" ..translation.playerDied, "red")
		else
			sendMsg(n.. "" ..translation.playerSurvived, "blue")
		end
	end
end

function endGame()
	db = {}
	gameInfo.gameStarted =  false
	gameInfo.turn = ""
	gameInfo.turnKey = ""
	gameInfo.alivePlayers = 0

	sendMsg(translation.gameEnd, "green")

	sleep.run(function(sleep)
		sleep(5000)
		if jogadores > neededPlayers then
			sendMsg(translation.choosePlayers:gsub("PLACEHOLDER", gameInfo.word), "green")
			gameInfo.choosingPlayers = true
		elseif jogadores == neededPlayers then
			for k,v in pairs(tfm.get.room.playerList) do
				tfm.exec.respawnPlayer(k)
				if not db[k] then
					db[k] = {
						name = k,
						timesSurvived = 0,
						alive = true,
						hasShot = false
					}
				end
			end
			startGame()
		end
	end)
end

function startGame()
	gameInfo.gameStarted = true --gdb
	gameInfo.choosingPlayers = false
	gameInfo.alivePlayers = neededPlayers --gdb

	sendMsg(translation.starting, "red")

	sleep.run(function(sleep)
		sleep(5000)
		changeTurn()

		while gameInfo.alivePlayers ~= 1 do
			sleep(5000)
			if db[gameInfo.turnKey].hasShot == false and db[gameInfo.turnKey].alive == true then
				changeTurn(true)
			else
				changeTurn()
			end
				sleep(5000)
		end
		endGame()
	end)
end

function eventLoop() sleep.loop() end

function eventNewPlayer(n)
	jogadores = jogadores + 1
	if jogadores == 1 then tfm.exec.respawnPlayer(n) end
	system.bindKeyboard(n,32,true)
	sendMsg(translation.welcome, "green", n)
	sendMsg(n.. " " ..translation.playerJoined, "blue")
	tfm.exec.addImage("1799fc7574c.png", "?0", -4, 0, n, 0.817, 0.5)
	tfm.exec.addImage("179aaa7dfa1.png", "!7", -4, 0, n, 0.585, 0.345)

	if gameInfo.gameStarted then return end

	tfm.exec.respawnPlayer(n)
	if not db[n] then
		db[n] = {
			name = n,
			timesSurvived = 0,
			alive = true,
			hasShot = false
		}
	end

	if jogadores == neededPlayers then startGame() end
	
end

table.foreach(tfm.get.room.playerList, eventNewPlayer)

function eventPlayerLeft(n)
	sendMsg(n.. " " ..translation.playerLeft, "red")
	if db[n] then db[n].alive = false end
	jogadores = jogadores - 1
end

function eventPlayerDied(n)
	--tfm.exec.respawnPlayer(n)
	if tfm.get.room.playerList[n].y < 390 then
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 40, tfm.get.room.playerList[n].y - 50, nil)
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 60, tfm.get.room.playerList[n].y - 50, nil)
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 50, tfm.get.room.playerList[n].y - 40, nil)
        tfm.exec.addImage(sangues[math.random(#sangues)], "_1", tfm.get.room.playerList[n].x - 50, tfm.get.room.playerList[n].y - 60, nil)
    end
end

function eventChatMessage(n, m)
	if gameInfo.choosingPlayers then
		if  m == gameInfo.word then
			tfm.exec.respawnPlayer(n)
			if not db[n] then
				db[n] = {
					name = n,
					timesSurvived = 0,
					alive = true,
					hasShot = false
				}
			end

			local keyset = {}
			for k in pairs(db) do
			    table.insert(keyset, k)
			end

			if #keyset == neededPlayers then
				startGame()
			end
		end
	end
end

function eventChatCommand(n, cmd)
	if cmd == "help" or cmd == "ajuda" then
		sendMsg("Roleta-russa é um jogo de azar onde os participantes colocam uma bala — tipicamente apenas uma — em uma das câmaras de um revólver. O tambor do revólver é girado e fechado, de modo a que localização da bala seja desconhecida. Os participantes apontam o revólver para suas cabeças e atiram, correndo o risco da provável morte caso a bala esteja na câmara engatilhada.<BR>Tirado da Wikipedia.", "green", n)
	elseif cmd == "comandos" or cmd == "commands" then
		sendMsg("<J>!<N>ajuda — Mostra como o jogo funciona.", "green", n)
	end
end

function eventKeyboard(n, k)
	if not db[n] then return end
	if n == gameInfo.turn then
		if k == 32 then
			fireGun(n)
		end
	end
end
