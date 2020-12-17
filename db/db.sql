CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `email` tinytext NOT NULL,
  `password` varchar(100) NOT NULL,
  `uploaded_replays_id` int NOT NULL DEFAULT 0,
  `followers` int NOT NULL DEFAULT 0,
  `following` int NOT NULL DEFAULT 0,
  `country_code` int
);

CREATE TABLE `playlists` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `owner_id` int,
  `creation_date` datetime,
  `records` int
);

CREATE TABLE `replays` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `type` int,
  `upload_date` datetime,
  `views` int,
  `description` text,
  `uploader_id` int
);

CREATE TABLE `comments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `video_id` int,
  `uploader_id` int,
  `comment` text,
  `posting_date` datetime
);

CREATE TABLE `codecast_replays` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `iframe_link` text
);

CREATE TABLE `generic_recorder_replays` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `events_array_text` text,
  `sound_link` text
);

ALTER TABLE `comments` ADD FOREIGN KEY (`video_id`) REFERENCES `replays` (`id`);

ALTER TABLE `playlists` ADD FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

ALTER TABLE `replays` ADD FOREIGN KEY (`id`) REFERENCES `playlists` (`records`);

ALTER TABLE `replays` ADD FOREIGN KEY (`id`) REFERENCES `users` (`uploaded_replays_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `users` (`followers`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `users` (`following`);
