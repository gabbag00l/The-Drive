INCLUDE ../../Globals/Globals.ink


{told_to_get_proof == true: ->GoGetProof|->CheckUndertakerBusy}

===CheckUndertakerBusy===

{undertaker_too_busy == false: ->Howdy| ->GoAway}

===Howdy===
YOU - Howdy Mr Undertaker!

UNDERTAKER - Please! My name is Mr Grim!

*"Not much better honestly..."

{aware_of_shooting == true: ->FirstContinue| ->UndertakerTooBusy}
*[Ignore and Continue...]

{aware_of_shooting == true: ->FirstContinue| ->UndertakerTooBusy}

===FirstContinue===

YOU - I believe you've just retrieved the remains of - 

UNDERTAKER - Please Sir! I'm too busy for chit chat, I'm burying a dozen men a week out here nowadays!

YOU - Well like I was trying to say, your most recent one is an associate of mine and I'd like to take a rifle through his pockets...

*"If you don't mind..."
->PissOff

*"Which is not as sinister as it sounds, I might add!"
->PissOff

===PissOff===

UNDERTAKER - SIR! I must insist you kindly piss off! Come back later with $5 and proof you and the dearly departed were acquainted and maybe I'll give you two minutes to get what you needed!

*"Uhh, okay..."

YOUR BRAIN - How the hell am I gonna do that?

UNDERTAKER - Don't forget the $5!

~told_to_get_proof = true

**[Leave Conversation]

->END

===UndertakerTooBusy===

YOU - You look busy, Mr Grim.

UNDERTAKER - Of course I am! The sheriff here doesn't seem to understand it's his job to uphold the law and stop crime, and as a result I'm burying a dozen men a week! So please, piss off!

YOU - Ah, I apologise. Looks like I stopped by at a bad time.

UNDERTAKER - It's always a bad time!

~undertaker_too_busy = true

*[Leave]

->END

===GoAway===
{aware_of_shooting == true: ->FirstContinue}

UNDERTAKER - I told you to piss off!

*[Leave]
->END


===GoGetProof===

UNDERTAKER - Come back later with proof of your acquaintance and $5!

*[Leave]
->END