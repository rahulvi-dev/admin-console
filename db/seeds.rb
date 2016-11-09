# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    
    admin = User.create(:email => "super_admin@example.com" ,first_name: 'super admin',last_name: 'admin',password: 'password',password_confirmation: 'password')

    admin.skip_confirmation!

    admin.add_role :super_admin

    admin.save