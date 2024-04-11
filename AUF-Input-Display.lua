--The screen position of the input display
PositionX = 414
PositionY = 48
ControlStickScale = 0.20

--Individual X and Y positions of each object
LeftStickPositionX = PositionX
LeftStickPositionY = PositionY
RightStickPositionX = PositionX + 76
RightStickPositionY = PositionY
AButtonPositionX = RightStickPositionX + 80
AButtonPositionY = RightStickPositionY - 18
BButtonPositionX = AButtonPositionX - 28
BButtonPositionY = AButtonPositionY + 20
YButtonPositionX = AButtonPositionX
YButtonPositionY = AButtonPositionY - 22
XButtonPositionX = AButtonPositionX + 44
XButtonPositionY = AButtonPositionY - 2
ZButtonPositionX = AButtonPositionX + 41
ZButtonPositionY = AButtonPositionY - 23
DpadPositionX = AButtonPositionX - 42
DpadPositionY = AButtonPositionY - 8
SButtonPositionX = LeftStickPositionX + ((RightStickPositionX-LeftStickPositionX)/2) - 7
SButtonPositionY = LeftStickPositionY - 32
RButtonPositionX = RightStickPositionX - 32
RButtonPositionY = RightStickPositionY - 45
LButtonPositionX = LeftStickPositionX - 32
LButtonPositionY = LeftStickPositionY - 45

ControlStickPolygon = {{-128,0},{-95,95},{0,128},{95,95},{128,0},{95,-95},{0,-128},{-95,-95}}
ControlStickPolygonOutline = {{-128,0},{-95,95},{0,128},{95,95},{128,0},{95,-95},{0,-128},{-95,-95}}

--Scales the control stick by the scaling factor
for i=1,8 do
	for j=1,2 do
		ControlStickPolygon[i][j] = ControlStickPolygon[i][j]*(ControlStickScale*1.2)
	end
end
for i=1,8 do
	for j=1,2 do
		ControlStickPolygonOutline[i][j] = ControlStickPolygonOutline[i][j]*(ControlStickScale*1.3)
	end
end


while true do
	
	if bit.check(memory.read_u8(0x803C1340),0) then ButtonA = 'A' else ButtonA = '' end
	if bit.check(memory.read_u8(0x803C1340),1) then ButtonB = 'B' else ButtonB = '' end
	if bit.check(memory.read_u8(0x803C1340),2) then ButtonX = 'X' else ButtonX = '' end
	if bit.check(memory.read_u8(0x803C1340),3) then ButtonY = 'Y' else ButtonY = '' end
	if bit.check(memory.read_u8(0x803C1340),4) then ButtonS = 'S' else ButtonS = '' end
	if bit.check(memory.read_u8(0x803C1341),0) then ButtonDpadL = 'L' else ButtonDpadL = '' end
	if bit.check(memory.read_u8(0x803C1341),1) then ButtonDpadR = 'R' else ButtonDpadR = '' end
	if bit.check(memory.read_u8(0x803C1341),2) then ButtonDpadD = 'D' else ButtonDpadD = '' end
	if bit.check(memory.read_u8(0x803C1341),3) then ButtonDpadU = 'U' else ButtonDpadU = '' end
	if bit.check(memory.read_u8(0x803C1341),4) then ButtonZ = 'Z' else ButtonZ = '' end
	if bit.check(memory.read_u8(0x803C1341),5) then ButtonR = 'R' else ButtonR = '' end
	if bit.check(memory.read_u8(0x803C1341),6) then ButtonL = 'L' else ButtonL = '' end

	LeftStickX = memory.read_u8(0x803C1342)-128
	LeftStickY = memory.read_u8(0x803C1343)-128
	RightStickX = memory.read_u8(0x803C1344)-128
	RightStickY = memory.read_u8(0x803C1345)-128

	ControllerInput = memory.read_u8(0x803C1340)

	TextToDraw = ControllerInput .. '\n' .. 
	ButtonA .. ' ' .. 
	ButtonB .. ' ' .. 
	ButtonX .. ' ' .. 
	ButtonY .. ' ' .. 
	ButtonS .. ' ' .. 
	ButtonDpadL .. ' ' ..
	ButtonDpadR .. ' ' ..
	ButtonDpadD .. ' ' ..
	ButtonDpadU .. ' ' ..
	ButtonZ .. ' ' ..
	ButtonR .. ' ' ..
	ButtonL .. ' ' ..
	LeftStickX .. ' ' ..
	LeftStickY .. ' ' ..
	RightStickX .. ' ' ..
	RightStickY

	--Drawing the gray and yellow backgrounds for the control stick and C stick.
	gui.drawPolygon(ControlStickPolygonOutline,LeftStickPositionX,LeftStickPositionY,"#333333", "#333333")
	gui.drawPolygon(ControlStickPolygon,LeftStickPositionX,LeftStickPositionY,"#5b5b5b", "#5b5b5b")
	gui.drawPolygon(ControlStickPolygonOutline,RightStickPositionX,RightStickPositionY,"#765900", "#765900")
	gui.drawPolygon(ControlStickPolygon,RightStickPositionX,RightStickPositionY,"#bf9000", "#bf9000")

	--Drawing text for the button presses
	
	--gui.drawText(PositionX,PositionY,ButtonA,'#00c93c',nil,16,'Arial','bold')
	--gui.drawText(PositionX,PositionY,TextToDraw,'white',nil,16,'Arial','bold')

	--Drawing the button backgrounds, which are seen when the button isn't being pressed
	gui.drawEllipse(AButtonPositionX,AButtonPositionY,40,40,'#000000','#002c0d')
	gui.drawEllipse(BButtonPositionX,BButtonPositionY,24,24,'#000000','#640000')
	gui.drawEllipse(YButtonPositionX,YButtonPositionY,36,18,'#000000','#303030')
	gui.drawEllipse(XButtonPositionX,XButtonPositionY,18,36,'#000000','#303030')
	gui.drawEllipse(ZButtonPositionX,ZButtonPositionY,16,16,'#000000','#20124d')
	gui.drawEllipse(SButtonPositionX,SButtonPositionY,14,14,'#000000','#303030')
	gui.drawRectangle(LButtonPositionX+4,LButtonPositionY,56,8,'#000000','#303030')
	gui.drawRectangle(RButtonPositionX+4,RButtonPositionY,56,8,'#000000','#303030')

	--Drawing the D-pad background
	gui.drawRectangle(DpadPositionX-1, DpadPositionY-1, 34, 12,'#000000','#000000')
	gui.drawRectangle(DpadPositionX+10, DpadPositionY-12, 12, 34,'#000000','#000000')
	gui.drawRectangle(DpadPositionX, DpadPositionY, 32, 10,'#303030','#303030')
	gui.drawRectangle(DpadPositionX+11, DpadPositionY-11, 10, 32,'#303030','#303030')

	if ButtonA == 'A' then
		gui.drawEllipse(AButtonPositionX,AButtonPositionY,40,40,'#006b20','#00b135')
		gui.drawText(AButtonPositionX+11,AButtonPositionY+10,ButtonA,'Black',nil,18,'Arial','bold')
	end
	if ButtonB == 'B' then
		gui.drawEllipse(BButtonPositionX,BButtonPositionY,24,24,'#640000','#cc0000')
		gui.drawText(BButtonPositionX+4,BButtonPositionY+4,ButtonB,'Black',nil,15,'Arial','bold')
	end
	if ButtonY == 'Y' then
		gui.drawEllipse(YButtonPositionX,YButtonPositionY,36,18,'#303030','#999999')
		gui.drawText(YButtonPositionX+11,YButtonPositionY+2,ButtonY,'Black',nil,14,'Arial','bold')
	end
	if ButtonX == 'X' then
		gui.drawEllipse(XButtonPositionX,XButtonPositionY,18,36,'#303030','#999999')
		gui.drawText(XButtonPositionX+3,XButtonPositionY+10,ButtonX,'Black',nil,14,'Arial','bold')
	end
	if ButtonZ == 'Z' then
		gui.drawEllipse(ZButtonPositionX,ZButtonPositionY,16,16,'#20124d','#6e45ef')		
		gui.drawText(ZButtonPositionX+3,ZButtonPositionY+1,ButtonZ,'Black',nil,12,'Arial','bold')
	end
	if ButtonDpadU == 'U' then
		gui.drawRectangle(DpadPositionX+11, DpadPositionY-11, 10, 9,'#999999','#999999')
	end
	if ButtonDpadD == 'D' then
		gui.drawRectangle(DpadPositionX+11, DpadPositionY+12, 10, 9,'#999999','#999999')
	end
	if ButtonDpadL == 'L' then
		gui.drawRectangle(DpadPositionX, DpadPositionY, 9, 10,'#999999','#999999')
	end
	if ButtonDpadR == 'R' then
		gui.drawRectangle(DpadPositionX+23, DpadPositionY, 9, 10,'#999999','#999999')
	end
	if ButtonS == 'S' then
		gui.drawEllipse(SButtonPositionX,SButtonPositionY,14,14,'#303030','#999999')
		gui.drawText(SButtonPositionX+2,SButtonPositionY+1,ButtonS,'Black',nil,10,'Arial','bold')
	end
	if ButtonL == 'L' then
		gui.drawRectangle(LButtonPositionX+4,LButtonPositionY,56,8,'#303030','#999999')
	end
	if ButtonR == 'R' then
		gui.drawRectangle(RButtonPositionX+4,RButtonPositionY,56,8,'#303030','#999999')
	end

	--Drawing the line for the left stick
	gui.drawLine(LeftStickPositionX+1,LeftStickPositionY+1,LeftStickPositionX+(LeftStickX*ControlStickScale)+1,LeftStickPositionY-(LeftStickY*ControlStickScale)+1,'black')
	gui.drawLine(LeftStickPositionX,LeftStickPositionY,LeftStickPositionX+(LeftStickX*ControlStickScale),LeftStickPositionY-(LeftStickY*ControlStickScale),'white')
	gui.drawEllipse(LeftStickPositionX+(LeftStickX*ControlStickScale)-2,LeftStickPositionY-(LeftStickY*ControlStickScale)-2,4,4,'#9a9a9a','#9a9a9a')		


	--Drawing the line for the right stick
	gui.drawLine(RightStickPositionX+1,RightStickPositionY+1,RightStickPositionX+(RightStickX*ControlStickScale)+1,RightStickPositionY-(RightStickY*ControlStickScale)+1,'black')
	gui.drawLine(RightStickPositionX,RightStickPositionY,RightStickPositionX+(RightStickX*ControlStickScale),RightStickPositionY-(RightStickY*ControlStickScale),'white')
	gui.drawEllipse(RightStickPositionX+(RightStickX*ControlStickScale)-2,RightStickPositionY-(RightStickY*ControlStickScale)-2,4,4,'#f4b800','#f4b800')		

	
	emu.frameadvance();
end