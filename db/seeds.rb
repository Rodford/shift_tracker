puts "Cleaning out the old data..."
Task.destroy_all
Shift.destroy_all
User.destroy_all

puts "Creating a test user..."
test_user = User.create!(
  email: "admin@test.com",
  username: "AdminUser",
  password: "password123",
  password_confirmation: "password123"
)

puts "Creating some historic shifts and tasks..."
# Create 3 fake shifts in the past
3.times do |i|
  shift = test_user.shifts.create!(
    date: Date.today - i.days,
    shift_type: ["Morning", "Mid-Day", "Night"].sample,
    notes: "A standard shift. Everything went smoothly."
  )

  # Add a couple of tasks to each shift
  shift.tasks.create!(description: "Sanitize all countertops", is_completed: true, completed_at: Time.now)
  shift.tasks.create!(description: "Count the register till", is_completed: false)
end

puts "All done! The database is seeded."
puts "You can now log in with Email: admin@test.com | Password: password123"