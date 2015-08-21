class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
  has_many :comments, dependent: :destroy

  belongs_to :author, class_name: "User"

  def comments_by_parent_id
    comment_hash = Hash.new { |h, k| h[k] = [] }

    comments.each do |comment|
      comment_hash[comment.parent_comment_id] << comment
    end

    comment_hash
  end
end
