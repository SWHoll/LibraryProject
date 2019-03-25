<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf8">
		<title>MyLibrary</title>
		<link rel="stylesheet" href="/static/lib.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- navigation -->
	<div class="top-nav">
		<a style="background-color: #efe464; color: black;" href="/home">HOME</a>
		<div class="search-bar">
			<form action="/search">
			    <input type="text" placeholder="Search..." name="phrase">
			</form>
		</div>
		<div class="r">
			<a href="/add_book">ADD BOOK</a>
			<a href="/my_loans">MY LOANS</a>
			<div class="dropdown">
					<button class="dropbtn">MY ACCOUNT</button>
					<div class="dropdown-items">
						<a href="/my_account">MY ACCOUNT</a>
						<a href="/login">SIGN OUT</a>
					</div>
				</div>
		</div>
	</div>

    <!-- display recently added books -->
    <br/><div class="section-heading">RECENTLY ADDED</div><br/>	<br/>
	<div class="book-group">
        % for book in recent_books:
			<!--<a href="/book_page/{{book}}"><img src="/img/{{book}}.jpg"></a>-->
			<a href="/book_page/{{book[0]}}"><img src="img/{{book[1]}}.jpg"></a>
        % end
	</div>

</body>
</html>