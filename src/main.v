module main

import json
import os
import db.sqlite
import youtube
import store
import connect

fn main() {
	// Embed the json file in the binary
	json_file := youtube.json_file()

	// Parse the json file
	person := json.decode(store.Payload, json_file)!

	// Insert the data into the database
	connect.insert(person)
}
