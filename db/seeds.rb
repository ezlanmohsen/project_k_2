# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # Creating Industry

Industry.destroy_all

Industry.create([
	{name: "Banking & Finance"},
	{name: "Energy"},
	{name: "Professional Services"},
	{name: "Consumer, Wholesale & Retail"},
	{name: "Telecommunications"},
	{name: "Information Technology"},
	{name: "Property & Development "},
	{name: "Transportation & Automotive"},
	{name: "Insurance"},
	{name: "Media & Broadcasting"},
	{name: "Public administration & Politics"},
	{name: "Education"},
	{name: "Health & Pharmacy"},
	{name: "Tourism & Hospitality"},
	{name: "Others"},
])

p "Seeded #{Industry.count} entries for Industry"

# #Seeding States
State.destroy_all

State.create([
	{name: "Perlis"},
	{name: "Kedah"},
	{name: "Penang"},
	{name: "Perak"},
	{name: "Kelantan"},
	{name: "Terengganu"},
	{name: "Pahang"},
	{name: "Selangor"},
	{name: "Kuala Lumpur"},
	{name: "Negeri Sembilan"},
	{name: "Melaka"},
	{name: "Johor"},
	{name: "Sarawak"},
	{name: "Sabah"},
	{name: "Labuan"},
])

p "Seeded #{State.count} entries for state"


# #Seeding University
University.destroy_all

University.create([
    {name: "Universiti Malaya"},
    {name: "Universiti Kebangsaan Malaysia"},
    {name: "Universiti Putra Malaysia"},
    {name: "Universiti Sains Malaysia"},
    {name: "Universiti Teknologi Malaysia"},
    {name: "Universiti Teknologi Petronas"},
    {name: "Lim Kok Wing university"},
    {name: "Taylor's University"},
    {name: "Help University"},
])

p "Seeded #{University.count} entries for university"


# #Seeding Topic
Topic.destroy_all

Topic.create([
    {name: "Arts & Culture"},
    {name: "Business & Finance"},
    {name: "Basic Sciences"},
    {name: "Economics"},
    {name: "Government & Politics"},
    {name: "Information Technology"},
    {name: "Sports & Recreation"},
    {name: "Media"},
    {name: "Education"},
    {name: "Entrepreneurship"}

])

p "Seeded #{Topic.count} entries for topic"


# #Seeding Skill
Skill.destroy_all

Skill.create([
    {name: "Writing"},
    {name: "Programming"},
    {name: "Marketing"},
    {name: "Communications"},
    {name: "Researching"},
    {name: "Project"},
    {name: "Management"},
    {name: "Analytics"},
    {name: "Inventing"}
])

p "Seeded #{Skill.count} entries for Skill"


# #Seeding Activity
Activity.destroy_all

Activity.create([
    {name: "Volunteering"},
    {name: "Sports"},
    {name: "Debating"},
    {name: "Student Association"},
    {name: "Travelling"},
    {name: "Entrepreneurship"},
    {name: "Civil Activism"}

])

p "Seeded #{Activity.count} entries for Activity"



# Seeding Jobseekers

Jobseeker.destroy_all

jobseeker = {}

ActiveRecord::Base.transaction do
  5000.times do 
    jobseeker['name'] = Faker::Name.name  
    jobseeker['email'] = Faker::Internet.email
    jobseeker['location'] = State.find(Faker::Number.between(1, 15))
    jobseeker['degree'] = Industry.find(Faker::Number.between(1, 15))
    jobseeker['university'] = University.find(Faker::Number.between(1, 9))
    jobseeker['cgpa'] = [2.01, 2.50, 3.00, 3.50, 3.61, 3.75, 3.83, 3.91].sample
    jobseeker['pref_size'] = ["Small", "Big"].sample
    jobseeker['pref_hours'] = ["Traditional", "Modern"].sample
    jobseeker['we1'] = Industry.find(Faker::Number.between(1, 15))
    jobseeker['we2'] = Industry.find(Faker::Number.between(1, 15))
    jobseeker['we3'] = Industry.find(Faker::Number.between(1, 15))
    jobseeker['knowledge_score'] = Faker::Number.between(30, 100)
    jobseeker['skill_score'] = Faker::Number.between(30, 100)
    jobseeker['activity_score'] = Faker::Number.between(30, 100)
    jobseeker['top_knowledge'] = Topic.find(Faker::Number.between(1, 10))
    jobseeker['top_skill'] = Skill.find(Faker::Number.between(1, 9))
    jobseeker['top_activity'] = Activity.find(Faker::Number.between(1, 7))
    jobseeker['ref_status_1'] = [0, 1].sample
    jobseeker['ref_status_2'] = [0, 1].sample
    Jobseeker.create(jobseeker)
  end
end 

p "Seeded #{Jobseeker.count} entries for Typical Jobseekers"

# Seeding  Advanced Jobseekers

jobseeker = {}

ActiveRecord::Base.transaction do
  2000.times do 
    jobseeker['name'] = Faker::Name.name  
    jobseeker['email'] = Faker::Internet.email
    jobseeker['location'] = State.find([8, 9].sample)
    jobseeker['degree'] = Industry.find([1, 2, 3, 4, 6, 7].sample)
    jobseeker['university'] = University.find(Faker::Number.between(1, 9))
    jobseeker['cgpa'] = [2.01, 2.50, 3.00, 3.50, 3.61, 3.75, 3.83, 3.91].sample
    jobseeker['pref_size'] = ["Small", "Big"].sample
    jobseeker['pref_hours'] = ["Traditional", "Modern"].sample
    jobseeker['we1'] = Industry.find([1, 2, 3, 4, 6, 7].sample)
    jobseeker['we2'] = Industry.find([1, 2, 3, 4, 6, 7].sample)
    jobseeker['we3'] = Industry.find([1, 2, 3, 4, 6, 7].sample)
    jobseeker['knowledge_score'] = Faker::Number.between(30, 100)
    jobseeker['skill_score'] = Faker::Number.between(30, 100)
    jobseeker['activity_score'] = Faker::Number.between(30, 100)
    jobseeker['top_knowledge'] = Topic.find([2, 4, 6, 10].sample)
    jobseeker['top_skill'] = Skill.find(Faker::Number.between(1, 9))
    jobseeker['top_activity'] = Activity.find(Faker::Number.between(1, 7))
    jobseeker['ref_status_1'] = 1
    jobseeker['ref_status_2'] = 1
    Jobseeker.create(jobseeker)
  end
end 

p "Seeded #{Jobseeker.count} entries for Advanced Jobseekers"




