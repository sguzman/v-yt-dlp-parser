module main

import json
import os
import db.sqlite
import youtube
import store

fn main() {
	// Embed the json file in the binary
	json_file := youtube.json_file()

	// Parse the json file
	person := json.decode(store.Payload, json_file)!
	println(person)
}
