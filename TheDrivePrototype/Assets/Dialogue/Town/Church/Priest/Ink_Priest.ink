INCLUDE ../../../Globals/Globals.ink



->StartConversation

===StartConversation===


{spoke_to_priest == true: ->SpokeToPriest| ->NotSpokenToPriest}


===NotSpokenToPriest===

{aware_of_shooting == false: ->Unaware| ->Aware}


===Unaware===
YOU - Howdy, father!

PRIEST - It's not Sunday, leave me alone!

~spoke_to_priest = true

*[Leave]

->END


===Aware===

YOU -Howdy father!

*[Be an idiot]

YOU - I need a favour, father. An associate of mine has recently passed and I would very much like to communicate with him.

PRIEST - How recently?

YOU - About 20 minutes ago

PRIEST - Oh no son, sorry. That's far too recent! Come back in about a week.

YOU - I'm afraid I'll be long gone from here by then father.

PRIEST - Me too, with any luck...

~spoke_to_priest = true

**[Leave]

->END


*[Don't be an idiot]

YOU - Shame about the shooting in the saloon, isn't it? He was an associate of mine.

PRIEST - Son, I only offer condolences on a Sunday. I'm not interested in your woes when I'm off the clock. God knows I've enough of my own...

YOU - Well, I guess you'd be the expert on that. I'll be out of your way then.

~spoke_to_priest = true

**[Leave]

->END

===SpokeToPriest===

The priest doesn't want to speak to you.

*[Leave]

->END