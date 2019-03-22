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
                    <a style="background-color: #efe464; color: black;" href="/my_loans">MY LOANS</a>
                    <div class="dropdown">
                            <button class="dropbtn">MY ACCOUNT</button>
                            <div class="dropdown-items">
                                <a href="/my_account">ACCOUNT</a>
                                <a href="/login">SIGN OUT</a>
                            </div>
                        </div>
                </div>
            </div>


<br/><div class="section-heading">OVERDUE BOOKS</div><br/>

<div class="book-group">
	<a href="/book_page/IB_TheWaspFactory"><img src="/img/IB_TheWaspFactory.jpg"></a>
</div> <br/>

<div class="section-heading">CURRENTLY ON LOAN</div><br/>

<div class="book-cover" style="display: inline-block;">
        <a href="/book_page/GO_AnimalFarm"><img src="/img/GO_AnimalFarm.jpg"></a>
</div>

<div class="info" style="padding-top:12px">
        <title-heading>Animal Farm</title-heading>
        <loan-time>LOAN TIME: 2 WEEKS</loan-time><br/><br/>
        <author-heading>George Orwell</author-heading><br/><br/>
        <div class="description">
                'All animals are equal - but some are more equal than others'
                <br/><br/>When the downtrodden animals of Manor Farm overthrow their master Mr Jones and take over the farm themselves, they imagine it is the beginning of a life of freedom and equality. But gradually a cunning, ruthless élite among them, masterminded by the pigs Napoleon and Snowball, starts to take control. Soon the other animals discover that they are not all as equal as they thought, and find themselves hopelessly ensnared as one form of tyranny is replaced with another.          
                <br/><br/>'It is the history of a revolution that went wrong - and of the excellent excuses that were forthcoming at every step for the perversion of the original doctrine,' wrote Orwell for the first edition of Animal Farm in 1945. Orwell wrote the novel at the end of 1943, but it almost remained unpublished; its savage attack on Stalin, at that time Britain's ally, led to the book being refused by publisher after publisher. Orwell's simple, tragic fable has since become a world-famous classic.
        </div>
        <br/><br/><br/>
        <loan-time style="float:left; padding-left:12px">DUE BACK IN 5 DAYS</loan-time><br/><br/>
        <br/>
        <button class="button" style="margin-left:24px">RENEW THIS LOAN</button>
</div>

<div class="book-cover" style="display: inline-block;">
        <a href="/book_page/SK_TheOutsider"><img src="/img/SK_TheOutsider.jpg"></a>
</div>

<div class="info" style="padding-top:12px">
        <title-heading>The Outsider</title-heading>
        <loan-time>LOAN TIME: 2 WEEKS</loan-time><br/><br/>
        <author-heading>Stephen King</author-heading><br/><br/>
        <div class="description">
        An eleven-year-old boy's violated corpse is found in a town park. Eyewitnesses and fingerprints point unmistakably to one of Flint City's most popular citizens. He is Terry Maitland, Little League coach, English teacher, husband, and father of two girls. Detective Ralph Anderson, whose son Maitland once coached, orders a quick and very public arrest. Maitland has an alibi, but Anderson and the district attorney soon add DNA evidence to go with the fingerprints and witnesses. Their case seems ironclad. <br/><br/>As the investigation expands and horrifying answers begin to emerge, King's propulsive story kicks into high gear, generating strong tension and almost unbearable suspense. Terry Maitland seems like a nice guy, but is he wearing another face? When the answer comes, it will shock you as only Stephen King can.
        </div>
        <br/><br/><br/>
        <loan-time style="float:left; padding-left:12px">DUE BACK IN 3 DAYS</loan-time><br/><br/>
        <br/>
        <button class="button" style="margin-left:24px">RENEW THIS LOAN</button>
</div>

</body>
</html>