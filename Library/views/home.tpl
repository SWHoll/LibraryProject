<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf8">
		<title>MyLibrary</title>
		<link rel="stylesheet" href="/static/lib.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
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

    <!-- display the 5 most recently added books -->
    <br/><div class="section-heading">RECENTLY ADDED</div><br/>	<br/>
	<div class="book-group">
        % for book_id in recent_books:
            <a href="/book_page/{{book_id}}"><img src="/img/{{book_id}}.jpg"></a>
        % end
	</div>

</body>
</html>