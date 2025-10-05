/* Video Player Types */

type CaptionTrack {
  label : String,
  src : String,
  language : String,
  isDefault : Bool
}

type VideoQuality {
  label : String,
  src : String,
  height : Number
}

type PlaybackSpeed {
  label : String,
  value : Number
}

type PlayerSettings {
  autoplay : Bool,
  muted : Bool,
  loop : Bool,
  controls : Bool,
  volume : Number,
  playbackRate : Number,
  keyboard : Bool,
  pip : Bool
}

type PlatformInfo {
  platform : String,
  videoId : String
}

type PlaylistItem {
  id : String,
  title : String,
  src : String,
  poster : String,
  duration : Number
}

type HotKey {
  key : String,
  action : String,
  description : String
}

type VideoEvent {
  type : String,
  timestamp : Number,
  currentTime : Number,
  duration : Number,
  volume : Number,
  playbackRate : Number
}

type ThumbnailSprite {
  url : String,
  columns : Number,
  rows : Number,
  width : Number,
  height : Number,
  interval : Number
}
