<%@page import="java.util.Arrays"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="id.web.tkesgar.tubes3stima.StringSearch.Algorithm"%>
<%@page import="id.web.tkesgar.tubes3stima.StringSearch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="twitter4j.Status"%>
<%@page import="twitter4j.QueryResult"%>
<%@page import="twitter4j.Query"%>
<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="header.jsp" %>
<%
String queryString = request.getParameter("query");
String[] keywordsMacet = request.getParameter("macet").split("[;,]\\s*");
String[] keywordsLancar = request.getParameter("lancar").split("[;,]\\s*");
String[] keywordsKasus = request.getParameter("kasus").split("[;,]\\s*");

String apiKey = "6LLStSGKn0EHmf3GZd8USvawY";
String apiSecret = "v9UN4xZzDajz52kmzo1XmWv39ZTEKZetrz2FjHgZGfLz1Q9D98";
String accessToken = "311936061-1x2qyTDnfMMRXrKF9hCDvd76a0VKRoVi8USWotkY";
String accessTokenSecret = "Qr5OLa9WCppypHlJocyzxwDt0YI943UnhusmN6AaiIT9T";

Twitter twitter = new TwitterFactory().getInstance();
twitter.setOAuthConsumer(apiKey, apiSecret);
twitter.setOAuthAccessToken(new AccessToken(accessToken, accessTokenSecret));

Query query = new Query();
query.setQuery(queryString);
query.setCount(100);
QueryResult result = twitter.search(query);
List<Status> tweets = result.getTweets();
List<Status> tweetsMacet = new ArrayList<Status>();
List<Status> tweetsLancar = new ArrayList<Status>();
List<Status> tweetsKasus = new ArrayList<Status>();
List<Status> tweetsMisc = new ArrayList<Status>();

for (Status tweet : tweets) {
	
	for (String keyword : keywordsMacet) {
		if (StringSearch.search(Algorithm.JavaIndexOf, keyword, tweet.getText()) != -1) {
			tweetsMacet.add(tweet);
		}
	}

	for (String keyword : keywordsLancar) {
		if (StringSearch.search(Algorithm.JavaIndexOf, keyword, tweet.getText()) != -1) {
			tweetsLancar.add(tweet);
		}
	}

	for (String keyword : keywordsKasus) {
		if (StringSearch.search(Algorithm.JavaIndexOf, keyword, tweet.getText()) != -1) {
			tweetsKasus.add(tweet);
		}
	}
	
	if (!tweetsMacet.contains(tweet) && !tweetsLancar.contains(tweet) && !tweetsKasus.contains(tweet)) {
		tweetsMisc.add(tweet);
	}
}

int nMacet = tweetsMacet.size();
int nLancar = tweetsLancar.size();
int nKasus = tweetsKasus.size();
int nMisc = tweetsMisc.size();
%>
	
	<div id="page_app_result" class="container">
		<h1>Hasil Analisis</h1>
		<div class="row">
			<div class="col-md-3">
				<h2>Lalu lintas macet <small><%= nMacet %></small></h2>
				<% for (Status tweet : tweetsMacet) { %>
					<article class="media">
						<a class="pull-left" href="">
							<img class="media-object" src="<%= tweet.getUser().getBiggerProfileImageURL() %>" alt="<%= tweet.getUser().getName() %>">
						</a>
						<section class="media-body">
							<h4 class="media-heading"><%= tweet.getUser().getName() %></h4>
							<p><%= tweet.getText() %></p>
							<% if (tweet.getGeoLocation() != null) { %>
								<a class="btn btn-default btn-sm" href="http://maps.google.com/?q=<%= tweet.getGeoLocation().getLatitude() %>,<%= tweet.getGeoLocation().getLongitude() %>">Lihat lokasi</a>
							<% } %>
						</section>
					</article>
				<% } %>
			</div>
			<div class="col-md-3">
				<h2>Lalu lintas lancar <small><%= nLancar %></small></h2>
				<% for (Status tweet : tweetsLancar) { %>
					<article class="media">
						<a class="pull-left" href="">
							<img class="media-object" src="<%= tweet.getUser().getBiggerProfileImageURL() %>" alt="<%= tweet.getUser().getName() %>">
						</a>
						<section class="media-body">
							<h4 class="media-heading"><%= tweet.getUser().getName() %></h4>
							<p><%= tweet.getText() %></p>
							<% if (tweet.getGeoLocation() != null) { %>
								<a class="btn btn-default btn-sm" href="http://maps.google.com/?q=<%= tweet.getGeoLocation().getLatitude() %>,<%= tweet.getGeoLocation().getLongitude() %>">Lihat lokasi</a>
							<% } %>
						</section>
					</article>
				<% } %>
			</div>
			<div class="col-md-3">
				<h2>Kasus lalu lintas <small><%= nKasus %></small></h2>
				<% for (Status tweet : tweetsKasus) { %>
					<article class="media">
						<a class="pull-left" href="">
							<img class="media-object" src="<%= tweet.getUser().getBiggerProfileImageURL() %>" alt="<%= tweet.getUser().getName() %>">
						</a>
						<section class="media-body">
							<h4 class="media-heading"><%= tweet.getUser().getName() %></h4>
							<p><%= tweet.getText() %></p>
							<% if (tweet.getGeoLocation() != null) { %>
								<a class="btn btn-default btn-sm" href="http://maps.google.com/?q=<%= tweet.getGeoLocation().getLatitude() %>,<%= tweet.getGeoLocation().getLongitude() %>">Lihat lokasi</a>
							<% } %>
						</section>
					</article>
				<% } %>
			</div>
			<div class="col-md-3">
				<h2>Lain-lain  <small><%= nMisc %></small></h2>
				<% for (Status tweet : tweetsMisc) { %>
					<article class="media">
						<a class="pull-left" href="">
							<img class="media-object" src="<%= tweet.getUser().getBiggerProfileImageURL() %>" alt="<%= tweet.getUser().getName() %>">
						</a>
						<section class="media-body">
							<h4 class="media-heading"><%= tweet.getUser().getName() %></h4>
							<p><%= tweet.getText() %></p>
							<% if (tweet.getGeoLocation() != null) { %>
								<a class="btn btn-default btn-sm" href="http://maps.google.com/?q=<%= tweet.getGeoLocation().getLatitude() %>,<%= tweet.getGeoLocation().getLongitude() %>">Lihat lokasi</a>
							<% } %>
						</section>
					</article>
				<% } %>
			</div>
		</div>
	</div>

<%@include file="footer.jsp" %>