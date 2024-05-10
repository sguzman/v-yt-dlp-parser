module main

import youtube
import connect

fn main() {
	person := youtube.get_decoded()

	// Insert the sql struct into the database
	connect.insert(person)

	println(person.channel)

	println('done\n')
}
