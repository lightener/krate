require './Krate.rb'

describe Krate do

	it "should count the files processed" do
		total = Krate.run
		total.should eq 3 #3 files in directory
	end

	it "should store the song info" do
		song = ID3Tag.new('song', 'test') #creates a new instance of ID3Tag
		song.title.should == ('test')
	end

	it "should rename the mp3 files" do
		songs = Dir.glob('*.mp3') #checks all mp3 files in directory
		songs.should include("Knight Riderz - Synthetic Seduction.mp3") #this is a test mp3
    end
end
