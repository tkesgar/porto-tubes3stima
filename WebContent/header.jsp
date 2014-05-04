<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="id">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Twitter Analysis Lain</title>
	
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="style.css">
	
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
	
		<nav class="navbar navbar-inverse navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%= this.getServletContext().getContextPath() %>">Twitter Analysis Lain</a>
				</div>
			
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="app.jsp">Aplikasi</a></li>
						<li><a href="howto.jsp">Petunjuk</a></li>
						<li><a href="about.jsp">Perihal</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right hidden-xs">
						<li><p class="navbar-text"><span id="navbar_clock"></span></p></li>
					</ul>
				</div>
			</div>
		</nav>

		<header id="page_header" class="container">
			<div class="jumbotron">
				<h1>Twitter Analysis Lain</h1>
				<p>Find out traffic conditions from latest tweets.</p>
			</div>
		</header>