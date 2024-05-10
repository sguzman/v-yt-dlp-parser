module data

// Struct for json
pub struct PayloadJson {
pub:
	this                   int           @[json: '-'; primary; sql_type: 'serial']
	id                     string
	channel                string
	channel_id             string
	title                  string
	available              ?string
	channel_follower_count ?int
	description            ?string
	tags                   []string
	thumbnails             []Thumbnail
	uploader_id            string
	uploader_url           string
	modified               ?string
	view_count             ?int
	playlist_count         int
	uploader               string
	channel_url            string
	type_                  string        @[json: '_type']
	entries                []Entry
	extractor_key          string
	extractor              string
	webpage_url            string
	original_url           string
	webpage_url_basename   string
	webpage_url_domain     string
	release_year           ?int
	epoch                  int
	files_to_move          Files_to_Move
	version                Version       @[json: '_version']
}
