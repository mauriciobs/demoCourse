namespace :course do
    desc "populating database with 1 Course that contains 1 Book, 1 Instructor, and 15 Students"
    task :insert_course_data => :environment do
        course = Course.create(name: Faker::Educator.course_name)
        title = Faker::Book.title
        book = Book.where(title: title).take
        book = Book.create(title: Faker::Book.title, content: Faker::Lorem.paragraph) if !book
        CourseHasBook.create(course_id: course.id, book_id: book.id)
        instructor = User.create(name: Faker::Educator.course_name, email: Faker::Internet.email,role_id: 2)
        UserHasCourse.create(user_id: instructor.id, course_id: course.id)
        5.times { 
            student = User.create(name: Faker::Educator.course_name, email: Faker::Internet.email,role_id: 1)
            UserHasCourse.create(user_id: student.id, course_id: course.id)
            reading = ReadingTime.where(user_id: student.id, book_id: course.id).take
            if reading
                reading.times += 1
                reading.save
            else
                times = rand(1..10)
                ReadingTime.create(user_id: student.id, book_id: course.id, times: times)
            end
        }
    end
end