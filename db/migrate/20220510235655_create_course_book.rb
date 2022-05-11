class CreateCourseBook < ActiveRecord::Migration[6.1]
  def change
    
    create_table :courses do |t|
      t.string :name

      t.timestamps
    end

    create_table :books do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
    create_table :user_has_courses do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.references :course, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}

      t.timestamps
    end

    create_table :course_has_books do |t|
      t.references :course, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.references :book, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}

      t.timestamps
    end
    
    create_table :reading_times do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.references :book, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.integer :times

      t.timestamps
    end
  end
end
