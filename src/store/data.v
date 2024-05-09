module store

// Struct for json
pub struct Payload {
	this                   int           @[json: '-'; primary; sql_type: 'serial']
	id                     string
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
	files_to_move          Files_to_Move @[sql: '-']
	version                ?Version      @[json: '_version'; sql: '-']
}

// Table for tags
pub struct Tag {
	this int    @[json: '-'; sql: serial]
	name string
}

pub struct Entry {
	this                   int                   @[json: '-'; primary; sql: serial]
	id                     string
	title                  string
	formats                []Format              @[fkey: 'this']
	thumbnails             []Thumbnail2          @[sql: '-']
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
	format_sort_fields     []string              @[json: '_format_sort_fields'; sql: '-']
	automatic_captions     map[string][]Subtitle
	subtitles              map[string][]Subtitle
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
	requested_dowloads     []RequestedDownload   @[sql: '-']
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

pub struct Format {
	this            int               @[json: '-'; sql: serial]
	format_id       string
	format_note     string
	ext             string
	protocol        string
	acodec          string
	vcodec          string
	url             string
	width           int
	height          int
	fps             f64
	rows            int
	columns         int
	fragments       []Fragment        @[sql: '-']
	resolution      string
	aspect_ratio    f32
	filesize_approx ?int
	http_headers    map[string]string @[sql: '-']
	audio_ext       string
	video_ext       string
	vbr             f64
	abr             f64
	tbr             ?f64
	format          string
}

pub struct Fragment {
	url      string
	duration f64
}

pub struct Category {
	this int    @[json: '-'; sql: serial]
	name string
}

pub struct RequestedFormat {
	this                int               @[json: '-']
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
	downloader_options  DownloaderOptions @[sql: '-']
	protocol            string
	resolution          string
	aspect_ratio        f32
	http_headers        map[string]string @[sql: '-']
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

pub struct Heatmap {
	this       int @[json: '-'; sql: serial]
	start_time f32
	end_time   f32
	value      f64
}

pub struct Chapter {
	this       int    @[json: '-'; sql: serial]
	start_time f32
	title      string
	end_time   f32
}

pub struct Subtitle {
	this int    @[json: '-'; sql: serial]
	ext  string
	url  string
	name string
}

pub struct Thumbnail2 {
	this       int    @[json: '-'; sql: serial]
	url        string
	preference int
	id         string
}

pub struct Version {
	version          string
	current_git_head ?string
	release_git_head string
	repository       string
}

pub struct Files_to_Move {}

pub struct Thumbnail {
	this        int     @[json: '-'; sql: serial]
	url         string
	height      ?int
	width       ?int
	id          string
	resolution  ?string
	preferrence ?string
}
