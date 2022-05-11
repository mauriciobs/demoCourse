class Book < ApplicationRecord
    has_many :course_has_book
    has_many :reading_time
end