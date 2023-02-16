INCLUDE ../../../Globals/Globals.ink

{learned_about_shooting_at_hotel == true: ->AwareOfShooting | ->NotAwareOfShooting}

===NotAwareOfShooting===

YOU - Hey there! I'm looking for a Mr Graves, do us a favour and point him out to me? He has a big handlebar moustache if that helps.

BARMAN - Do you see somebody in here with a handlebar moustache!? I sure as hell don't! Although, if you'd turned up 20 minutes ago I'd have said absolutely mister, he's just over there playing poker!

*"Well where is he now?"

BARMAN - Don't you see all the blood on the poker table? He was shot dead! A cold-blooded assassination from the hotel across the road. Better believe I'll be billing them for damages!

~aware_of_shooting = true

**"Ah darnit, I really needed to speak to him!"

BARMAN - Well the church is just up the end of the road there at the other end of town, maybe the priest could help you out?

***"Hmm, maybe I'll try that..."

BARMAN - You stupid or something mister? That was a joke! Anyway, if it was something on his person you wanted, the undertaker just took him away a few minutes ago.

->Thanks

***"Sir I may look it but I ain't that stupid.."

BARMAN - Oh I can well believe it mister, I was just foolin' around! Anyway, if it was something on his person you wanted, the undertaker just took him away a few minutes ago.

->Thanks

===Thanks===

YOU - Well, thanks anyway I guess. Enjoy the rest of your day.

BARMAN - Enjoy? I gotta clean up all this blood now!

*[Leave Conversation]

-> END


===AwareOfShooting===

YOU - Howdy, heard you had yourself a shooting in here.

BARMAN - You just missed it, luckily for you. Look at all the blood! I'm gonna be scrubbing for hours!

*"Anyway, I'm looking for an acquaintance..."

YOU - A fella called Mr Graves. Big handlebar moustache and loves to drink and gamble.

BARMAN - Do you see somebody in here with a handlebar moustache!? I sure as hell don't! Although, if you'd turned up 20 minutes ago I'd have said absolutely mister, he's just over there playing poker!

**"So he left after the shooting?"

YOU - Any idea where he went?

BARMAN - Yessir, to the Undertaker's. In a box.

YOU - Ah darnit, I really needed to speak to him!

BARMAN - Well the church is just up the end of the road there at the other end of town, maybe the priest could help you out?

***"Hmm, maybe I'll try that..."

BARMAN - You stupid or something mister? That was a joke! Anyway, if it was something on his person you wanted, the undertaker just took him away a few minutes ago.

->Thanks

***"Sir I may look it but I ain't that stupid.."

BARMAN - Oh I can well believe it mister, I was just foolin' around! Anyway, if it was something on his person you wanted, the undertaker just took him away a few minutes ago.

->Thanks

**"Please don't tell me he was the one that got shot..."

BARMAN - Afraid so. Dead instantly. I'm sure that handlebar moustache got obliterated.

YOU - Ah darnit, I really needed to speak to him!

BARMAN - Well the church is just up the end of the road there at the other end of town, maybe the priest could help you out?

***"Hmm, maybe I'll try that..."

BARMAN - You stupid or something mister? That was a joke! Anyway, if it was something on his person you wanted, the undertaker just took him away a few minutes ago.

->Thanks

***"Sir I may look it but I ain't that stupid.."

BARMAN - Oh I can well believe it mister, I was just foolin' around! Anyway, if it was something on his person you wanted, the undertaker just took him away a few minutes ago.

->Thanks
