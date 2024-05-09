module main

import json
import youtube
import store
import connect

fn main() {
	// Embed the json file in the binary
	json_file := youtube.json_file()

	// Parse the json file
	person := json.decode(store.Payload, json_file)!
	connect.insert(person)

	print('done\n')
}
