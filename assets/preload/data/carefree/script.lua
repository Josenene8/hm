local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not startedFirstDialogue then
		setProperty('inCutscene', true);
		if week == 'QT' then
			runTimer('startDialogue', 0.8);
		elseif week == 'QTEX' then
			runTimer('startDialogueEX',0.8);
		end
		
		
		startedFirstDialogue = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
	if not allowCountdown and isStoryMode and not startedEndDialogue then
		setProperty('inCutscene', true);
		if week == 'QT' then
			runTimer('startDialogueEnd', 0.8);
		elseif week == 'QTEX' then
			runTimer('startDialogueEndEX',0.8);
		end
		
		startedEndDialogue = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', 'carefree-dialogue-loop');
	elseif tag == 'startDialogueEnd' then
		startDialogue('dialogueEnd', '');
	end

	if tag == 'startDialogueEX' then
		startDialogue('dialogueEX', 'carefree-dialogue-loop');
	elseif tag == 'startDialogueEndEX' then
		startDialogue('dialogueEndEX', '');
	end
end