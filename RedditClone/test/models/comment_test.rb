# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :string           not null
#  author_id         :integer          not null
#  parent_comment_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  commentable_id    :integer
#  commentable_type  :string
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
