import processing.core.*; 
import processing.xml.*; 

import processing.serial.*; 

import twitter4j.conf.*; 
import twitter4j.internal.async.*; 
import twitter4j.internal.org.json.*; 
import twitter4j.internal.logging.*; 
import twitter4j.http.*; 
import twitter4j.internal.util.*; 
import twitter4j.api.*; 
import twitter4j.util.*; 
import twitter4j.internal.http.*; 
import twitter4j.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class TwitterHeart001 extends PApplet {

// This is where you enter your Oauth info
static String OAuthConsumerKey = "j7lUv1QsbbKsSLHDx5XVwQ";
static String OAuthConsumerSecret = "4llJwb6ep94bWRWLW7eZnJxAlXjEH8JaYGBejmaRGY";

// This is where you enter your Access Token info
static String AccessToken = "285653907-d52AcO4dBU8NTkzam1eUTyAQoHcEmGt0nUPCKjyG";
static String AccessTokenSecret = "yMx77sne5MlBHl461kySXfUjn4MFS8XcPzvo5WhxJEU";

// Just some random variables kicking around
String myTimeline;
java.util.List statuses = null;
User[] friends;
Twitter twitter = new TwitterFactory().getInstance();
RequestToken requestToken;
String[] theSearchTweets = new String[11];

  
 
 boolean connected = true;
 long lastId[] = new long[1];

  Serial port; 

public void setup() {
  
  connectTwitter();

//******************* 
 // List all the available serial ports in the output pane. 
 // You will need to choose the port that the Arduino board is 
 // connected to from this list. The first port in the list is 
 // port #0 and the third port in the list is port #2. 
 println(Serial.list()); 
 
 // Open the port that the Arduino board is connected to (in this case #0) 
 // Make sure to open the port at the same speed Arduino is using (9600bps) 
 port = new Serial(this, Serial.list()[0], 9600); 
 //**********
    
}


public void draw() {  //the loop
  
    getSearchTweets();    
}


// Initial connection
public void connectTwitter() {

  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);

}


// Loading up the access token
private static AccessToken loadAccessToken(){
  return new AccessToken(AccessToken, AccessTokenSecret);
}


// Search for tweets
public void getSearchTweets() { 
  
 String queryStr = "heart";
      
  try {
    Query query = new Query(queryStr);
      for (int i = 0; i < 1; i++){
    query.setSinceId(lastId[i]);
    QueryResult result = twitter.search(query);    
    ArrayList tweets = (ArrayList) result.getTweets();
      if (tweets.size()>0){
      Tweet t = (Tweet)tweets.get(0);	
      String user = t.getFromUser();
      String msg = t.getText();
      String heart = t.getText();	
      Date date = t.getCreatedAt();
      lastId[i] = t.getId();
      println("" + user + " at " + date + msg);
     
     if (t.getText().contains("heart")) {
     port.write('H');
     if (t.getText().contains("")) {
     port.write('L');
      } 
     }
    }
  }
  }
  catch (TwitterException e) {
    println("exception: " + e);
        }
      }
     

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "TwitterHeart001" });
  }
}
