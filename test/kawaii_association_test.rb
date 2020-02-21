# frozen_string_literal: true

require "test_helper"

class KawaiiAssociationTest < ActiveSupport::TestCase
  sub_test_case 'has_many' do
    test 'it works' do
      Post.has_many do
        comments
      end

      assert_kind_of ActiveRecord::Reflection::HasManyReflection, Post.reflections['comments']
    end
  end

  sub_test_case 'has_one' do
    test 'it works' do
      Post.has_one do
        category dependent: :nullify
      end

      assert_kind_of ActiveRecord::Reflection::HasOneReflection, Post.reflections['category']
    end
  end

  sub_test_case 'belongs_to' do
    test 'it works' do
      Comment.belongs_to do
        post touch: true
      end

      assert_kind_of ActiveRecord::Reflection::BelongsToReflection, Comment.reflections['post']
    end
  end
end
