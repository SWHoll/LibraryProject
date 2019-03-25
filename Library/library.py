import caribou
import sqlite3
from bottle import*
from bottle_utils.flash import message_plugin
from bottle_sqlite import SQLitePlugin

database_file = 'library_db.db'
migration_path = 'migrations/'
caribou.upgrade(database_file, migration_path)
install(message_plugin)
install(SQLitePlugin(dbfile=database_file, pragma_foreign_keys=True))

@get('/static/<file:path>')
def serve_static(file):
	return static_file(file, root='./static')

@route('/img/<book_id>')
def fetch_book_cover(book_id):
	return static_file(book_id, root='./img')

@route('/login')
def show_login():
	return template('login')

@get('/home')
def show_home(db):
	all_books = db.execute('SELECT * FROM book ORDER BY id DESC').fetchall()
	recent_books_list = [(book['id'],book['cover_image']) for book in all_books]
	return template('home', recent_books=recent_books_list)

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
	thisBook = db.execute('SELECT * FROM book WHERE id = (?)', [book_id]).fetchone()
	book_details = (thisBook['cover_image'],thisBook['title'],thisBook['genre'],thisBook['description'],thisBook['location'],thisBook['author'])
	matching_authors = db.execute('SELECT * FROM book WHERE author = (?)', [thisBook['author']]).fetchall()
	by_this_author = [(book['id'], book['cover_image']) for book in matching_authors]
	return template('book_page', book_details=book_details, by_this_author=by_this_author)

@get('/search')
def search(db):
	phrase = request.query.phrase
	matching_titles = db.execute('SELECT * FROM book WHERE title = (?)', [phrase]).fetchall()
	matching_authors = db.execute('SELECT * FROM book WHERE author = (?)', [phrase]).fetchall()
	search_results = [(book['id'],book['cover_image']) for book in matching_titles] + [(book['id'],book['cover_image']) for book in matching_authors]
	return template('search', phrase=phrase, search_results=search_results)

@post('/add_book/added')
def book_added(db):
    title = request.forms.get('title')
    author = request.forms.get('author')
    genre = request.forms.get('genre')
    description = request.forms.get('description')
    location = request.forms.get('location')
    date_added = request.forms.get('date')
    cover_image = request.forms.get('cover')
    barcode_nums = request.forms.get('barcode_nums').split()
    book_id = db.execute("INSERT INTO book (title, author, genre, description, location, date_added, cover_image) VALUES (?,?,?,?,?,?,?)",
				(title, author, genre, description, location, date_added, cover_image)).lastrowid
    for barcode in barcode_nums:
        db.execute("INSERT INTO copy (barcode_number, book_id) VALUES (?,?)", (barcode, book_id))
    redirect('/home')

run(host='localhost', port=8080, debug=True)