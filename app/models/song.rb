class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # def artist_name= (n)
  #   artist = Artist.create
  #   artist.update(name: n)
  #   self.update(artist_id: artist.id)
  # end
  
  # def artist_name
  #   self.artist.name
  # end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

  # def genre_name=(name)
  #   self.genre = Genre.find_or_create_by(name: name)
  # end

  # def genre_name
  #    self.genre ? self.genre.name : nil
  # end

end
