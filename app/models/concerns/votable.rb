module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def upvote!
    self.votes.create(value: 1)
  end

  def downvote!
    self.votes.create(value: -1)
  end

  def score
    self.votes.inject(0) { |score, vote| score + vote.value }
  end
end
