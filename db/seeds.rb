# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create({:name => "3 Dragons Collide", 
                :description => "
The 22nd Structure Deck to be released and the first with 2 cover-cards.

* includes Light, Dark and Dragon-Type monsters
* includes new Dragon-type monsters, as well as support cards
* includes 5 new cards and many reprints

Includes 40 cards including: 2 Ultra Rares, 1 Super Rare and 37 Commons

[Card List](http://yugioh.wikia.com/wiki/Set_Card_Lists:Structure_Deck:_Dragons_Collide_(TCG-EN\))

[Wikia page](http://yugioh.wikia.com/wiki/Structure_Deck:_Dragons_Collide) 				
				 ",
				 :image => "Dragons Collide.jpg", 
				 :size => :large_packet, 
				 :price => 22.50})
				
Product.create({:name => "Twilight",
                 :description => "
The Twilight Edition is a set which combines the best Light and Dark monsters from the last 2 years

Includes:

* 1 Ultra Rare (TWED-EN001 Honest)
* 3 Booster packs

    * 1 Light of Destruction Booster Pack
    * 1 Phantom Darkness Booster Pack
    * 1 Tactical Evolution Booster Pack		
				
[Twilight Wikia page](http://yugioh.wikia.com/wiki/Twilight_Edition)				
                 ",
				 :image => "Twilight.jpg",
				 :size => :packet,
				 :price => 8.50})
				 
Product.create({:name => "Order of Chaos: 24 packs",
                :description => "
Order of Chaos is a great base booster introduces the Armor Ninja, Gagaga, Gogogo and Inzektor Archetype to the TCG. There is also futher support for the Ninja, Wind-Up, Photon, Charmer, Number, Evol, Archfiend, Reactor, Koala, X-Saber and Mist Valley archetypes. Futher support for Dark, Light, Wind and Fire attribute monsters, as well as Gemini monsters.

100 possible cards including: 1 Ghost Rare, 8 Secret Rares, 10 Ultimate Rares, 10 Ultra Rares, 14 Super Rares, 20 Rares and 48 Commons

24 packs x 9 cards per pack = 216 cards!

[Order of Chaos Wikia page](http://yugioh.wikia.com/wiki/Order_of_Chaos)
                 ",
				 :image => "Order of Chaos.jpg",
				 :size => :large_packet,
				 :price => 57.00})
				 
Product.create({:name => "Photon Shockwave",
                :description => "
Introduces Photon and Evol archetypes.

Supports Wind-Up, Number, Watt, Naturia, Gem/Gem-Knight, Laval, Gishki, Vylon, Ice Barrier, Ninja, Junk, Infernity, Time Lord and Dark World archetypes.

Supports Normal monsters and Xyz monsters

Supports Light and Water monsters

Contains 9 cards per pack.

100 possible cards including: 1 Ghost Rare, 10 Ultimate Rares, 8 Secret Rares, 10 Ultra Rares, 14 Super Rares, 20 Rares, 48 Commons
			  
[Photon Shockwave Wikia page](http://yugioh.wikia.com/wiki/Photon_Shockwave)
			     ",
				 :image => "Photon Shockwave.jpg",
				 :size => :letter,
				 :price => 3.00})
