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

<!-- book details -->
<div class="book-cover" style="display: inline-block;">
    <img src="/img/{{thisBook[0]}}.jpg">
</div>

<div class="info" style="padding-top:12px">
    <title-heading>{{thisBook[1]}}</title-heading>
    <loan-time>GENRE: {{thisBook[2]}}</loan-time><br/><br/>
    <author-heading>{{thisBook[5]}}</author-heading><br/><br/>
    <div class="description">{{thisBook[3]}}</div>
    <br/><br/><br/>
    <location-heading>LOCATION: {{thisBook[4]}}</location-heading>
    <br/>
    <button class="button" style="margin-left:24px">LOAN THIS BOOK</button>
</div>

<!-- more by this author -->
<br/><br>
<div class="section-heading">MORE BY THIS AUTHOR</div><br/><br/>
<div class="book-group">
    <!-- TODO: hrefs with images -->
</div>

</body>    
</body>
</html>