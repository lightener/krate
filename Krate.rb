class Krate
require './ID3Tag.rb'
## require "FileUtils" - commenting out for Travis
  


  def self.run
    success_count = 0
    fail_count = 0
    total_count = 0
    Dir.glob('*.mp3') do |song|
      file = File.new(song)
      file.seek(-128, IO::SEEK_END)
      tags = file.read
      tag_array = tags.unpack ("A3A30A30A30A4A30C1")
      tag = ID3Tag.new(tag_array[1], tag_array[2])
      artist = tag.artist
      title = tag.title
      file.close
      if !title.strip.empty? && !artist.strip.empty?
        File.rename(song, "#{title} - #{artist}.mp3")
        success_count = success_count + 1
      else
        ## FileUtils.mv(song, "Not_Renamed")
        fail_count = fail_count + 1
      end 
      total_count = (fail_count + success_count)
  end 
  return total_count
  print "There was a total of #{total_count} file(s) processed. Successfully renamed #{success_count} file(s) and moved #{fail_count} file(s) to be looked at."
end


  
end
