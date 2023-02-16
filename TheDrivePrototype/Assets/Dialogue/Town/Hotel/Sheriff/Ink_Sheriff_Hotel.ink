INCLUDE ../../../Globals/Globals.ink

YOU - Oh, howdy sheriff. Excuse me, I need into the hotel.

SHERIFF - Hotel's off limits partner, I can't let you in. I'm standing here on lookout, as you can probably tell from the way I'm continuously looking round me in a strangely unnatural and looping manner.

*"Ah, I... understand..." 

Are you sure I can't go in? I'm just looking for our chef. He's a big fella with a big beard and I'm told he likes a good neckerchief.

SHERIFF - Well isn't that a coincidence! That's who I'm looking for! Except when we find him we're gonna hang him!

{aware_of_shooting == true: ->HeTheShooter | ->WhyHang}

===HeTheShooter===

**"You can't think he shot somebody!?"

YOU - He's a chef, not a hitman!

SHERIFF - Sorry mister but I'm absolutely certain and I consider this case to be closed. Or at least it will be once we've caught the bastard and buried him.

***"On what evidence!?"

SHERIFF - His room is right by the balcony and a witness reports seeing him riding out of town seconds after the shooting!

YOU - That's circumstantial evidence at best, sheriff!

SHERIFF - I spent three weeks training with the Pinkerton Detective Agency and will not have my skills questioned by some washed up cowboy, now unless you know where the chef is I kindly demand you leave!

{learned_about_shooting_at_hotel == true: ->GoFindMrGraves| ->LeaveSheriffAlone}

===WhyHang===

*"Hang him!? Why!?"

SHERIFF - He shot a fella at the saloon! He set himself up on the balcony up there and shot through the window! A shot like that, we're being awful careful. This man is clearly a trained killer!
~aware_of_shooting = true
~learned_about_shooting_at_hotel = true

->HeTheShooter

===GoFindMrGraves===
Well, I guess I should go look for Mr Graves now...

*[Leave]
->END

===LeaveSheriffAlone===

*[What will I do now?]

Guess I better find some proof I knew Mr Graves for the Undertaker...

**[Leave]

->END

