module store

// Struct for json
@[table: 'raw_payload']
pub struct Payload {
	id                     string        @[primary]
	channel                string
	channel_id             string
	title                  string
	available              ?string
	channel_follower_count ?int
	description            ?string
	tags                   []Tag         @[fkey: 'this']
	thumbnails             []Thumbnail   @[fkey: 'this']
	uploader_id            string
	uploader_url           string
	modified               ?string
	view_count             ?int
	playlist_count         int
	uploader               string
	channel_url            string
	type_                  string        @[json: '_type']
	entries                []Entry       @[fkey: 'this']
	extractor_key          string
	extractor              string
	webpage_url            string
	original_url           string
	webpage_url_basename   string
	webpage_url_domain     string
	release_year           ?int
	epoch                  int
	files_to_move          Files_to_Move @[skip]
	version                Version       @[json: '_version']
}

// Table for tags
@[table: 'tags']
pub struct Tag {
	this string @[json: '-'; primary; sql: serial]
	name string
}

@[table: 'entries']
pub struct Entry {
	this                   int                   @[json: '-'; primary; sql: serial]
	id                     string
	title                  string
	formats                []Format              @[fkey: 'this']
	thumbnails             []Thumbnail2          @[skip]
	thumbnail              string
	description            string
	channel_id             string
	channel_url            string
	duration               int
	view_count             int
	average_rating         ?f64
	age_limit              int
	webpage_url            string
	categories             []Category            @[fkey: 'this']
	tags                   []Tag                 @[fkey: 'this']
	playable_in_embed      bool
	live_status            string
	release_timestamp      ?int
	format_sort_fields     []string              @[json: '_format_sort_fields'; sql: skip]
	automatic_captions     map[string][]Subtitle @[skip]
	subtitles              map[string][]Subtitle @[skip]
	comment_count          int
	chapters               []Chapter             @[fkey: 'this']
	heatmap                []Heatmap             @[fkey: 'this']
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
	requested_dowloads     []RequestedDownload   @[fkey: 'this']
	requested_formats      []RequestedFormat     @[fkey: 'this']
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

@[table: 'requested_formats']
pub struct RequestedFormat {
	this                int               @[json: '-'; primary; sql: serial]
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
	downloader_options  DownloaderOptions @[skip]
	protocol            string
	resolution          string
	aspect_ratio        f32
	http_headers        map[string]string @[skip]
	video_ext           string
	audio_ext           string
	abr                 f64
	vbr                 f64
	format              string
}

pub struct DownloaderOptions {
	http_chunk_size int
}

pub struct RequestedDownload {
	requested_formats RequestedFormat
}

@[table: 'heatmaps']
pub struct Heatmap {
	this       int @[json: '-'; primary; sql: serial]
	start_time f32
	end_time   f32
	value      f64
}

@[table: 'chapters']
pub struct Chapter {
	this       int    @[json: '-'; primary; sql: serial]
	start_time f32
	title      string
	end_time   f32
}

@[table: 'subtitles']
pub struct Subtitle {
	this int    @[json: '-'; primary; sql: serial]
	ext  string
	url  string
	name string
}

pub struct Thumbnail2 {
	url        string
	preference int
	id         string
}

pub struct Format {}

pub struct Version {
	version          string
	current_git_head ?string
	release_git_head string
	repository       string
}

pub struct Files_to_Move {}

@[table: 'thumbnails']
pub struct Thumbnail {
	this        int     @[json: '-'; primary; sql: serial]
	url         string
	height      ?int
	width       ?int
	id          string
	resolution  ?string
	preferrence ?string
}
