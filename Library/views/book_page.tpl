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

<div class="book-cover" style="display: inline-block;">
    <img src="/img/{{book_id}}.jpg">
</div>

<div class="info" style="padding-top:12px">
    <title-heading>The Outsider</title-heading>
    <loan-time>LOAN TIME: 2 WEEKS</loan-time><br/><br/>
    <author-heading>Stephen King</author-heading><br/><br/>
    <div class="description">
    An eleven-year-old boy's violated corpse is found in a town park. Eyewitnesses and fingerprints point unmistakably to one of Flint City's most popular citizens. He is Terry Maitland, Little League coach, English teacher, husband, and father of two girls. Detective Ralph Anderson, whose son Maitland once coached, orders a quick and very public arrest. Maitland has an alibi, but Anderson and the district attorney soon add DNA evidence to go with the fingerprints and witnesses. Their case seems ironclad. <br/><br/>As the investigation expands and horrifying answers begin to emerge, King's propulsive story kicks into high gear, generating strong tension and almost unbearable suspense. Terry Maitland seems like a nice guy, but is he wearing another face? When the answer comes, it will shock you as only Stephen King can.
    </div>
    <br/><br/><br/>
    <location-heading>LOCATION: LVL 8 KI046E1</location-heading>
    <br/>
    <button class="button" style="margin-left:24px">LOAN THIS BOOK</button>
</div>


<br/><br>
<div class="section-heading">MORE BY THIS AUTHOR</div><br/><br/>

<div class="book-group">
        <a href="/book_page/{{book_id}}"><img src="/img/{{book_id}}.jpg"></a>
        <a href="/book_page/{{book_id}}"><img src="/img/{{book_id}}.jpg"></a>
        <a href="/book_page/{{book_id}}"><img src="/img/{{book_id}}.jpg"></a>
        <a href="/book_page/{{book_id}}"><img src="/img/{{book_id}}.jpg"></a>
</div>

</body>    
</body>
</html>