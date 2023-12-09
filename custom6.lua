gg.showUiButton()
local console = "CONSOLE v1.0\n----------------\n"..os.date("(%H:%M)  ").."Script executed.\n"

local update = "28/11/2023"
local vp1Simcash = {}
local timerOfset = {}
local blocker = 0
local blocker2 = 0
local aWait = {}
local ofsetOffsets = {}
local ofsetValues = {}
local zindex = {}
local n = "----------------\n"





local deviceBit = 32

if gg.getTargetInfo().x64 then
    deviceBit = 64
end
gg.sleep("200")
if deviceBit == 32 then
  gg.alert("WARNING\nYou are using 32 bit device. This script not fully tested a 32 bit device.")
  timerOfset = 0x74
end
if deviceBit == 64 then
  timerOfset = 0x9c
end




function valueNotFound()
  console = console..n.."ERROR: Searched value not found.\n"
	gg.alert('Value not found. Please contact the developer. (SimpleCodeStudio)')
    return
    mainMenu()
end






function ofsets()
  gg.sleep("200")
  R = gg.getResults(1)
  local ofset = {}
  ofset[1] = {}
  ofset[1].address = R[1].address + ofsetOffsets
  ofset[1].flags = gg.TYPE_DWORD
  ofset[1].value = ofsetValues
  ofset[1].freeze = false
  gg.addListItems(ofset)
  gg.setValues(ofset)
  gg.setVisible(false)
end





function protectionKey()
  p = gg.prompt({"Protection Key:"}, {""}, {"text"})
  if p == nil then
  else
  if p[1] == "9896" then
    console = console..n.."Protection key is correct.\n"
    gg.toast("\nProtection key is correct.")
    zindex = 2
    mainMenu()
    else
      console = console..n.."ERROR: Protection key is failed.\n"
      gg.alert("Check in Discord #SCS_Communtiy sc-announcements channel")
      return
  end
  end
end





function mainMenu()
  m1 = gg.choice({"| Timer Reseter |", "| Vu Pass T1 All 48k Simcash |", "| 40m Simoleon |", "| Currency Pointer |", "| EXIT |", "| CONSOLE |", "| ABOUT |"},nil,"[BETA x"..deviceBit.."] Premium Version☆ (Updated: "..update..")")
  
  if m1 == 1 then
		if blocker == 1 then
		b = gg.alert("You already reset the time. But do you want use again?", "YES", "NO")
  		if b == 1 then
  		  blocker = 0
  		  gg.toast("\nYou can use again now.")
  		  return
  		end
		end
		if blocker == 0 then
		  console = console..n.."Productions timer searching...\n"
		gg.toast("\nPlease Wait...")
		gg.clearResults()
			gg.searchNumber("25200000",gg.TYPE_DWORD)
		  if gg.getResultsCount() == 0 then
			valueNotFound()
			blocker = 1
			return
			end
		R = gg.getResults(1)
		local ofset = {}
		ofset[1] = {}
		ofset[1].address = R[1].address + 4
		ofset[1].flags = gg.TYPE_DWORD
		ofset[1].freeze = false
		gg.addListItems(ofset)
		gg.setVisible(false)
		get = gg.getListItems("1")
		gg.sleep("200")
		if get[1].value == 0 then
		  ofsetOffsets = 4
		  ofsetValues = 0
		  ofsets()
  		gg.clearResults()
  		gg.clearList()
  			gg.searchNumber("25200000",gg.TYPE_DWORD)
		end
		R2 = gg.getResults(1)
		ofset[1] = {}
		ofset[1].address = R2[1].address - timerOfset
		ofset[1].flags = gg.TYPE_DWORD
		ofset[1].freeze = false
		gg.addListItems(ofset)
		gg.setVisible(false)
		gg.sleep("200")
		get2 = gg.getListItems("1")
		gg.clearResults()
		gg.searchNumber(get2[1].value,gg.TYPE_DWORD)
		local rslt = gg.getResults("120")
		gg.addListItems(rslt)
		rslt = nil
		
		
		local copy = false
		local rslt = gg.getListItems()
		if not copy then gg.removeListItems(rslt) end
		for i, v in ipairs(rslt) do
		v.address = v.address + timerOfset
		if copy then v.name = v.name..' #2' end
		end
		gg.addListItems(rslt)
		t = nil
		copy = nil
		
		
		revert = gg.getListItems()
		local rslt = gg.getListItems()
		for i, v in ipairs(rslt) do
		if v.flags == gg.TYPE_DWORD then
			v.value = "0"
			v.freeze = false
			v.freezeType = gg.FREEZE_NORMAL
		end
		end
		gg.addListItems(rslt)
		gg.setValues(rslt)
		rslt = nil
    gg.clearResults()
    gg.clearList()
		gg.toast("\nSuccessful")
		blocker = 1
		console = console.."Successful.\n"
	  end
	end
  
  if m1 == 2 then
    gg.alert("This function disabled for this reason because game updated.")
    --[[gg.alert("WARNING\nGet this only once!  If your simcash drops below 2000, you can use it again.  Do not forget that your simcash exceeding 49k will result in a ban.")
    gg.clearResults()
    gg.searchNumber("2000;1;1;100;500::326",gg.TYPE_DWORD)
    gg.refineNumber("2000")
    gg.alert("Please Increment +1 your values and tell me.\nDont forgot. You have 15 sec.")
    gg.setVisible(true)
    gg.sleep("15000")
    scp = gg.prompt({"Changed Value:"})
    gg.setVisible(false)
    gg.refineNumber(scp[1])
    get4 = gg.getResults(1)
    r7 = gg.getResults(1)
    local o1 = {}
    o1[1] = {}
    o1[1].address = r7[1].address + 0xB8
    o1[1].flags = gg.TYPE_DWORD
    o1[1].freeze = false
    gg.addListItems(o1)
    gg.sleep("1000")
    gg.toast("please wait..")
    get5 = gg.getListItems("1")
    vp1Simcash = get5[1].value
    gg.sleep("1000")
    ofsetValues = vp1Simcash
    ofsetOffsets = -0x10
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x90
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0xA0
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x130
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x140
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x1D0
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x1E0
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x270
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x280
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x310
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x320
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x3B0
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x3C0
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x450
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x460
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x4F0
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x500
    ofsets()
    gg.sleep("200")
    ofsetValues = vp1Simcash
    ofsetOffsets = 0x590
    ofsets()
    gg.sleep("200")
    ofsetValues = 48000
    ofsetOffsets = 0x5A0
    ofsets()
    gg.sleep("500")
    gg.clearResults()
    gg.clearList()
    gg.toast("\nSuccessful")]]
  end
  
  if m1 == 3 then
    aw = gg.alert("WARNING\nPlease make sure you are in the Vu Pass T1 2000 Simoleon.", "OK WAIT", "IM READY")
	if aw == 1 then
		gg.toast("\nI waiting u...")
		return
	end
	  console = console..n.."Searching Vu Pass simoleon address...\n"
    gg.toast("\nPlease Wait...")
    gg.clearResults()
    gg.searchNumber("2000;1;1;100;500::326",gg.TYPE_DWORD)
    if gg.getResultsCount() == 0 then
		valueNotFound()
    end
    gg.refineNumber("2000")
    gg.getResults("200")
    gg.editAll("40000000",gg.TYPE_DWORD)
    gg.toast("\nSuccessful")
    gg.clearResults()gg.clearList()
    console = console.."Simoleon are set to 40.000.000.\n"
  end
  
  if m1 == 4 then
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber("-288",gg.TYPE_DWORD)
    if gg.getResultsCount() >= 5 then
      gg.alert("A high degree of results were found.  Please stay in your phone's main menu for about 1 minute, then enter the game again. This may help fix it.")
      return
    end
    gg.sleep("200")
    R = gg.getResults("4")
    local ofset = {}
    ofset[1] = {}
    ofset[1].address = R[3].address + 0x10
    ofset[1].flags = gg.TYPE_DWORD
    ofset[1].freeze = false
    gg.addListItems(ofset)
    cr = gg.getListItems("1")
    gg.sleep("200")
    gg.clearResults()
    gg.searchNumber(cr[1].address, gg.TYPE_QWORD)
    function ofsets()
      Rr = gg.getResults(1)
      local o = {}
      o[1] = {}
      o[1].address = Rr[1].address + ofsetOffsets
      o[1].flags = gg.TYPE_DWORD
      o[1].freeze = false
      gg.addListItems(o)
      gg.setVisible(false)
    end
    gg.clearList()
    ofsetOffsets = 0x100
    gg.sleep("200")
    ofsets()
    gg.clearResults()
    gg.toast("\nSuccessful")
  end
  
  if m1 == 5 then
    console = console..n.."Exiting..."
    print("EXIT SUCCESSFUL\n\n"..console)
    gg.setVisible(true)
    os.exit()
  end
  
  if m1 == 6 then
	  c = gg.alert(console, "OK",nil, "INPUT")
	  if c == 3 then
	    cp = gg.prompt({'Command Module (Use "help" command for help. )'}, {""}, {"text"})
	     if cp == nil then
	     else
	     if cp[1] == "help" then
	       console = console..n.."User: help\nsave = Save command is can save your important values.\ncopySave = This command can copy your saved values.\nsimcash = Achievements value research module. This can work for high values.\n"
	       gg.sleep("200")
	       gg.alert(console)
	     end
	     if cp[1] == "simcash" then
	       sc = gg.prompt({"Achievements require:", "Simcash value:"})
	       if sc == nil then
	       else
	         console = console..n.."User: simcash\nSearching Achievements... ("..sc[1].." "..sc[2]..")\n"
	         gg.clearResults()
	         gg.searchNumber(sc[1]..";"..sc[2].."::8",gg.TYPE_DWORD)
	         if gg.getResultsCount() == 0 then
            valueNotFound()
            return
	         end
	         gg.getResults(2)
	         gg.editAll("0;48000",gg.TYPE_DWORD)
	         console = console.."Successful.\n"
	         gg.alert(console)
	       end
	     end
	     if cp[1] == "save" then
	       sp = gg.prompt({"Value:", "Id: (Max 100)"})
	       if sp == nil then
	       else
	       cId[sp[2]] = sp[1]
	       console = console..n.."User: save \nValue "..sp[1].." saved to Id "..sp[2].."\n"
	       gg.setVisible(true)
	       gg.alert(console)
	       end
	     end
	     if cp[1] == "copySave" then
	       csp = gg.prompt({"Select Id for copy value."})
	       if csp == nil then
	       else
	       gg.copyText(cId[csp[1]])
	       console = console..n.."User: copySave \nId "..csp[1].." copied to clipboard. (Saved value is "..cId[csp[1]]..")\n"
	       gg.setVisible(true)
	       gg.alert(console)
	       end
	       else
	         console = console..n.."Unknown Command.\n"
	     end
	     end
	   end
  end
  
  if m1 == 7 then
    gg.alert("SCRIPT ABOUT \n---------------- \nVersion: 1.0_b \nSituation: BETA \nCurrently Bit Version: x"..deviceBit.." \nStability: %66 \nDeveloper: SimpleCodeStudio")
  end
end




gg.toast("\nScript Loaded.")

zindex = 1
while true do
  if gg.isClickedUiButton() then
    gg.setVisible(false)
    if zindex == 2 then
      mainMenu()
    end
    if zindex == 1 then
      protectionKey()
    end
  end
end