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
                <a href="/home">HOME</a>
                <div class="search-bar">
                    <form action="/search">
                        <input type="text" placeholder="Search..." name="phrase">
                    </form>
                </div>
                <div class="r">
                    <a style="background-color: #efe464; color: black;" href="/add_book">ADD BOOK</a>
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

<br/><div class="section-heading">ADD A NEW BOOK TO THE LIBRARY</div><br/>
<div class="add_book_form">
    <form method="post" action="/add_book/added">
        <!-- book fields-->
        TITLE: <input type="text" name="title"><br>
        AUTHOR: <input type="text" name="author"><br>
        GENRE: <input type="text" name="genre"><br>
        DESCRIPTION: <br><textarea cols=111 rows=5 name="description"></textarea><br><br>
        LOCATION: <input type="text" name="location"><br>
        DATE ADDED (dd/mm/yyyy): <input type="text" name="date"><br>
        COVER ID: <input type="text" name="cover"><br>
        <!-- copy fields -->
        BARCODE NUMBER:<br>
        For multiple copies separate with whitespace. 
        <input type="text" name="barcode_nums"><br>
        <input type="submit" value="ADD TO LIBRARY">
    </form>
</div>

</body>
</html>