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

 import processing.serial.*; 
 
 boolean connected = true;
 long lastId[] = new long[1];

  Serial port; 

void setup() {
  
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


void draw() {  //the loop
  
    getSearchTweets();    
}


// Initial connection
void connectTwitter() {

  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);

}


// Loading up the access token
private static AccessToken loadAccessToken(){
  return new AccessToken(AccessToken, AccessTokenSecret);
}


// Search for tweets
void getSearchTweets() { 
  
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
     

