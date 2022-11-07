<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="13142" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="12042"/>
    </dependencies>
    <objects>
        <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner"/>
        <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
    </objects>
</document>
# Dial it in
*Justin Boyer*

*Version 2.5 (HW 3)#*

## Summary of Project
*This app is an epresso companion app designed to help coffee enthusiasts make better coffee more quickly and reliably.  Users will be able to track common brewing variables in order to quickly see what adjustments can be made in order to improve pulls.  Good cups can be quickly reproduced by accessing saved settings - even if the equipment has been adjusted for different roasts.  This makes trying new coffees or switching between bags a breeze! *

## Project Analysis
### Target Audience
*The target audience is beginning to intermediate coffee enthusiasts who need to make frequent adjustments to their brew processes and decide what they like. This audience could be reached on coffee forums, cafes, and coffee tasting subscriptions (eg trade)*

### Primary Purpose
*The primary purpose is to allow coffee enthusiast to save brew configurations for specific coffee roasts and quickly recreate cups they liked*

### Value Proposition
*Dialing in espresso is a daily process for any professional barista and is an essential part of what makes cafe espresso so consistant.  Home coffee enthusiast have a unique set of problems when trying to dail in their cups at home. First, cafe's typically order in bulk and stick to a handful of roasts leaving settings relatively constant from day to day.  Conversely, in order to brew fresh beans consumer bags are much smaller - often less than a pound.  Additionally, home brewers are more likely to experiement with different roasts and brands. Pulling 3-5 shots to find the right balance is a time consuming process that uses a larger percentage of these smaller bags and every roast is different and may require different settings. This app aims to simplify this process, drawing attention to which settings to change and saving "roast profiles" to help home baristas remember settings when switching between different bags of coffee.*

### Success Criteria
*Success can by the number of weekly users with more than one roast profile saved. This is a better metric than daily users because if the app is working well it should reduce the number of times a user needs to spend time dialing in. This metric should capture users that benefit the most from saving their settings *

### Competitor Analysis
*iBrewCoffee: This app is very detailed and focuses primarily on the coffee itself.  Pros: very flexible allows for nearly any type of equipment, links to roasteries all over the world, freemium service. Cons: All the customization options make it very complicated.  It is very overwhelming.*

### Monetization Model
*Ads for local coffee roasters, coffee equipment, coffee subscriptions, coffee sales*

### Initial Design
*MVP must have 3 essential features:
1) Option to manually input espresso settings including dose, yield, grind size, and brew time.
2) Save roast profile to local storage
3) Retrieve roast profile for viewing
*

### UI/UX Design
* Home menu with two buttons to create new profile or load saved profile.  
On the 'create' page: Large easy to press buttons that allow user input on press. Timer button, add photo option, dose/yeild calculator, save button. It would also be nive to have a rating system/flavor profile (maybe P1 or P2).  The page for save profiles will be a list with the photo on the left and a peek at the most important stats in line on the row. Click to enter into a details page. (see included diagram) *

### Technical Architecture
*Internal storage: Ideally I'd like a non-relational database. I'll try to use firebase, but if it is cost prohibative I'll use Core Data even though it is a suboptimal solution for my use case.

The app will have 4 basic pages with a simple heirarchy structure
      -Create new
Home < 
      -Retreive saved -view details

Using non-local storage will require user verification. I plan to use the integrated firebase options in that case.

Roast profiles will be saved as JSON. I don't plan to implement any features where complex querries will be advantageous.
*

## Challenges and Open Questions
*Camera permissions

 Saving and retrieving photos associated with roast profiles

 User authentication and storage - I'm not sure how firebase works or if it is the right choice here.

 How to help users dial in effectively - ie informitive user inputs for taste.
*

## HW 3 State management
1) The various states that an app can enter on your platform of choice:
An iOS app can be in 1 of 5 activity states: Not running, suspended, background, inactive(transitional), active (https://www.codingexplorer.com/execution-states-swift-ios-app/). Both swiftUI and storyboards will store the app state in memory will the user suspends the app and will return the in memory verson of the app when the user returns to the active activity state.  iOS makes no promises about when or how long an app can be stored in memory like this however and an app can be terminated at any time in the background.In swift UI an App object cotains scenes and each scene is a collection of views. Each view represents a different state the app can be in that needs to be saved if we want the app to remember it.  View state variables can be stored in a db for long term memory using @SceneStorage and a name to store the value as. As long as these are primitive types they can easily be stored and retrieved with this tag.  More complex objects can be stored using pths but this practice is typically discoraged by apply who recommends storing the minimium amout of data required for a smooth transition. For example, in my app I store floats and a string in the db to ensure the app remembers the timer value even on a cold restart (eg rebuild).
2) The various states that you must consider for your app, why you must consider it, and what must happen in each state:
For my app there are 6 main views that need to be handled, plus a few specific states on the "new entry" path I would like to handle. 
        1) Home page. Nothing to do here. No data is entered and the app will return here on a cold restart without help.
        2) Saved entries list page. I'd like to return to this page if the app is terminated.  If they have a long list maybe return to the same place in the list. This state is probably lowest on my priority list - it is not a big deal if the user is returned to the homepage on termination here.
        3) Detail view for a specific entry. Save the entery view and return. THis is important if a user is trying to remake a recipe. They will want to stay on the same spot to ensure their processes in the kitchen isn't interupted. I'd say this state is probably the highest or second highest priority for my apps values
        4) User entery page for details. Save page and user text entires.  Its always anoying to have to retype stuff so this one is high priority for me.
        5) Timer page. Save the timer value if it is stopped but if they accidentally left it running let it terminate with the app. If it takes more that 40 seconds to brew there is something wrong.
        6) Review/save page. Another high priority page. Save all the results in the db. If the app terminates before they save they will lose their results permanently which would be a poor experience.
