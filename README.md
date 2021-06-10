# Twitter Many to many
## Goals
* Implement both sides of a many to many relationship
* Practice keeping groups of data related to classes on the class as a class variable
* Demonstrate single source of truth by not storing collections of objects on other objects
* Demonstrate single source of truth by not storing one object in multiple collections

How to follow along. We'll be reading through the specs as we write some code and test out the behavior. The `01_examples_spec.rb` file contains the rspec code we'll be running as we demonstrate what we know about relationships so far. The `02_exercise_spec.rb` file contains the rspec code you'll use when you work together to complete the many to many relationship between users and tweets in our twitter domain.

Relationships Checklist:

one-to-many: (example post has_many comments)
- comment belongs_to post -> comment has a method that returns the post it belongs to (stores a reference)
- post has_many comments -> post has a method that returns all of the comments that belong to it.

many-to-many: (doctor <=> appointment <=> patient)
- doctor has_many appointments
- doctor has_many patients, through appointments
- appointment belongs_to doctor
- appointment belongs_to patient 
- patient has_many appointments 
- patient has_many doctors, through appointments

appointments is the join model - it belongs to both other models

each model has many of the join model and many of the other, through the join model.