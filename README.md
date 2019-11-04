# Pursuit-Core-iOS-Foursquare-Map-Project

## Overview 

Use MapKit and CoreLocation to build out a Foursquare like app with the following spcecifications:

* User can search for a venue
* The app shows results those results with annotations on a map
* The user can toggle between a map view and a list view
* If the user denies access to location, search still works
* User can create a collection 
* User can add venues to a collection 


## Core Feature Gifs

|User Allowing Access|User Denying Location Access|
|:-------------:|:------------:|
|<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/request-location-access-allow.gif" width="358" height="626">|<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/request-location-access-denied.gif" width="358" height="626">|  

<br><br>
<p align="center"><b>User can search for a venue and toggle between the default search map or a list</b></p>
<p align="center">
<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/search-for-venue.gif" width="358" height="626">
</p>

<br><br>
<p align="center"><b>User can change search location</b></p>
<p align="center">
<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/change-location.gif" width="358" height="626">
</p>

<br><br>
<p align="center"><b>User can create a collection</b></p>
<p align="center">
<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/create-collection.gif" width="358" height="626">
</p>

<br><br>
<p align="center"><b>User can add a venue to a collection</b></p>
<p align="center">
<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/add-to-collection.gif" width="358" height="626">
</p>

## Bonus feature Gifs

<br><br>
<p align="center"><b>User can create a tip about a venue</b></p>
<p align="center">
<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/create-a-tip.gif" width="358" height="626">
</p>

<br><br>
<p align="center"><b>User can get directions to a venue</b></p>
<p align="center">
<img src="https://github.com/C4Q/AC-iOS-Unit5GroupProject/blob/master/Images/get-directions.gif" width="358" height="626">
</p>


**Apply for a Foursquare Developer Account and API Key:**  
https://developer.foursquare.com/docs/api/getting-started  

[Foursquare Endpoint Overview](https://developer.foursquare.com/docs/api/endpoints)  

**Venue Search Endpoint:**  
Request: 
```
GET https://api.foursquare.com/v2/venues/search
```

**Venue Photos Endpoint:**  
Request: 
```
GET https://api.foursquare.com/v2/venues/VENUE_ID/photos
```

## Rubric 


![rubric](./rubric.png)
