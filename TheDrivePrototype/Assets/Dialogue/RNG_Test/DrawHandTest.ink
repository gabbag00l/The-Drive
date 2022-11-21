INCLUDE ../Globals/Globals.ink

Draw a Poker Hand!
-> DrawHand
=== DrawHand ===

Are you feeling lucky? Get a Straight or Royal Flush!

*[Draw Hand]

~random_number = RANDOM(1,10)

{GetRandomHand()}

You drew a {current_hand}!

//below is how to do an if statement in case you forget again doofus
{random_number >= 7: ->SuccessfulDraw | ->UnsuccessfulDraw}

~ random_number = 0

->END

=== SuccessfulDraw ===

You did it!

->END

=== UnsuccessfulDraw ===

Unlucky!

->END

