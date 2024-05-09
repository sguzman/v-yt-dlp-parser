module connect

import db.sqlite
import store

__global (
	con sqlite.DB
)

fn init() {
	print('Connecting to database\n')
	con = sqlite.connect('data.db') or { panic('Could not connect to database') }

	// Create the table
	sql con {
		create table store.Payload
	} or { panic('Could not create table') }
}

fn cleanup() {
	con.close() or { panic('Could not close connection') }
	print('Connection closed\n')
}

pub fn insert(payload store.Payload) {
	sql con {
		insert payload into store.Payload
	} or { panic('Could not insert payload') }
}
