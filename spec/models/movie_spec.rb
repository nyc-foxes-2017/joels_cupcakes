require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) {Movie.new}

  describe "validations" do
    describe "validation failure without presence of all attributes" do
      it "should make the movie require a title" do
        movie.valid?
        expect(movie.errors[:title]).to_not be_empty
      end

      it "should make the movie require a year" do
        movie.valid?
        expect(movie.errors[:year]).to_not be_empty
      end

      it "should make the movie require a genre" do
        movie.valid?
        expect(movie.errors[:director]).to_not be_empty
      end

      it "should make the movie require a director" do
        movie.valid?
        expect(movie.errors[:director]).to_not be_empty
      end

      it "should make the movie require a cast" do
        movie.valid?
        expect(movie.errors[:cast]).to_not be_empty
      end
    end
  end
end
