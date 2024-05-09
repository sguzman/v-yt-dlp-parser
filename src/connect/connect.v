module connect

import db.sqlite
import store

__global (
	con sqlite.DB
)

fn init() {
	con = sqlite.connect('data.db') or { panic('Could not connect to database') }

	// Create the table
	sql con {
		create table store.Payload
		create table store.Tag
		create table store.Entry
		create table store.Format
		create table store.Fragment
		create table store.Category
		create table store.RequestedFormat
		create table store.Heatmap
		create table store.Chapter
		create table store.Subtitle
		create table store.Thumbnail
	} or { panic('Could not create tables') }
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
