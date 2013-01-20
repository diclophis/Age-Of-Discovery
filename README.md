# Your Quest

Your ancestors once enjoyed the luxuries of nobility until disaster reduced
them to poverty and obscurity.  To win Age-Of-Discovery you must gain fortune
and fame through bold adventures, and restore your family name to honor.

## Earn Gold

Start off trading with nearby ports.  Discover where to buy and sell goods
to make the best profit.

## Gain Fame

To gain fame on the high seas you must...

  1. Invest in distant ports and gain allies for your home port Portugal.
  2. Fight Spanish and Turkish fleets.
  3. Rescue people in distress.
  4. Discover mysterious ports.

## Rise in Rank

As your reputation grows the King of Portugal may get word of your travels.
If you can satisfy the King's requests, he will honor you with a new rank.
Keep your eye on the Duke's title!

## Prepare for the Worst!

Treat your crew fairly and they will sail you safely through many adventures.
But, as their captain you must be protected.  Your family will never be
restored to glory if you go down with your fleet!  Stock your ships well; your
crew needs energy to maneuver you through turbulent seas.  If you're a true
salt, you should complete your journey before 1522.


## Calling at Port

Before you sail off, visit the port services.
You are welcome to visit any place as many times as you like in one day, except for Ye Olde Inn, the Shipyand and the Palace.
You will need to rest at the lodge after a call to any of these three spots.

  1. Guild - Barter for information on any nation, or buy special items.
  2. Ye Olde Inn - Recruit sailors, listen to gossip or play a game of cards.
  3. Marketplace - Buy and sell goods.
  4. Palace - Meet with the King or seek out the Princess.
  5. Lodge - Look over information about the port or your fleet while you rest your Fleet at Dock.
  7. Shipyard - Purchase ships and make repairs.
  8. Harbor - Stock up your fleet, transfer cargo, or set sail.
  9. The Hero - Manage your progress / player.

## Sailing the high seas

  1. Sailing Map
      Check current and wind direction to navigate the smoothest route.  Your
      fleet will pick up speed if you sail with the wind at your back.  Sailing
      into the wind will strain the sails and slow you down.
      You can catch a crosswind and sail straight to your destination, but the
      winds change throughout the year.  Catching an ocean current will also
      send your fleet smoothly along.  Currents do not change.
      The fleet will be easier to handle as the Captain gains more sailing
      experience.

  2. Sailing Menu
    Options for sailing at sea, like direction, target port.

  3. Wind Direction & Velocity (1-8) - monitor which way the wind is blowing, and how fast the gusts are.
  4. Current (1-3) - monitor which way the ocean currents are flowing
  5. Days at Sea - monitor how many days you have been at sea
  6. Water - monitor how much water is left in your fleet
  7. Food - monitor how much food is left in your fleet

## Typhoons!

If caught in a typhoon, your ship may lose its rudder.
The fleet will drift with the tide until repairs are made.

## Overpowering Current!

Avoid strong ocean currents.  Your fleet could be trapped off a desolate shore with no hope of escape.
Be steady at the helm when you sail along the coastline!

## Damaged Fleet!

If your fleet is damaged by heavy seas or war, debark at the nearest port and make repairs at the shipyard.
Otherwise, go ashore somewhere and make repairs from your lumber supplies
While ashore, your crew will not eat as much as they do at sea.
Stock up on lumber before you set sail again.

## Provisions run out!

Food and water is carried to supply your entire fleet.
If one ship should run out of provisions it will be supplied from other ships.

If water runs low, go ashore in search of a fresh spring.  The more experience you have, the easier it is to find water.
Food can only be bought at port.
Stock up on more food than water if you plan to search for a spring mid-journey.

## Managing the hero

  * Rank - Fulfill royal requests for higher ranks

  * Home Port Fame - Reputation in your home port
    Has Maximum, but decays over time/based on last quest completed.

  * Gold - Deposit surplus at palace.
    Has Maximum, but you can partition your gold out among ports/palaces

  * Loyalty - How much trust your crew has in you
    0.0f -> 1.0f

  * Battle Experience - Improves after a war.

  * Battle Level - Your Strength in battle increases with experience.

  * Sailing Experience - Improves while sailing and after finding ports

  * Sailing Level - Improves with sailing experience.

  * Characteristics - Set these values for your hero at begin of game
    * Sailing
      1. Leadership - Ability to lead the fleet
      2. Wisdom - Sense of mission
      3. Intelligence - Decision making
    * Battle
      1. Strength - Determination
      2. Courage - Bold spirit

## Managing your fleet

  1. Durability - Strength of ship - Used to gauge flotation.  Depends on the type of wood used in the hull.
  2. Power - Sailing speed - Depends on number and type of sails
  3. Handling - Strength against head winds - Depends on number and type of sails
  4. Cargo Load - Amount loaded on board - Larger ships can carry larger cargos.
  5. Crewmen - Sailors on board - Larger ships can bunk more sailors.
  6. Arms - Number and type of arms on board - A ship can only carry one type of gun, due to restrictions in ammo.
  7. Water, Food, Lumber - supplies for sailing - Replenish supplies at port. Transfer between ships to make room for other goods.
  8. Condition - Condition of crew - Depends on food and water rations.

          Crew condition drops when: 1) food or water runs out while sailing;
                                     2) you flee from a battle;
                                     3) you reduce sailors rations;
                                     4) you recruit new mates;


## Port Properties

  This information is only available at the lodge

          Category        Max Value Information             Other
          --------------- --------- ----------------------- ----------------
          Economic Worth  1000      Success at market       Increases with investment.
          Economic
            Investment    60,000    Income from adventurers
          Industrial worth 1000     Success at shipyard     Increases with investments
          Industrial
            Investment    60,000    Income from adventurers
          Support         100%      Which nations are       Depends on investments.
                                    supported
          Prices          150%      Port-wide price index   Average 100%.


          Category    Max Value Information             Other
          ----------- --------- ----------------------- ------------------
          Revenue     60,000    Economic power          Increases as nation gains
                                                        allies, and with investment.
          Hostility   100       Animosity for Hero      Affected when hero attacks
                                                        Spanish or Turkish fleets,
                                                        decreases over time.
          Friendship  100       Friendly ties with      Affects chances to gain allies
                                other nations.          and freely visit certain ports


## Guild Menu Flow

  1. Purchase->ListOfItems->PickItem->ConfirmPurchase
  2. NationInformation->NationList->SelectNation->ConfirmPrice->ListRevenueHostilityFriendshipsToOthersAndAlly

## Ye Olde Inn Menu Flow

          Crew.........Recruit....Recruit crewmen
                                  Assign.....Reassign crewmen
                     Find Mates..............Hire mates to navigate
                     Quit Mates..............Fire lazy mates
                     Gossip..................Have dinner and listen for seafarer
                                             news
                     Tip.....................Tip the waitress and listen for news
                     Gamble..................Play Poker or Black Jack



## Items

All Guild Items Have
  * Cost
  * Value

Telescope - Spy on distant fleets and spot ports.
  * Range
  * SkillBonus
  
Sextant - Measure latitude and longitude to calculate position.
  Speculum       Map out your position.
  Amulets        Protect from disaster on the high seas.
  Swords         Gain strength in battle.
  Icons          Fire cannons with accuracy.
  Treasure       Gemmed treasures to present to the Princess.


  Marketplace     Sell....................Sell goods
                  Buy.....................Buy goods
                  View Market.............Check rates for specific markets
                  Invest..................Invest to boost economic worth

Sell->ListOfShips->SelectShip->ListItemsOnShipWithQuantityAndAmount->SelectItem->SelectAmount

Buy->ListShipsWithLoadAndMax->SelectShip->ListItemsWithAmountAndCostShowTypesOfCargoSpaceLeft->SelectItem->ConfirmPrice/Haggle

  Palace          Meet King/Sultan........Meet ruler to view his influence
                                          in other lands
                  Secret Call.............Court the Princess
                  Request..........Funds..Request gold
                                   Crew...Request sailors
                  Savings.................Deposit up to 10,000,000 gold in the
                                          ruler's care.

  Lodge           View.............Mates..Review your status or mates
                                   Fleet..Status of fleet
                                   Port...Port information
                  Lodging.................Spend the night



  Spice     Pepper, Cinnamon, Nutmeg,          Southeast Asia, The Americas
            Pimento, Cloves
  Food      Olive Oil, Grapes, Sugar,          Europe, The Americas
            Cheese, Grain
  Metals    Gold, Silver                       Africa, Asia
  Gems      Quartz, Coral, Ivory, Pearl        Africa, Middle East,
                                               The Americas
  Textiles  Cotton, Raw Silk, Wool, Cloth,     Europe & distributed throughout
            Silk                               world
  Other     Firearms, Wood, Porcelain,         Europe & distributed throughout
            Artwork, Carpet                    world


  Shipyard    Buy........Buy Used Ship....Buy a ship that has seen rough seas
                         Build New Ship...Design a new ship
              Sell........................Sell a ship.  Take all sailors off
                                          and bunk on other ships before sale
                                          (Ye Olde Inn-Crew)
              Fix.........................Make repairs to fleet
              Remodel....Guns.............Buy new guns.  The shipyard master
                                          will buy old guns for 1/2 price.
                         Sails............Change sails
                         Figurehead.......Adorn bow of ship for good luck
                         Rename Ship......Rename for a small fee

  Harbor      Sail...........Shove off for a new adventure.  Be sure to stock
                             up for the voyage ahead
              Restock........Restock water, food and lumber
              Transfer.......Transfer supplies between ships

Restock->RestockWaterOrFoodOrLumber->ListShipsWithLoadAndMax->SelectShip->SelectAmount->ConfirmPrice
Water can be free->SelectAmount
Sail->ConfirmDaysAtSea

  Move        Direction    Tack to change direction.
              Cast Anchor  Furl the sails and drop anchor.  Use the same
                           command to set sail again.
  Look        Inspect      Send up a lookout with a telescope to spy on a
                           distant fleet or port.
              Survey       Use sextant to calculate your position.
              Negotiate    Exchange news with a nearby fleet.
  Battle                   Attack a nearby fleet under the light of day.
  Debark      Port Call    Pull into harbor.
              Go Ashore    Drop anchor and row to land.
  Information Fleet        View status of fleet.
       (Info) Cargo        Review goods on board.
              Land         You need one special item to view a map of the
                           shoreline.
              Mates        View the status of your mates or yourself.
              Items        Check items in your keep.
  Order       Ration       Change food and water rations for crew.
              Distribute   Reward a mate with a bit o'gold.
              Personnel    Reassign navigators or flagship.
              Dispose      Scuttle a ship in the deep blue.  To scrap
                           flagship, first reassign Captain to another vessel.

Shore comands
  Sail..........................Set sail into the mighty deep.
  Fix...........................Use the lumber on board to make repairs to
                                fleet.
  Wait..........................Wait out a fleet from your position.  Push A
                                to give further orders.
  Search........Water...........Search for a fresh spring.
                Treasure........Treasure hunt.  Are you on a specific quest?
  Transfer......Crew............Reassign crewmen to other vessels.
                Cargo...........Transfer any cargo between ships.


