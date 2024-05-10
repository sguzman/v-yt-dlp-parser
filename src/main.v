module main

import youtube

fn main() {
	person := youtube.get_decoded()
	println(person.channel)

	println('done\n')
}
