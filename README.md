# Gilded rose tech test

This Kata was originally created by Terry Hughes (http://twitter.com/#!/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). This version was translated by Emily Bache. This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

## The brief

The brief was to choose the legacy code in the language of our choice, and set to work refactoring and improving the design of the code so that adding the new functionality for 'conjured' was easy.

## Approach

I chose to do this challenge in Ruby, using Rspec for testing. I chose these tools because I felt that using the language I felt most comfortable writing in would allow me to focus completely on the design problems at hand.
The first thing I did when beginning this challenge was to address the lack of tests. I wrote tests for all of the edge cases to check that the legacy code definitely did everything it was supposed to do. Having this level of coverage also helped me as I started to refactor, to make sure the changes I made didn't cause any unexpected behaviour elsewhere in the program.
With all my tests in place I began to refactor out the large conditional statement in the update_quality method. I replaced magic numbers with constants, cut out repeated strings, and extracted the logic out of the conditionals into many smaller private methods. Once all my tests were passing again it was actually really easy to extend the program to include the new functionality.
I would like to come back to this kata soon and refactor further. I think the next step would be to extract the different types of item into their own classes, as they all behave slightly differently and some already have their own methods that aren't being used elsewhere. Eventually I will end up with lots of smaller classes that have single responsibilty, rather than one very long class as I have here.
