import sqlite3
from bottle import*
from bottle_utils.flash import message_plugin
from bottle_sqlite import SQLitePlugin

import caribou
database_file = 'library_db.db'
migration_path = 'migrations/'
caribou.upgrade(database_file, migration_path)

#conn = sqlite3.connect(database_file)
install(message_plugin)
install(SQLitePlugin(dbfile=database_file, pragma_foreign_keys=True))

# Get / Post / Routes

@get('/static/<file:path>')
def serve_static(file):
	return static_file(file, root='./static')

@route('/login')
def show_login():
	return template('login')

@get('/home')
def show_home(db):
	# show books by most recent
	books_result = db.execute('SELECT * FROM book ORDER BY id DESC').fetchall()
	recent_books = [(book['id'],book['cover_image']) for book in books_result]
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
	# fetch the details of this book
	b = db.execute('SELECT * FROM book WHERE id = (?)', book_id).fetchone()
	book_details = (b['cover_image'],b['title'],b['genre'],b['description'],b['location'],b['author'])
	# TODO: fetch others by this author
	#author = book_details[5] #is returning a string of the chars
	#author_results = db.execute('SELECT * FROM book WHERE author = (?)', author)
	#author_books = [(a['cover_image'],a['id']) for a in author_results]
	return template('book_page', thisBook=book_details)

@route('/img/<book_id>')
def fetch_book_cover(book_id):
	return static_file(book_id, root='./img')

@get('/search')
def search(db):
	phrase = request.query.phrase
	# find matching titles
	books_results = db.execute('SELECT * FROM book WHERE title = (?)', [phrase]).fetchall()
	search_results = [(book['id'],book['cover_image']) for book in books_results]
	# TODO: find matches by author
	#author_results = db.execute('SELECT * FROM book WHERE author = (?)', [phrase]).fetchall()
	search_results = search_results.append((book['id'],book['cover_image'])) for book in author_results
	return template('search', phrase=phrase, search_results=search_results)

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
    book_id = db.execute("INSERT INTO book (title, author, genre, description, location, date_added, cover_image) VALUES (?,?,?,?,?,?,?)",
				(title, author, genre, description, location, date_added, cover_image)).lastrowid
    # add copies
    barcode_nums = request.forms.get('barcode_nums').split()
    for barcode in barcode_nums:
        db.execute("INSERT INTO copy (barcode_number, book_id) VALUES (?,?)", (barcode, book_id))
    redirect('/home')

run(host='localhost', port=8080, debug=True)