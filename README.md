# README

https://app.codeship.com/projects/5f3875b0-c48c-0138-8f48-5a8e9e597d9b/status?branch=master

When the fisherman has time, after taking care of the honey-do-list that is always waiting after a day on the water, they can enter the date and some simple descriptive information then walk away.  When they complete their entry the information for the trip will be entered and the API requests for the weather, tides and moon data will be gathered with no effort.  Not only that but past information that you might have around but that doesn’t have all the weather data can be entered and the information updated with all the weather data that is available (not all information is available for all past dates due to sunsetting certain information).

More importantly this data can then be used to develop a database that gives insight as to why a particular trip was a good or bad and whether your next trip is going to be a good or bad day too.  Not that I am saying that a bad day on the water doesn’t beat anything else we could do.  A good logbook is a great tool that can help you predict if the conditions are right to have a great day fishing, the rest is up to you!

This app is really dedicated to the fishermen around the Buzzards Bay area but could be used by anyone if they would like.  

Check out the deployed app https://fishing-log-2.herokuapp.com/

### APIs

To run the app locally you will need to sign up for a code at Stormglass.io and input that into the .ENV file (see example file to see the format).  On Heroku this is not required.

### Libraries
* devise
* faraday

### The Future

I have begun incorporating a species class that can be indicated on the form which will allow sorting in the future using a specific species show page.

I would like to add searching features to the show page to allow users to quickly search and filter their records to show only records with the given key words.

I plan to add shared records and a review/help section for fishermen to help one another.  I have begun incorporating an administrator function to provide regulation of this to ensure that improper posts can be removed.  I have also begun composing rules for public posts to provide guidance to users to ensure users know what is acceptable.

I would like to incorporate a map feature to allow a fisherman to select a spot from a map rather than having to input coordinates, however something simple like a google map is not that helpful because it does not have the contours of the ocean bottom.  Incorporating NOAA raster charts would be ideal but the complexity of that is beyond the scope of such a small project.

