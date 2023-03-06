INCLUDE ../../Globals/Globals.ink

{told_to_get_proof == false: ->WaitingForDelivery | ->GetProof}

===WaitingForDelivery===

SHOPKEEPER - Sorry Mister, afraid you'll have to come back later. I'm unloading a delivery here.

*[Leave]
->END


===GetProof===

SHOPKEEPER - Hey there mister, what can I do for - 

SHOPKEEPER - Wait a minute! I know you!

*"You do?"

SHOPKEEPER - Yeah, sure I do! Your book's one of my bestsellers! I could have practically retired off of that book!

**"Oh, I see."

->END //fix this this isnt where its gonna end

*"I'm not sure you do, ma'am."

SHOPKEEPER - Yeah, sure I do! Your book's one of my bestsellers! I could have practically retired off of that book!

->END