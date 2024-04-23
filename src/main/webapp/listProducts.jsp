<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="Domain.Product"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<style>
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

html, body {
	height: 100%;
	width: 100%;
	background-color: rgb(216, 216, 216);
}

/* ~~~~~~~~~~~ Navigation section CSS ~~~~~~~~~~~~~~~ */
nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 60px;
}

#nav_sec_left {
	display: flex;
	align-items: center;
	width: fit-content;
	margin-left: 12px;
}

#logo {
	height: 40px;
	margin-right: 12px;
	width: auto;
	background-color: white;
	padding: 2px 4px 2px 4px;
}

#nav_item {
	display: flex;
	justify-content: space-between;
	width: 150px;
}

#nav_item li {
	list-style: none;
}

#nav_item li a {
	text-decoration: none;
	color: rgb(0, 0, 0);
}

#log_btn {
	margin-right: 12px;
	padding: 5px 10px;
	border-radius: 5px;
	border: none;
	background-color: white;
}

/* ~~~~~~~~~~~ main section CSS ~~~~~~~~~~~~~~~ */
#main {
	display: flex;
	height: 100%;
	width: 100%;
}

#left_section {
	height: 100%;
	width: 22%;
}

#aside_items {
	padding: 28px 0px;
	display: flex;
	flex-direction: column;
	gap: 10px;
	width: 80%;
	height: 100%;
}

#aside_items li {
	list-style: none;
	width: 100%;
}

#aside_items li a {
	text-decoration: none;
	color: black;
	display: block;
	padding: 3px;
	padding-left: 18px;
}

#aside_items li:hover, .active {
	background-color: white;
	border-radius: 0px 10px 10px 0px;
}

#aside_items li:hover a {
	background-color: white;
	border-radius: 0px 10px 10px 0px;
}

#right_section {
	height: 100%;
	width: 75%;
	padding: 28px 0px;
}

#right_upper {
	height: 25px;
	display: flex;
	align-items: center;
}

#category {
	text-decoration: none;
	color: black;
	/* padding: 3px; */
}

#right_lower {
	background-color: rgb(216, 216, 216);
	height: 100%;
}

footer {
	height: 80px;
	width: 100%;
	background-color: black;
}

/*-----------------------------------------------------*/
* {
	margin: none;
	padding: none;
	background-color: rgb(213, 213, 213);
	font-family: sans-serif;
}

.navbar {
	padding: 2px;
	display: flex;
	align-items: center;
	color: gray;
	justify-content: space-between;
}

.logo {
	display: flex;
	align-items: center;
	background-color: white;
	padding-left: 10px;
	padding-right: 10px;
}

.logo>p {
	background-color: white;
	margin-left: 10px;
}

.nav-page-url {
	padding-left: 50px;
	padding-right: 10px;
	font-weight: 400;
	color: rgb(22, 189, 145);
	font-size: 18px;
}

.sidebar {
	width: 15vw;
	display: flex;
	padding-left: 10px;
	padding-right: 20px;
	padding-top: 15px;
	flex-direction: column;
}

.sidebar>a {
	text-decoration: none;
	margin-bottom: 10px;
	color: gray;
	/* width: 100%; */
	display: inline;
	padding: 10px;
}

.items {
	padding-left: 10px;
	position: relative;
}

.items>p {
	/* position: absolute; */
	top: 10px;
	font-weight: bold;
}

.items-list {
	background-color: inherit;
	display: flex;
	flex-wrap: wrap;
	width: 80vw;
}

.item {
	padding: 10px;
	background-color: white;
	width: 20vw;
	position: relative;
	padding: 2vw;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-right: 1vw;
	margin-bottom: 10px;
}

.item>* {
	background-color: white;
	text-align: center;
	font-size: 12px;
	color: gray;
	font-weight: 700;
}

.item>img {
	height: 15vh;
	width: 100px;
}

.item>.view-icon {
	height: 10px;
	width: 15px;
	top: 10px;
	right: 10px;
	position: absolute;
}
/* product page */
.searchbar {
	padding: 20px;
	/* margin-right: 170px; */
	width: 71vw;
	margin-top: 10px;
	margin-bottom: 10px;
	display: flex;
	background-color: white;
	justify-content: space-between;
}

.searchbar>input {
	width: 30vw;
	padding: 5px;
	outline: none;
	border: none;
	background-color: rgb(236, 236, 236);
}

.searchbar>button, .item>button {
	background-color: rgb(5, 158, 107);
	padding: 5px;
	padding-right: 15px;
	padding-left: 15px;
	color: white;
	outline: none;
	border: none;
	border-radius: 2px;
}
</style>
<body>
	<nav>
	<div id="nav_sec_left">
		<img src="./resources/images/logo.svg" alt="logo" id="logo" />
		<ul id="nav_item">
			<li><a href="#" style="color: rgb(5, 158, 35) !important;">Home</a></li>
			<span>/</span>
			<li><a href="#" style="color: rgb(5, 158, 35) !important;">Products</a></li>
		</ul>
	</div>
	<div id="nav_sec_right">
		<button id="log_btn">Logout</button>
	</div>
	</nav>
	<section id="main">
	<div id="left_section">
		<ul id="aside_items">
			<li><a href="#">Dashboard</a></li>
			<li><a href="#" class="active">Products</a></li>
			<li><a href="#">Packages</a></li>
			<li><a href="#">My Rentals</a></li>
			<li><a href="#">My Orders</a></li>
			<li><a href="#">Settings</a></li>
		</ul>
	</div>
	<div id="right_section">
		<div id="right_upper">
			<a href="#" id="category">Products</a>
		</div>
		<div id="right_lower">
			<div class="items">
				<div class="searchbar">
					<input type="text" name="" id="" placeholder="city">
					<button>FILTER</button>
				</div>

<div class="items-list">
    <% List<Product> productList = (List<Product>) request.getAttribute("productList");
    if (productList != null && !productList.isEmpty()) {
        for (Product product : productList) { %>
            <div class="item">
                <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                <h4><%= product.getName() %></h4>
                <p>Brand: <%= product.getBrand().getName() %></p>
                <p>Category: <%= product.getProductCategory().getCategory() %></p>
                <!-- Add more product details here -->
                <button>DETAILS</button>
            </div>
    <% } 
    } else { %>
        <div class="no-items-message">
            <p>No products available.</p>
        </div>
    <% } %>
</div>


			</div>
		</div>
	</div>
	</section>
	<!-- <footer></footer> -->
</body>

</html>