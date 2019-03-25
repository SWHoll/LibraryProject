import sqlite3
from bottle import*
from bottle_utils.flash import message_plugin
from bottle_sqlite import SQLitePlugin

database_file = 'library_db.db'
conn = sqlite3.connect(database_file)
install(message_plugin)
install(SQLitePlugin(dbfile=database_file, pragma_foreign_keys=True))


# Database initialisation

conn.execute("""CREATE TABLE IF NOT EXISTS user (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT,
	card_no INTEGER NOT NULL UNIQUE,
	password TEXT NOT NULL,
	address TEXT,
	dob TEXT
);""")
conn.execute("""CREATE TABlE IF NOT EXISTS admin (
	                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	                first_name TEXT NOT NULL ,
	                last_name TEXT,
	                staff_no INTEGER NOT NULL UNIQUE,
	                password TEXT NOT NULL,
	                address TEXT,
	                dob TEXT
);""")
conn.execute("""CREATE TABLE IF NOT EXISTS book (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	title TEXT NOT NULL,
    author TEXT,
    genre TEXT,
	description TEXT,
	location TEXT NOT NULL,
	date_added TEXT NOT NULL,
	cover_image TEXT
);""")
conn.execute("""CREATE TABLE IF NOT EXISTS copy (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	barcode_number INTEGER NOT NULL UNIQUE,
	book_id INTEGER NOT NULL,
	FOREIGN KEY (book_id) REFERENCES book(id)
);""")
conn.execute("""CREATE TABLE IF NOT EXISTS loan (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	copy_id INTEGER NOT NULL,
	borrower_id INTEGER NOT NULL,
	start_date TEXT NOT NULL,
	due_date TEXT NOT NULL,
	returned BOOLEAN NOT NULL,
	FOREIGN KEY (copy_id) REFERENCES copy(id),
	FOREIGN KEY (borrower_id) REFERENCES user(id)
);""")
conn.commit()


# Get / Post / Routes

@get('/static/<file:path>')
def serve_static(file):
	return static_file(file, root='./static')

@route('/login')
def show_login():
	return template('login')

@get('/home')
def show_home():
	# TODO: query db for 5 most recent 'date_added's
	recent_books = ['SK_Thinner', "SK_TheOutsider", "SK_Firestarter", "SK_Cujo", "GO_AnimalFarm", "IB_TheWaspFactory"]
	return template('home', recent_books=recent_books)

@route('/my_loans')
def show_my_loans():
	return template('my_loans')

@route('/my_account')
def show_my_account():
	return template('my_account')

@route('/add_book')
def show_add_book():
	return template('add_book')

@get('/book_page/<book_id>')
def show_book_page(db, book_id):
	return template('book_page', book_id=book_id)

@route('/img/<book_id>')
def fetch_book_cover(book_id):
	return static_file(book_id, root='./img')

@get('/search')
def search(db):
	phrase = request.query.phrase
	return template('search', phrase=phrase)

@post('/add_book/added')
def book_added(db):
    # add book
    title = request.forms.get('title')
    author = request.forms.get('author')
    genre = request.forms.get('genre')
    description = request.forms.get('description')
    location = request.forms.get('location')
    date_added = request.forms.get('date')
    cover_image = request.forms.get('cover')
    db.execute("insert into book (title, author, genre, description, location, date_added, cover_image) values (?,?,?,?,?,?,?)",
				(title, author, genre, description, location, date_added, cover_image))
    book_id = db.execute("select last_insert_rowid()")
    # add copies
    barcode_nums = request.forms.get('barcode_nums').split()
    for barcode in barcode_nums:
        db.execute("insert into copy (barcode_number, book_id) values (?,?)", (barcode, book_id))
    redirect('/home')


# Testing

@get('/books/add')
def addBook(db):
    query = request.query
    return f'Book title: {query.title}, description: {query.description}'

@route('/add/author')
def addAuthor(db):
    query = request.query
    conn.execute("""INSERT INTO author (first_name, last_name) VALUES (?,?);""", (query.first_name, query.last_name))
    conn.commit()

run(host='localhost', port=8080, debug=True)