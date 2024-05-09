module connect

import db.pg
import store

__global (
	con pg.DB
)

fn init() {
	db := pg.connect(pg.Config{
		host: 'localhost'
		port: 5432
		user: 'admin'
		password: 'admin'
		dbname: 'youtube'
	}) or { panic('Could not connect to database') }
	con = db

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
	con.close()
	print('Connection closed\n')
}

pub fn insert(payload store.Payload) {
	sql con {
		insert payload into store.Payload
	} or { panic('Could not insert payload') }
}
