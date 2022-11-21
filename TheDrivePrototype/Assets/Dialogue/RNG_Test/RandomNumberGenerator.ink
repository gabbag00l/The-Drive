INCLUDE ../Globals/Globals.ink


Random Number Generator

{random_number == 0: -> ChooseNumber | -> AlreadyChosen}

=== ChooseNumber ===

Get a number higher than 3!

* [Get Number!]

~random_number = RANDOM(1,5)

{random_number}

**{random_number <=3}
->
Uh oh! Your number was lower than or equal to 3! Too bad!

*** [End]

->END

** {random_number > 3}
->
Your number was higher than 3! Yay!

*** [End]

->END

=== AlreadyChosen ===

Hey! You already chose your number! It was {random_number}! You can't change it now!
* [End]
->END