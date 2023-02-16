VAR random_number = 0
VAR current_hand = ""

VAR aware_of_shooting = false
VAR learned_about_shooting_at_hotel = false

VAR spoke_to_priest = false

VAR undertaker_too_busy = false
VAR told_to_get_proof = false

=== function GetRandomHand ===

{random_number:
-0: ~ current_hand = ""
-1: ~ current_hand = "High Card"
-2: ~ current_hand = "High Card"
-3: ~ current_hand = "Pair"
-4: ~ current_hand = "Pair"
-5: ~ current_hand = "Three of a Kind"
-6: ~ current_hand = "Three of a Kind"
-7: ~ current_hand = "Straight"
-8: ~ current_hand = "Straight"
-9: ~ current_hand = "Royal Flush"
-10: ~ current_hand = "Royal Flush"
}

