# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy

  def n_plus_one_tracks
    my_albums = self.albums
    track_counts = {}
    my_albums.each do |album|
      track_counts[album.title] = album.tracks.length
    end

    track_counts
  end

  def better_tracks_query
    # Your code here
    Artist
      .select('albums.title', 'COUNT(*) AS track_count')
      .joins(albums: [:tracks])
      .where(name: self.name)
      .group('albums.title')
      .map { |album|  [album.title, album.track_count] }
      .to_h
  end
end