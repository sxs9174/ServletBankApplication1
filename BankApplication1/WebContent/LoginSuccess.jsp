<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  Credit Pankaj Kumar
http://www.journaldev.com/1907/java-servlet-session-management-tutorial-with-examples-of-cookies-httpsession-and-url-rewriting -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>You are logged in!</title>
</head>
<body>
  <ul class="top-nav-ul">
    <li class="top-nav-list"><a href="openacct.html"
      class="top-nav-anchor">Open Account</a></li>
    <li class="top-nav-list"><a href="balance.html"
      class="top-nav-anchor">Balance</a></li>
    <li class="top-nav-list"><a href="deposit.html"
      class="top-nav-anchor">Deposit</a></li>
    <li class="top-nav-list"><a href="withdraw.html"
      class="top-nav-anchor">Withdraw</a></li>
    <li class="top-nav-list"><a href="transfer.html"
      class="top-nav-anchor">Transfer</a></li>
    <li class="top-nav-list"><a href="login.html"
      class="top-nav-anchor">Login</a></li>
  </ul>
	<%
	  //allow access only if session exists
	  String user = null;
	  if (session.getAttribute("user") == null) {
	    response.sendRedirect("login.html");
	  } else {
	    user = (String) session.getAttribute("user");
	  }
	  String userName = null;
	  String sessionID = null;
	  Cookie[] cookies = request.getCookies();
	  if (cookies != null) {
	    for (Cookie cookie : cookies) {
	      if (cookie.getName().equals("user")) {
	        userName = cookie.getValue();
	      }
	      if (cookie.getName().equals("JSESSIONID")) {
	        sessionID = cookie.getValue();
	      }
	    }
	  }
	%>
	<h3>
		Hi
		<%=userName%>, Login successful. Your Session ID=<%=sessionID%></h3>
	<br/> User = <%=user%>
	<br/>
	<a href="Logout.jsp">Checkout Page</a>
	<form action="/BankApplication1/logout" method="post">
		<input type="submit" value="Logout">
	</form>
</body>
</html>