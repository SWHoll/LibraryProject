<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf8">
		<title>Book | MyLibrary</title>
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

        <div class="book-cover" style="display: inline-block;">
            <img src="/img/{{book_details[0]}}.jpg">
        </div>

        <div class="info" style="padding-top:12px">
            <title-heading>{{book_details[1]}}</title-heading><br><br>
            
            <author-heading>{{book_details[5]}}</author-heading><br/><br/>
            <div class="description">{{book_details[3]}}</div><br/><br/><br/>
            <location-heading>LOCATION: {{book_details[4]}}</location-heading><br/><br>
            <button class="button" style="margin-left:24px">LOAN THIS BOOK</button>
        </div><br/><br>

        <div class="section-heading">MORE BY THIS AUTHOR</div>
        <div class="book-group">
            % for book in by_this_author:
                <a href="/book_page/{{book[0]}}"><img src="../img/{{book[1]}}.jpg"></a>
            % end
        </div>   
    </body>

</html>