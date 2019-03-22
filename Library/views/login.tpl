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

<!--TODO: change numbers to integers-->

<br/><div class="section-heading">USER LOG-IN</div><br/>
<div class="standard_form">
    <form action="">
        LIBRARY CARD NUMBER: <input type="text" name="staff_number"><br>
        PASSWORD: <input type="text" name="password"><br>
        <input type="submit" value="LOGIN">
    </form>
</div><br><br><br>

<br/><div class="section-heading">LIBRARIAN LOG-IN</div><br/>
<div class="standard_form">
        <form action="">
            STAFF NUMBER: <input type="text" name="staff_number"><br>
            PASSWORD: <input type="text" name="password"><br>
            <input type="submit" value="LOGIN">
        </form>
</div>

</body>
</html>