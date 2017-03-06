# Pre-work - *Tippy*

**Tippy** is a tip calculator application for iOS.

Submitted by: **Angela Ong**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [X] Custom Tip Percent
* [X] Round to Lowest Dollar Amount
* [X] Round to Highest Dollar Amount
* [X] Test Cases Doc used for testing functionality of Tippy (see test_cases doc)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

http://imgur.com/a/I6EBf

## Notes

Lots of formatting issues with Double and getting 2 decimal despite String format "%.2f"

Challenges with algorithm to determine rounding to highest and lowest when the bill amount was <$1.00
