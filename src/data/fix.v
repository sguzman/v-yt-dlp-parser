module data

// Convert a PayloadJson to a PayloadSql
pub fn json_to_sql(json PayloadJson) PayloadSql {
	// Create a []Tag from the []string in PayloadJson
	mut tags := []Tag{}
	for tag in json.tags {
		tags << Tag{
			name: tag
		}
	}

	return PayloadSql{
		id: json.id
		channel: json.channel
		channel_id: json.channel_id
		title: json.title
		available: json.available
		channel_follower_count: json.channel_follower_count
		description: json.description
		tags: tags
		thumbnails: json.thumbnails
		uploader_id: json.uploader_id
		uploader_url: json.uploader_url
		modified: json.modified
		view_count: json.view_count
		playlist_count: json.playlist_count
		uploader: json.uploader
		channel_url: json.channel_url
		type_: json.type_
		entries: json.entries
		extractor_key: json.extractor_key
		extractor: json.extractor
		webpage_url: json.webpage_url
		original_url: json.original_url
		webpage_url_basename: json.webpage_url_basename
		webpage_url_domain: json.webpage_url_domain
		release_year: json.release_year
		epoch: json.epoch
		files_to_move: json.files_to_move
		version: json.version
	}
}
