class Song < ActiveRecord::Base
  # add associations
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    genre.name
  end

  def artist_name
    if artist
      artist.name
    end
  end

  def genre_name
    if genre
      genre.name
    end
  end


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def artist_name=(name)

    self.artist=Artist.find_or_create_by(name: name)
  end

  def note_contents=(input)
    input.each_with_index do |note,i|
      notes << Note.create(content: input[i])
    end
  end
  def note_contents
    notes.map{|note|note.content}
  end

  def note_contents=(items)
    items.each_with_index do |item,i|
      if item.length>=1
      notes << Note.create(content:items[i])
    end
    end
  end


end
