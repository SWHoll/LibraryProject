def upgrade(connection):
    sql = """CREATE TABLE IF NOT EXISTS user (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT,
	card_no INTEGER NOT NULL UNIQUE,
	password TEXT NOT NULL,
	address TEXT,
	dob TEXT
    );"""
    connection.execute(sql)

    sql = """CREATE TABlE IF NOT EXISTS admin (
	                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	                first_name TEXT NOT NULL ,
	                last_name TEXT,
	                staff_no INTEGER NOT NULL UNIQUE,
	                password TEXT NOT NULL,
	                address TEXT,
	                dob TEXT
    );"""
    connection.execute(sql)

    sql = """CREATE TABLE IF NOT EXISTS book (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	title TEXT NOT NULL,
    author TEXT,
    genre TEXT,
	description TEXT,
	location TEXT NOT NULL,
	date_added TEXT NOT NULL,
	cover_image TEXT
    );"""
    connection.execute(sql)

    sql = """CREATE TABLE IF NOT EXISTS copy (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	barcode_number INTEGER NOT NULL UNIQUE,
	book_id INTEGER NOT NULL,
	FOREIGN KEY (book_id) REFERENCES book(id)
    );"""
    connection.execute(sql)

    sql = """CREATE TABLE IF NOT EXISTS loan (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	copy_id INTEGER NOT NULL,
	borrower_id INTEGER NOT NULL,
	start_date TEXT NOT NULL,
	due_date TEXT NOT NULL,
	returned BOOLEAN NOT NULL,
	FOREIGN KEY (copy_id) REFERENCES copy(id),
	FOREIGN KEY (borrower_id) REFERENCES user(id)
    );"""
    connection.execute(sql)

    connection.commit()

def downgrade():
	pass
	