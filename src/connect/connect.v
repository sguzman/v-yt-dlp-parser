module connect

import db.pg
import store {
	Category,
	Chapter,
	Entry,
	Format,
	Heatmap,
	Payload,
	RequestedFormat,
	Subtitle,
	Tag,
	Thumbnail,
	Thumbnail2,
	Version,
}

__global (
	con pg.DB
)

fn drop_ignore_payload() {
	sql con {
		drop table Payload
	} or {
		println('Could not drop table Payload')
		return
	}

	println('Success: drop table Payload')
}

fn create_ignore_payload() {
	drop_ignore_payload()
	sql con {
		create table Payload
	} or {
		println('Could not create table Payload')
		return
	}

	println('Success: create table Payload')
}

fn drop_ignore_tag() {
	sql con {
		drop table Tag
	} or {
		println('Could not drop table Tag')
		return
	}

	println('Success: drop table Tag')
}

fn create_ignore_tag() {
	drop_ignore_tag()
	sql con {
		create table Tag
	} or {
		println('Could not create table Tag')
		return
	}

	println('Success: create table Tag')
}

fn drop_ignore_thumbnail() {
	sql con {
		drop table Thumbnail
	} or {
		println('Could not drop table Thumbnail')
		return
	}

	println('Success: drop table Thumbnail')
}

fn create_ignore_thumbnail() {
	drop_ignore_thumbnail()
	sql con {
		create table Thumbnail
	} or {
		println('Could not create table Thumbnail')
		return
	}

	println('Success: create table Thumbnail')
}

fn drop_ignore_entry() {
	sql con {
		drop table Entry
	} or {
		println('Could not drop table Entry')
		return
	}

	println('Success: drop table Entry')
}

fn create_ignore_entry() {
	drop_ignore_entry()
	sql con {
		create table Entry
	} or {
		println('Could not create table Entry')
		return
	}

	println('Success: create table Entry')
}

fn drop_ignore_format() {
	sql con {
		drop table Format
	} or {
		println('Could not drop table Format')
		return
	}

	println('Success: drop table Format')
}

fn create_ignore_format() {
	drop_ignore_format()
	sql con {
		create table Format
	} or {
		println('Could not create table Format')
		return
	}

	println('Success: create table Format')
}

fn drop_ignore_thumbnail2() {
	sql con {
		drop table Thumbnail2
	} or {
		println('Could not drop table Thumbnail2')
		return
	}

	println('Success: drop table Thumbnail2')
}

fn create_ignore_thumbnail2() {
	drop_ignore_thumbnail2()
	sql con {
		create table Thumbnail2
	} or {
		println('Could not create table Thumbnail2')
		return
	}

	println('Success: create table Thumbnail2')
}

fn drop_ignore_category() {
	sql con {
		drop table Category
	} or {
		println('Could not drop table Category')
		return
	}

	println('Success: drop table Category')
}

fn create_ignore_category() {
	drop_ignore_category()
	sql con {
		create table Category
	} or {
		println('Could not create table Category')
		return
	}

	println('Success: create table Category')
}

fn drop_ignore_heatmap() {
	sql con {
		drop table Heatmap
	} or {
		println('Could not drop table Heatmap')
		return
	}

	println('Success: drop table Heatmap')
}

fn create_ignore_heatmap() {
	drop_ignore_heatmap()
	sql con {
		create table Heatmap
	} or {
		println('Could not create table Heatmap')
		return
	}

	println('Success: create table Heatmap')
}

fn drop_ignore_chapter() {
	sql con {
		drop table Chapter
	} or {
		println('Could not drop table Chapter')
		return
	}

	println('Success: drop table Chapter')
}

fn create_ignore_chapter() {
	drop_ignore_chapter()
	sql con {
		create table Chapter
	} or {
		println('Could not create table Chapter')
		return
	}

	println('Success: create table Chapter')
}

fn drop_ignore_subtitle() {
	sql con {
		drop table Subtitle
	} or {
		println('Could not drop table Subtitle')
		return
	}

	println('Success: drop table Subtitle')
}

fn create_ignore_subtitle() {
	drop_ignore_subtitle()
	sql con {
		create table Subtitle
	} or {
		println('Could not create table Subtitle')
		return
	}

	println('Success: create table Subtitle')
}

fn drop_ignore_version() {
	sql con {
		drop table Version
	} or {
		println('Could not drop table Version')
		return
	}

	println('Success: drop table Version')
}

fn create_ignore_version() {
	drop_ignore_version()
	sql con {
		create table Version
	} or {
		println('Could not create table Version')
		return
	}

	println('Success: create table Version')
}

fn drop_ignore_requested_format() {
	sql con {
		drop table RequestedFormat
	} or {
		println('Could not drop table RequestedFormat')
		return
	}

	println('Success: drop table RequestedFormat')
}

fn create_ignore_requested_format() {
	drop_ignore_requested_format()
	sql con {
		create table RequestedFormat
	} or {
		println('Could not create table RequestedFormat')
		return
	}

	println('Success: create table RequestedFormat')
}

fn init() {
	db := pg.connect(pg.Config{
		host: 'localhost'
		port: 5432
		user: 'admin'
		password: 'admin'
		dbname: 'youtube'
	}) or { panic('Could not connect to database') }
	con = db

	create_ignore_payload()
	create_ignore_tag()
	create_ignore_thumbnail()
	create_ignore_entry()
	create_ignore_format()
	create_ignore_thumbnail2()
	create_ignore_category()
	create_ignore_heatmap()
	create_ignore_chapter()
	create_ignore_subtitle()
	create_ignore_version()
	create_ignore_requested_format()

	print('Tables created\n')
}

fn cleanup() {
	con.close()
	print('Connection closed\n')
}

pub fn insert(payload Payload) {
	sql con {
		insert payload into Payload
	} or { panic('Could not insert payload') }
}
