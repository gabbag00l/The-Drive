INCLUDE ../../Globals/Globals.ink

VAR spoke_about_undertaker = false
VAR spoke_about_chef = false




{told_to_get_proof == false: ->WaitingForDelivery | ->GetProof}

===WaitingForDelivery===

SHOPKEEPER - Sorry Mister, afraid you'll have to come back later. I'm unloading a delivery here.

*[Leave]
->END


===GetProof===

SHOPKEEPER - Hey there mister, what can I do for - 

SHOPKEEPER - Wait a minute! I know you!

*"You do?"

SHOPKEEPER - Yeah, sure I do! Your book's one of my bestsellers! I could have practically retired off of that book! Tell me, is it all true?

**"Not even in the slightest!"

->False

**"More or less I suppose..."

->True

*"I'm not sure you do, ma'am."

SHOPKEEPER - Yeah, sure I do! Your book's one of my bestsellers! 

YOU - Oh...

SHOPKEEPER - I could have practically retired off of that book! Tell me, is it all true?

**"Not even in the slightest!"

->False

**"More or less I suppose..."

->True


=True

SHOPKEEPER - So you really held off a dozen bandits single handedly at the Battle of Little Davey's Creek?

*"It was more of a minor skirmish to be honest."

SHOPKEEPER - Oh, that's disappointing. But still, I'm sure you're a real action hero. Surely other tales in the book must be accurate?

**The Mexican Standoff down by the river...

YOU - [tell a story here]

SHOPKEEPER - Oh wow that's exciting, you're a real hero mister! Anyway, enough of me blabbering on, what can I do for you?

->TalkAboutObjectives

**The Night Time Raid on the town of Black Hill...

YOU - [tell a story here]

SHOPKEEPER - Oh wow that's exciting, you're a real hero mister! Anyway, enough of me blabbering on, what can I do for you?

->TalkAboutObjectives

**The Mysterious Runaway Train Incident...

YOU - [tell a story here]

SHOPKEEPER - Oh wow that's exciting, you're a real hero mister! Anyway, enough of me blabbering on, what can I do for you?

->TalkAboutObjectives

*"Hold on a minute, the book says there were only a dozen!?"

YOU - There were at least thirty! It was called a battle for a reason, it wasn't just some little skirmish! It lasted through the whole night, I was a bullet away from being out of ammo. If I'd missed that final shot, I fear I wouldn't be here to spin this yarn today.

SHOPKEEPER - Oh wow that's exciting, you're a real hero mister! Anyway, enough of me blabbering on, what can I do for you?

->TalkAboutObjectives


=False

YOU - I'm sorry to disappoint you ma'am but I'm just not that exciting... The fella who wrote that book had an extremely active imagination.

SHOPKEEPER - Really? Not a single thing?

YOU - I guess a few of the things in it nearly happened. Like that Mexican Standoff. We talked it out in the end. And the Runaway Train Incident? Nothing mysterious about it. I rode up alongside, jumped on to regain control, and found the driver lying dead of a heart attack.

SHOPKEEPER - Well, I'll not pretend I'm not disappointed. But I guess it would be a bit silly to believe all that. You'd be the busiest man in the country. Anyway, what can I do for you?

->TalkAboutObjectives


=TalkAboutObjectives

YOU - I need help with a couple of things actually, if you don't mind me asking a couple of questions?

SHOPKEEPER - Go ahead...

*"I need help convincing that cranky Undertaker who I am..."

->HelpWithUndertaker

*"Have you seen a fat bearded fella with a neckerchief? He's our chef and he's missing..."

->HelpWithChef

=HelpWithUndertaker
~spoke_about_undertaker = true

SHOPKEEPER - Ah, so you've had the delight of meeting him. His personality certainly fits his profession. Poor fella's got a lot of work on his hands, all that death must be rubbing off on him.

YOU - Well anyway, he wants proof of who I am or else he won't help me get something I need. Do you think you could talk to him?

SHOPKEEPER - Talk to him? God, no! But here, I've got a copy of your book. Just show him this, that should do surely?

*"Let's hope so.."

YOU - I appreciate it ma'am.

SHOPKEEPER - Anything else?

{spoke_about_chef == true: ->ConversationFinished | ->HelpWithChef}

->END

=HelpWithChef
~spoke_about_chef = true


->END

===ConversationFinished===

->END