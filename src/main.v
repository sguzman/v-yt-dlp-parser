module main

import json
import os
import db.sqlite

// Struct for json
struct Person {
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

struct Entry {
	id                     string
	title                  string
	formats                []Format
	thumbnails             []Thumbnail2
	thumbnail              string
	description            string
	channel_id             string
	channel_url            string
	duration               int
	view_count             int
	average_rating         ?f64
	age_limit              int
	webpage_url            string
	categories             []string
	tags                   []string
	playable_in_embed      bool
	live_status            string
	release_timestamp      ?int
	format_sort_fields     []string              @[json: '_format_sort_fields']
	automatic_captions     map[string][]Subtitle
	subtitles              map[string][]Subtitle
	comment_count          int
	chapters               []Chapter
	heatmap                []Heatmap
	like_count             int
	channel                string
	channel_follower_count ?int
	channel_is_verified    bool
	uploader               string
	uploader_id            string
	uploader_url           string
	upload_date            string
	availability           string
	original_url           string
	webpage_url_basename   string
	webpage_url_domain     string
	extractor              string
	extractor_key          string
	playlist_count         int
	playlist               string
	playlist_id            string
	playlist_title         string
	playlist_uploader      string
	playlist_uploader_id   string
	n_entries              int
	playlist_index         int
	last_playlist_index    int                   @[json: '__last_playlist_index']
	playlist_autonumber    int
	display_id             string
	fulltitle              string
	duration_string        string
	release_year           ?int
	is_live                bool
	was_live               bool
	requested_subtitles    ?string
	has_drm                ?string               @[json: '_has_drm']
	epoch                  int
	requested_dowloads     []RequestedDownload
	requested_formats      []RequestedFormat
	format                 string
	format_id              string
	ext                    string
	protocol               string
	language               string
	format_note            string
	filesize_approx        int
	tbr                    f64
	width                  int
	height                 int
	resolution             string
	fps                    int
	dynamic_range          string
	vcodec                 string
	vbr                    f64
	stretched_ratio        ?int
	aspect_ratio           f32
	acodec                 string
	abr                    f64
	asr                    int
	audio_channels         int
}

struct RequestedFormat {
	asr                 ?int
	filesize            int
	format_id           string
	format_note         string
	source_preference   int
	fps                 ?int
	audio_channels      ?int
	height              int
	quality             f64
	has_drm             bool
	tbr                 f64
	filesize_approx     int
	url                 string
	width               int
	language            ?string
	language_preference ?int
	preferrence         ?string
	ext                 string
	vcodec              string
	acodec              string
	dynamic_range       string
	container           string
	downloader_options  DownloaderOptions
	protocol            string
	resolution          string
	aspect_ratio        f32
	http_headers        map[string]string
	video_ext           string
	audio_ext           string
	abr                 f64
	vbr                 f64
	format              string
}

struct DownloaderOptions {
	http_chunk_size int
}

struct RequestedDownload {
	requested_formats RequestedFormat
}

struct Heatmap {
	start_time f32
	end_time   f32
	value      f64
}

struct Chapter {
	start_time f32
	title      string
	end_time   f32
}

struct Subtitle {
	ext  string
	url  string
	name string
}

struct Thumbnail2 {
	url        string
	preference int
	id         string
}

struct Format {}

struct Version {
	version          string
	current_git_head ?string
	release_git_head string
	repository       string
}

struct Files_to_Move {}

struct Thumbnail {
	url         string
	height      ?int
	width       ?int
	id          string
	resolution  ?string
	preferrence ?string
}

fn main() {
	// Read in file and parse json
	data := os.read_file('data.json')!
	person := json.decode(Person, data)!

	println(person)
}
